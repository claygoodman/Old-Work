SELECT * FROM sys.dm_os_wait_stats WHERE wait_time_ms > 0
AND wait_type LIKE  'SOS%'
ORDER BY wait_time_ms DESC