-- Adjust the ORDER BY as needed (SQL Server 2005, 2008)
SELECT TOP 100
  total_worker_time/execution_count "AvgCPU",
  total_elapsed_time/execution_count "AvgDuration",
  (total_logical_reads + total_physical_reads)/execution_count "AvgReads",
  execution_count "ExecutionCount",
  SUBSTRING(st.text, (qs.statement_start_offset/2) + 1, 
            ((CASE qs.statement_end_offset  
                WHEN -1 THEN datalength(st.text)  
                ELSE qs.statement_end_offset  
              END - qs.statement_start_offset)/2) + 1) "StatementText",
  query_plan "ExecutionPlan"
FROM 
  sys.dm_exec_query_stats as qs  
CROSS APPLY
  sys.dm_exec_sql_text(qs.sql_handle) as st  
CROSS APPLY
  sys.dm_exec_query_plan (qs.plan_handle) as qp 
ORDER BY 
  AvgCPU DESC;
