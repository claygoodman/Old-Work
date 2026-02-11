--this query finds all the fragmentation of indexes in a database

USE test;

SELECT SI.name as NM
,FizFats.index_id AS IDXID
,FizFats.index_type_desc
,FizFats.avg_fragmentation_in_percent
,FizFats.fragment_count
FROM sys.dm_db_index_physical_stats (NULL, NULL, NULL, NULL, NULL) FizFats
INNER JOIN sys.databases DB ON
FizFats.database_id = DB.database_id
INNER JOIN sys.tables ST 
ON ST.object_id = FizFats.object_id
INNER JOIN sys.indexes SI 
ON SI.index_id = FizFats.index_id
WHERE db.name = 'test'
AND SI.Name NOT IN ('clst','clust','cl','nc','nc1','nc2','nc3')
AND FizFats.avg_fragmentation_in_percent > 0
