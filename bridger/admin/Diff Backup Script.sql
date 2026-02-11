/*
	DIFFERENTIAL RUNS EVERY 2 Hours BETWEEN 1 AM AND 9 PM

*/


	DECLARE @dbname VARCHAR(500)		--database to backup
	DECLARE @SQL NVARCHAR (4000)		--backup string
	DECLARE @backupPath NVARCHAR(500)	--the data file path captured from registry

	DECLARE @BackupType VARCHAR(100)	
	DECLARE @Tbl TABLE(ID INT IDENTITY(1,1), dbname NVARCHAR(255))	--contains the database names
	DECLARE @cnt INT = 0, @loop INT = 1	--counters for backup loop
	DECLARE @HR INT

	DECLARE @NewDT DATE = GETDATE()
	DECLARE @SvDt VARCHAR(15)

	SET NOCOUNT ON
	IF EXISTS(SELECT * FROM tempdb.sys.objects WHERE object_id = OBJECT_ID('Tempdb.dbo.#tbl')) 
	DROP TABLE #Tbl
	
	SET @backupPath = '\\10.150.62.79\SQLBackups'
	SET @BackupType = ' WITH DIFFERENTIAL, CHECKSUM, COMPRESSION, STATS '
	SELECT @HR = DATEPART(HOUR,GETDATE())
	SELECT @SvDt= CAST(@HR AS VARCHAR)+ CAST(MONTH(@NewDT)AS VARCHAR) + CAST(DAY(@NewDT) AS VARCHAR) + CAST(YEAR(@NewDT)AS VARCHAR)


	INSERT INTO @Tbl(dbname) SELECT name FROM sys.databases WHERE database_id > 4 AND name NOT LIKE '%temp%' AND state = 0
	ORDER BY name
	SET @cnt = (SELECT MAX(ID) FROM @Tbl) 
	WHILE @loop <= @cnt
	BEGIN
		SET @dbname = (SELECT dbname FROM @Tbl WHERE ID = @loop)
		--*******************GENERATE A BACKUP STATEMENT AND RUN it

		SET @SQL = 'BACKUP DATABASE [' + @dbname + '] TO DISK = ' + CHAR(39) + @backupPath + '\'  + @dbname + '_' + 'Diff_' + @SvDt + '.bak' + CHAR(39)
		+ @BackupType
		+ 'RESTORE VERIFYONLY FROM DISK = ' + CHAR(39) + @backupPath + '\'  + @dbname + '_' + 'Diff_' + @SvDt + '.bak' + CHAR(39)

		EXEC sp_executesql @sql
		--PRINT @SQL
		SET @loop = @loop + 1
	END

