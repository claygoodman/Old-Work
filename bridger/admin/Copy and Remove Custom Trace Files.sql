DECLARE @killPath NVARCHAR(1000)= 'DEL "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Log\tmw*.trc"'		
DECLARE @CopyPath NVARCHAR(1000)= 'XCOPY "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Log\tmw*.trc" "L:\OldTraceFiles" '
DECLARE @DelDate VARCHAR(20) =  CONVERT(VARCHAR,GETDATE()-1,110)
DECLARE @cnt INT, @MaxCnt INT, @SQL NVARCHAR(2000)

DECLARE @Tbl TABLE(ID INT)
INSERT @Tbl(ID) SELECT  id FROM sys.traces WHERE path LIKE '%tmw%'
SELECT @cnt = MIN(ID) FROM @Tbl
SELECT @MaxCnt = MAX(ID) FROM @Tbl

-- address multiple tmw traces running concurrently
WHILE @cnt <= @MaxCnt
	BEGIN
		SET @SQL = 'EXEC sp_trace_setstatus ' + CAST(@cnt AS VARCHAR) +',0'
		EXEC sp_executesql @SQL
		SET @SQL = 'EXEC sp_trace_setstatus ' + CAST(@cnt AS VARCHAR)  + ',2'
		EXEC sp_executesql @SQL
		SET @cnt = @cnt + 1
	END	
--Copy and Kill
SET @CopyPath = @CopyPath + '/d:' + @DelDate + '/y'
EXEC xp_cmdshell @CopyPath
EXEC xp_cmdshell @killpath

--Start the tmw trace again
EXEC dbo.tmw_runtrace @trace_file_folder = 'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\Log', 
 @trace_runtime_in_min = 1440, @trace_filter_duration_in_ms = 2000, @completed_events = 1, @errors_warnings = 0, @deadlocks = 1


