-- (SQL Server 2005, 2008)
SELECT TOP 50
  CAST(qs.total_worker_time / execution_count / 1000.0 AS DECIMAL(20, 3)) "AvgWorkerTime(ms)",
  substring(st.text, (qs.statement_start_offset/2) + 1, 
            ((CASE qs.statement_end_offset
                WHEN -1 THEN datalength(st.text)
                ELSE qs.statement_end_offset
              END - qs.statement_start_offset)/2) + 1) "StatementText",
  *
FROM
  sys.dm_exec_query_stats as qs
CROSS APPLY 
  sys.dm_exec_sql_text(qs.sql_handle) as st
ORDER BY
  [AvgWorkerTime(ms)] DESC;
