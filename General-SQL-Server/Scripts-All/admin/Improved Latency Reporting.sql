SELECT 
DB_NAME(vfs.database_id) AS DBName
 ,LEFT ([mf].[physical_name], 2) AS [Drive]
  ,RIGHT(mf.physical_name,3) AS [FileType]
,[mf].[physical_name]
,io_stall_write_ms/num_of_writes AS [Waits Per Write]
,io_stall_read_ms/num_of_reads AS [Waits Per Read]
,io_stall / (num_of_reads + num_of_writes) AS [Combined Latency]
,((num_of_bytes_read + num_of_bytes_written) /
                (num_of_reads + num_of_writes)) AS [Average Transfer Bytes]
,io_stall_write_ms
,num_of_writes
,io_stall_read_ms
,num_of_reads
FROM
    sys.dm_io_virtual_file_stats (NULL,NULL) AS [vfs]
JOIN sys.master_files AS [mf]
    ON [vfs].[database_id] = [mf].[database_id]
    AND [vfs].[file_id] = [mf].[file_id]
 WHERE num_of_writes <> 0
 --AND vfs.database_id > 4
 AND DB_NAME(vfs.database_id) = 'tempdb'
 ORDER BY DBName ASC,[Combined Latency] DESC,[Waits Per Write] DESC,[Waits Per Read] DESC