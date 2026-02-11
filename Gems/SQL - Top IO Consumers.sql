-- (SQL Server 2005, 2008)
SELECT TOP 50
  (total_logical_reads + total_logical_writes) as "TotalLogicalIO", 
  (total_logical_reads/execution_count) as "AvgLogicalReads",
  (total_logical_writes/execution_count) as "AvgLogicalWrites",
  (total_physical_reads/execution_count) as "AvgPhysicalReads",
  substring(st.text, (qs.statement_start_offset/2) + 1, 
            ((CASE qs.statement_end_offset
                WHEN -1 THEN datalength(st.text)
                ELSE qs.statement_end_offset
              END - qs.statement_start_offset)/2) + 1) as "StatementText",
  *
FROM
  sys.dm_exec_query_stats as qs
CROSS APPLY
  sys.dm_exec_sql_text(qs.sql_handle) as st
ORDER BY
  TotalLogicalIO DESC;
