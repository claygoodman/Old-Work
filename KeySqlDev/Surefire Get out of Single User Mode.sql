

	USE master
	GO
	DECLARE @kill varchar(max) = '';
	SELECT @kill = @kill + 'KILL ' + CONVERT(varchar(10), spid) + '; '
	FROM master..sysprocesses 
	WHERE spid > 50 AND dbid = DB_ID('usc61_staging')
	EXEC(@kill);

	SET DEADLOCK_PRIORITY HIGH
	ALTER DATABASE usc61_staging SET MULTI_USER WITH NO_WAIT
	ALTER DATABASE usc61_staging SET MULTI_USER WITH ROLLBACK IMMEDIATE