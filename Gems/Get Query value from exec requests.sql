USE master 
GO 
SELECT DB_NAME(database_id) AS [Database], [text] AS [Query]  
FROM sys.dm_exec_requests r 
CROSS APPLY sys.dm_exec_sql_text(r.plan_handle) st 
WHERE session_Id > 50           -- Consider spids for users only, no system spids. 
AND session_Id NOT IN (@@SPID)