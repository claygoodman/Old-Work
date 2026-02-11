--1272016


	DECLARE @SourcePath NVARCHAR(500)	--the data file path captured from registry
	DECLARE @DestPath NVARCHAR(500)
	DECLARE @ConnStr NVARCHAR(2000)
	DECLARE @RoboStr NVARCHAR(4000)
	DECLARE @OldDT DATE = GETDATE() -1
	DECLARE @DelDt VARCHAR(15)

	--EXEC sp_configure 'xp_cmdshell',1
	--RECONFIGURE
	SET @ConnStr = 'NET USE \\ddasql.liberty.fgpnet.com\brg_sql /u:liberty\bridgersqlbu "Br1g3r5QL"'
	SET @SourcePath = '\\10.150.62.79\SQLBackups\'
	SET @DestPath = '\\ddasql.liberty.fgpnet.com\brg_sql'
	SELECT @DelDt=  CAST(MONTH(@OldDT) AS VARCHAR) + CAST(DAY(@OldDT) AS VARCHAR) + CAST(YEAR(@OldDT) AS VARCHAR)

	SET @RoboStr = 'ROBOCOPY ' + @SourcePath + ' ' + @DestPath + ' *' + @DelDt  + '*'
	
	--EXEC xp_cmdshell @RoboStr
	--PRINT @ConnStr
	EXEC xp_cmdshell @ConnStr
	
	--PRINT @RoboStr
	EXEC xp_cmdshell @RoboStr

	SET @ConnStr = 'NET USE \\ddasql.liberty.fgpnet.com\brg_sql /DELETE'
	--PRINT @ConnStr
	EXEC xp_cmdshell @ConnStr
