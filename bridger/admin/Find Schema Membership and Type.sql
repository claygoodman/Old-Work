exec sp_executesql N'SELECT
grantee_principal.name AS [Grantee],
CASE grantee_principal.type WHEN ''R'' THEN 3 WHEN ''A'' THEN 4 ELSE 2 END - CASE ''database'' WHEN  ''database'' THEN 0 ELSE 2 END AS [GranteeType]
FROM
sys.schemas AS s
INNER JOIN sys.database_permissions AS prmssn ON prmssn.major_id=s.schema_id AND prmssn.minor_id=0 AND prmssn.class=3
INNER JOIN sys.database_principals AS grantee_principal ON grantee_principal.principal_id = prmssn.grantee_principal_id
WHERE
(s.name=@_msparam_0)',N'@_msparam_0 nvarchar(4000)',@_msparam_0=N'test'