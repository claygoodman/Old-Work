DECLARE @RC int, @TraceID int, @on BIT, @MaxFileSize BIGINT, @FileCount INT
SET @MaxFileSize = 2000
SET @FileCount = 20
--sp_trace_create @TraceID OUTPUT, @options, @tracefile, @maxfilesize, @stoptime, @filecount
EXEC @rc = sp_trace_create @TraceID output, 2, N'C:\SQLBackup\DurationTrace', @MaxFileSize, NULL, @FileCount

-- Select the return code to see if the trace creation was successful.
SELECT RC = @RC, TraceID = @TraceID

-- Set the events and data columns you need to capture.
SELECT @on = 1

--CREATE EVENTS

-- 10 is RPC:Completed event 
EXEC sp_trace_setevent @TraceID, 10, 1, @on 	--RPC: Completed textdata
EXEC sp_trace_setevent @TraceID, 10, 13,@on	--RPC:Completed duration
EXEC sp_trace_setevent @TraceID, 10, 8, @on	--RPC:Completed HostName

-- 12 is SQL:BatchCompleted
EXEC sp_trace_setevent @TraceID, 12, 15, @on 	--batch completed end time
EXEC sp_trace_setevent @TraceID, 12, 13, @on	--batch completed duration
EXEC sp_trace_setevent @TraceID, 12, 1, @on	--textData


-- 13 is SQL:BatchStarting
EXEC sp_trace_setevent @TraceID, 13, 14, @on 	--start time

--ADD A FILTER
--@TraceID, @ColumnID, @Logical_Operator, @comparison_operator, @value
EXEC sp_trace_setfilter @TraceID, 35, 0, 6, N'%SRP_DB%'

--EXEC sp_trace_setfilter 1, 10, 0, 6, N'%Profiler%'
--sp_trace_setfilter  1, 10, 0, 6, N'SQLT%';
--sp_trace_setfilter  1, 10, 0, 6, N'MS%';
--sp_trace_setfilter  1, 11, 0, 0, N'joe';



-- Start Trace (status 1 = start)
EXEC @RC = sp_trace_setstatus @TraceID, 1