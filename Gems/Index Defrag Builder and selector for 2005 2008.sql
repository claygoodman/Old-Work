DECLARE  @Tstats TABLE (xStats VARCHAR(500) NULL) 

INSERT INTO @Tstats (xStats)
--get the stats on 2005 or 2008
SELECT 'UPDATE STATISTICS [' + CAST(sys.schemas.name AS VARCHAR(100)) + '].[' +
CAST(sys.objects.name AS VARCHAR(100)) + '] [' + sys.indexes.name +']'
FROM sys.schemas, sys.objects INNER JOIN sys.indexes   
ON sys.objects.object_id = sys.indexes.object_id
WHERE sys.indexes.index_id > 0 AND sys.indexes.index_id < 255 --AND (sys.indexes.status & 64)=0
AND sys.objects.type NOT IN ('S', 'PK', 'V', 'P','F','D','FN','X','TF','IF','IT') 
AND sys.objects.name <> 'dtproperties'
AND sys.objects.schema_id = sys.schemas.schema_id 
ORDER BY sys.schemas.name, sys.objects.name

SELECT * FROM @Tstats

--build the defrags 0n 2005/08
DECLARE  @Dfrags TABLE (xDBCC VARCHAR(500) NULL) 

INSERT INTO @Dfrags (xDBCC)
SELECT 'ALTER INDEX ['+ sys.indexes.name +'] ON [' 
+ CAST(sys.schemas.name AS VARCHAR(100))
+ '].['
+ CAST(sys.objects.name AS VARCHAR(100)) 
+'] REORGANIZE WITH (LOB_COMPACTION = ON)'
FROM sys.objects INNER JOIN sys.indexes 
ON sys.objects.object_id = sys.indexes.object_id
INNER JOIN  sys.schemas ON sys.objects.schema_id = sys.schemas.schema_id
WHERE sys.indexes.index_id > 0 AND sys.indexes.index_id < 255 --AND (sys.indexes.status & 64)=0
AND sys.objects.type NOT IN ('S', 'PK', 'V', 'P','F','D','FN','X','TF','IF','IT') 
AND sys.objects.name <> 'dtproperties'
ORDER BY sys.objects.name

SELECT * FROM @Dfrags
