DECLARE @dbname VARCHAR(500)		--database to backup
DECLARE @SQL NVARCHAR (4000)		--backup string
DECLARE @backupPath NVARCHAR(500)	--the data file path captured from registry
DECLARE @cmdFlag CHAR(1) = 'D'		--holds state of xp_cmdshell
DECLARE @out VARCHAR(100)			--output from regread
DECLARE @dy date					--day to delete 
DECLARE @killPath VARCHAR(500)		--delete string; kill any file older than 2 weeks
DECLARE @BackupType VARCHAR(100)	--full on Sundays, diff on other days
DECLARE @BackupFlag CHAR(1)			--flags: F = Full, D = Differential
DECLARE @BackupDate DATE			--date of the backup
DECLARE @Tbl TABLE(ID INT IDENTITY(1,1), dbname NVARCHAR(255))	--contains the database names
DECLARE @cnt INT = 0, @loop INT = 1	--counters for backup loop
DECLARE @wk INT						--week number
DECLARE @day VARCHAR(20)			--day name
DECLARE @Svr NVARCHAR(75)			--server name
--*****************PREP THE ENVIRONMENT***********
SET NOCOUNT ON
CREATE TABLE #tbl(name sysname, mini int, maxi int, conf int, runv int)	--contains the information from sp_configure
INSERT INTO #tbl EXEC sp_configure

IF (
SELECT runv FROM #tbl WHERE name = 'xp_cmdshell') <> 1 
BEGIN
	SET @cmdflag = 'E'
	EXEC sp_configure 'xp_cmdshell',1
	RECONFIGURE
END
DROP TABLE #tbl
/*
--DEFINE a Week and rebuild the backup path to fit into week 1 - 4
--Load the full and any difs for that week into the correct one.
Possible weeks: \\pesci\LBHIBACKUP1\LBHI\MONTHLY\ 
+ WEEK1
+ WEEK2
+ WEEK3
+ WEEK4
Possible Days are: SUN, MON, TUES, WED, THUR, FRI, SAT
I added SUN to handle full backups when the system is at low use
*/
--GET THE SERVER INTO THE BACKUP NAME
SET @Svr = (SELECT @@SERVERNAME)

SELECT @wk = DATEPART(DAY,DATEDIFF(DAY,0,GETDATE()))/7 + 1
SELECT @day = DATENAME(dw,getdate())
SET @day = 
 CASE
	WHEN @day = 'SUNDAY' THEN 'SUN'
	WHEN @day = 'MONDAY' THEN 'MON'
	WHEN @day = 'TUESDAY' THEN 'TUES'
	WHEN @day = 'WEDNESDAY' THEN 'WED'
	WHEN @day = 'THURSDAY' THEN 'THUR'
	WHEN @day = 'FRIDAY' THEN 'FRI'
	WHEN @day = 'SATURDAY' THEN 'SAT'
END

SET @backupPath =
 CASE @wk
	WHEN 1 THEN  ISNULL(@backupPath , '\\pesci\LBHIBACKUP1\LBHI\MONTHLY\WEEK1\'+ @day)
	WHEN 2 THEN ISNULL(@backupPath , '\\pesci\LBHIBACKUP1\LBHI\MONTHLY\WEEK2\'+ @day)
	WHEN 3 THEN ISNULL(@backupPath , '\\pesci\LBHIBACKUP1\LBHI\MONTHLY\WEEK3\'+ @day)
	WHEN 4 THEN ISNULL(@backupPath , '\\pesci\LBHIBACKUP1\LBHI\MONTHLY\WEEK4\'+ @day)
	ELSE ISNULL(@backupPath , '\\pesci\LBHIBACKUP1\LBHI\MONTHLY\WEEK4\'+ @day)
END




--DATE TO PREPEND TO THE BACKUP STRING
--Use the Day Name to decide if it is a full or a diff
SET @BackupDate = getdate()

IF DATENAME(dw,getdate()) = 'Sunday' 
BEGIN
	SET @BackupType = ' WITH INIT, SKIP, CHECKSUM, COMPRESSION, STATS '
	SET @BackupFlag = 'F'
END
ELSE
BEGIN
	SET @BackupType = ' WITH DIFFERENTIAL, INIT, SKIP, CHECKSUM, COMPRESSION, STATS '
	SET @BackupFlag = 'D'
END

--PREP THE DELETE STATEMENTS 
--delete any files older than 38 days. this leaves a month on the backup server for any month of 31 days or shorter
--there will be straggler differentials present but they take less space and will deleted shortly after end-of-month
SET @dy = GETDATE() - 38

INSERT INTO @Tbl(dbname) SELECT name FROM sys.databases WHERE database_id > 4 AND name NOT LIKE '%temp%' AND name NOT LIKE '%restore%' ORDER BY name
SET @cnt = (SELECT MAX(ID) FROM @Tbl) 
WHILE @loop <= @cnt
BEGIN
	SET @dbname = (SELECT dbname FROM @Tbl WHERE ID = @loop)
	--*******************GENERATE A DELETE AND A BACKUP STATEMENT AND RUN THEM

	--delete 
	SET @killPath = 'DEL ' + @backupPath + '\?_' + CAST(@dy AS VARCHAR) + '_' + @dbname + '.bak'

	SET @SQL = 'BACKUP DATABASE [' + @dbname + '] TO DISK = ' + CHAR(39) + @backupPath + '\' + @Svr + '_' + @BackupFlag + '_'  + CAST(@Backupdate AS VARCHAR) + '_' + @dbname + '.bak' + CHAR(39)
	+ @BackupType
	+ 'RESTORE VERIFYONLY FROM DISK = ' + CHAR(39) + @backupPath + '\' + @Svr + '_' + @BackupFlag + '_' + CAST(@Backupdate AS VARCHAR) + '_' + @dbname + '.bak' + CHAR(39)

	EXEC xp_cmdshell @killpath
	EXEC sp_executesql @sql
	--PRINT @killpath
	--PRINT @SQL
	SET @loop = @loop + 1
END

--reset the environment

IF @cmdFlag = 'E' 
BEGIN
	EXEC sp_configure 'xp_cmdshell',0
	RECONFIGURE
END
