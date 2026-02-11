SELECT  DB_Name() AS DB,OBJECT_NAME(O.parent_object_id)AS Tbl, S.name AS SchemaName, T.name   FROM sys.triggers T
INNER JOIN sys.objects O ON
T.object_id = O.object_id
INNER JOIN sys.schemas S ON
O.schema_id = S.schema_id

