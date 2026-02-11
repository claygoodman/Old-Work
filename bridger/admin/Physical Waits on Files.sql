
DECLARE @dbID INT = (SELECT database_id FROM sys.databases WHERE name = 'test')

SELECT SDF.name, SDF.physical_name
,FilFats.num_of_reads, FilFats.io_stall_read_ms
,FilFats.num_of_writes, FilFats.io_stall_write_ms 
 FROM sys.database_files SDF
 CROSS APPLY
 sys.dm_io_virtual_file_stats(@dbID,SDF.file_id) FilFats
