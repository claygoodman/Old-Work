

--BACKUP LOG TMW_Live TO DISK = 'L:\SQLBackups\TMW_LIVE.LAK'
--WITH CHECKSUM, COMPRESSION, STATS



/*
	LOG RUNS EVERY 30 minutes  BETWEEN 12 AM AND 11 PM

*/


	DECLARE @dbname VARCHAR(500)		--database to backup
	DECLARE @SQL NVARCHAR (4000)		--backup string
	DECLARE @backupPath NVARCHAR(500)	--the data file path captured from registry
	DECLARE @DelStr NVARCHAR(4000)

	DECLARE @BackupType VARCHAR(100)	
	DECLARE @Tbl TABLE(ID INT IDENTITY(1,1), dbname NVARCHAR(255))	--contains the database names
	DECLARE @cnt INT = 0, @loop INT = 1	--counters for backup loop
	DECLARE @HR INT, @MIN INT
	
	DECLARE @NewDT DATE = GETDATE()
	DECLARE @SvDt VARCHAR(15)
	
	SET @backupPath = '\\10.150.62.79\SQLBackups'
	SET @BackupType = ' WITH CHECKSUM, COMPRESSION, STATS '
	SELECT @HR = DATEPART(HOUR,GETDATE()), @MIN = DATEPART(MINUTE,GETDATE())
	SELECT @SvDt= CAST(@HR AS VARCHAR)+ CAST(@MIN AS VARCHAR)+ CAST(MONTH(@NewDT)AS VARCHAR) + CAST(DAY(@NewDT) AS VARCHAR) + CAST(YEAR(@NewDT)AS VARCHAR)

	INSERT INTO @Tbl(dbname) SELECT name FROM sys.databases WHERE database_id > 4 AND name NOT LIKE '%temp%' 
	AND name NOT LIKE '%Staging%' AND name NOT LIKE '%vusion%' AND state = 0
	ORDER BY name
	SET @cnt = (SELECT MAX(ID) FROM @Tbl) 
	WHILE @loop <= @cnt
	BEGIN
		SET @dbname = (SELECT dbname FROM @Tbl WHERE ID = @loop)

		SET @SQL = 'BACKUP LOG [' + @dbname + '] TO DISK = ' + CHAR(39) + @backupPath + '\'  + @dbname + '_' + @SvDt  + '.LAK' + CHAR(39)
		+ @BackupType
		+ 'RESTORE VERIFYONLY FROM DISK = ' + CHAR(39) + @backupPath + '\'  + @dbname + '_' + @SvDt	 + '.LAK' + CHAR(39)

		EXEC sp_executesql @sql
		--PRINT @SQL
		SET @loop = @loop + 1
	END

