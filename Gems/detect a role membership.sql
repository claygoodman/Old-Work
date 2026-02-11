WITH role_hierarchy
AS
(
SELECT
rm.member_principal_id,
rm.role_principal_id
FROM sys.database_role_members rm
WHERE
rm.role_principal_id = USER_ID('db_owner')
UNION ALL
SELECT
rm.member_principal_id,
rm.role_principal_id
FROM sys.database_role_members rm
JOIN role_hierarchy rh ON
rh.member_principal_id = rm.role_principal_id
)
SELECT 'is a member' FROM role_hierarchy rh
WHERE USER_NAME(rh.member_principal_id) = 'TX\svcsp14ca';


