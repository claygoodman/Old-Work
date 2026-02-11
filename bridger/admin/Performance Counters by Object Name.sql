
SELECT 
[object_name], [counter_name], [instance_name]
, [cntr_value], [cntr_type]
FROM sys.dm_os_performance_counters
WHERE cntr_value > 0
ORDER BY object_name, cntr_type