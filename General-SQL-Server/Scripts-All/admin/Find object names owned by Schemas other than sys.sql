 
 SELECT OBJECT_NAME(object_id) FROM sys.objects WHERE schema_ID = 
 (SELECT schema_id FROM sys.schemas  
 WHERE schema_id < 16384 AND schema_id > 3
  AND name <> 'sys') 

