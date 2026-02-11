-- read large numbers of rows (SQL Server 2005, 2008)
SELECT 
  SUBSTRING(st.text, (qs.statement_start_offset/2) + 1, 
            ((CASE qs.statement_end_offset  
                WHEN -1 THEN datalength(st.text)  
                ELSE qs.statement_end_offset  
              END - qs.statement_start_offset)/2) + 1) "StatementText",
  qs.execution_count, 
  qs.*, 
  p.* 
FROM
  sys.dm_exec_query_stats as qs 
CROSS APPLY
  sys.dm_exec_sql_text(sql_handle) st
CROSS APPLY
  sys.dm_exec_query_plan(plan_handle) p
WHERE 
  query_plan.exist('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/showplan";
/ShowPlanXML/BatchSequence/Batch/Statements//RelOp/@EstimateRows[. > 10000]') = 1;
