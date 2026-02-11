--put variants of this in jobs on schedules
DECLARE @RC int
EXEC @RC = sp_trace_setstatus 2, 0	--stop trace
SELECT @RC
EXEC @RC = sp_trace_setstatus 2, 2 --kill trace
SELECT @RC

--SELECT * FROM fn_trace_geteventinfo (2)

SELECT ID FROM sys.traces WHERE Path = 'C:\SQLBackup\DurationTrace.trc'