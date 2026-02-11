SELECT 
       G.name AS FileGroupName
       ,F.name       AS DBFileName
       ,F.physical_name     AS DBFilePath
       --,data_space_id
       FROM sys.database_files F
       INNER JOIN sys.filegroups G ON F.data_space_id = G.data_space_id
       WHERE F.type = 0

