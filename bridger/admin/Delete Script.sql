
	DECLARE @backupPath NVARCHAR(500)	--the data file path captured from registry
	DECLARE @DelStr NVARCHAR(4000)
	DECLARE @OldDT DATE = GETDATE() -2
	DECLARE @DelDt VARCHAR(15)

	--EXEC sp_configure 'xp_cmdshell',1
	--RECONFIGURE

	SET @backupPath = '\\10.150.62.79\SQLBackups'
	SELECT @DelDt=  CAST(MONTH(@OldDT) AS VARCHAR) + CAST(DAY(@OldDT) AS VARCHAR) + CAST(YEAR(@OldDT) AS VARCHAR)

	SET @DelStr = 'DEL ' + @backupPath + + '\'  + '*' + @DelDt  + '.*' 
	EXEC xp_cmdshell @DelStr
	--PRINT @DelStr
