SELECT object_name(a.object_id) AS object_name,
 a.index_id,
 b.name,
 b.type_desc,
 a.partition_number,
 a.avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, 'LIMITED') a
JOIN sys.indexes b on a.object_id = b.object_id and a.index_id = b.index_id
WHERE OBJECT_NAME(a.object_id) = 'auditrecord_primarypartition'
order by object_name(a.object_id), a.index_id, b.name, b.type_desc, a.partition_number