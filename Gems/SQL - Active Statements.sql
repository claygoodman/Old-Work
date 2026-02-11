-- (SQL Server 2005, 2008)
SELECT 
  er.session_id "SessionID" ,
  DB_NAME(er.database_id) "DatabaseName",
	sp.login_name "LoginName",
  sp.nt_user_name "NTUserName",
	er.command "Command",
	er.start_time "StartTime",
	DATEDIFF(second, er.start_time, GETDATE()) "Duration",
  er.status "Status",
  er.wait_type "WaitType",
	CASE 
	  WHEN er.blocking_session_id = -2
	    THEN 'Orphaned distributed transaction'
	  WHEN er.blocking_session_id = -3
		  THEN 'Deferred recovery transaction'
	  WHEN er.blocking_session_id = -4
		  THEN 'Unknown'
		ELSE
		  CAST(er.blocking_session_id AS VARCHAR(5))
		END "BlockingSessionID",
  SUBSTRING(qt.text, er.statement_start_offset/2,
    (CASE WHEN er.statement_end_offset = -1 
       THEN LEN(CONVERT(NVARCHAR(MAX), qt.text)) * 2 
     ELSE er.statement_end_offset END 
		 - er.statement_start_offset)/2) "SQL",
  qt.text "Batch",
  sp.program_name "ProgramName",
  sp.host_name "HostName",
  sp.nt_domain "NTDomain"
FROM 
  sys.dm_exec_requests er WITH (NOLOCK)
INNER JOIN
  sys.dm_exec_sessions sp WITH (NOLOCK)
ON er.session_id = sp.session_id
CROSS APPLY 
  sys.dm_exec_sql_text(er.sql_handle) as qt
WHERE 
  er.session_id > 50
AND 
  er.session_id != @@SPID
ORDER BY 1, 2;
