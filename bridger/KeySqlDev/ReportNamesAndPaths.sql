SELECT
       Name,
       [Path]
	   ,LEFT([Path],CHARINDEX('/',RIGHT([Path],LEN([Path])-1))) AS RootPath
FROM [dbo].[Catalog]
WHERE [Type] = 2
ORDER BY [Path]
