USE msdb
SELECT
@@SERVERNAME 
,BS.media_set_id
,BS.backup_start_date
,BS.type
,BS.database_name
,BMF.physical_device_name 
FROM 
msdb.dbo.backupset AS BS WITH (NOLOCK) 
INNER JOIN msdb.dbo.backupmediafamily AS BMF WITH (NOLOCK) ON BS.media_set_id = BMF.media_set_id 
WHERE 
--BS.database_name = 'TMW_LIVE'
--AND 
BS.type = 'D' 
AND BS.is_copy_only = 0
AND CHARINDEX(BS.type,'DIL') > 0
ORDER BY backup_start_date DESC
