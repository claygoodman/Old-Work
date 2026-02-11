DECLARE @tm varchar(20)
DECLARE @db varchar(100)
DECLARE @bustr nvarchar(2000)

EXEC xp_cmdshell 'DEL G:\SQLBackup\master*'

SET @tm = REPLACE(CONVERT (time,getdate()),':','')
SET @tm = REPLACE(@tm,'.','')
SET @db = 'master_' + REPLACE(CONVERT (date,getdate()),'-','')
	 + '_' +  LEFT(@tm,6) + '.bu'

SET @bustr = 'BACKUP DATABASE master TO DISK = ' 
	+ char(39)+ 'G:\SQLBackup\' + @db + CHAR(39)
EXEC sp_executesql @bustr
--PRINT @bustr
	
SET @bustr =  'RESTORE VERIFYONLY FROM DISK = ' + char(39) + 'G:\SQLBackup\' + @db + CHAR(39)

EXEC sp_executesql @bustr

--*******************************
--Process MSDB

EXEC xp_cmdshell 'DEL G:\SQLBackup\msdb*'

SET @db = 'msdb_' + REPLACE(CONVERT (date,getdate()),'-','')
	 + '_' +  LEFT(@tm,6) + '.bu'

SET @bustr = 'BACKUP DATABASE msdb TO DISK = ' 	+ char(39)+ 'G:\SQLBackup\' + @db + CHAR(39)
EXEC sp_executesql @bustr
--PRINT @bustr
	
SET @bustr =  'RESTORE VERIFYONLY FROM DISK = ' + char(39) + 'G:\SQLBackup\' + @db + CHAR(39)
--PRINT @bustr

EXEC sp_executesql @bustr

--********************************
--Process Model
EXEC xp_cmdshell 'DEL G:\SQLBackup\model*'

SET @db = 'model_' + REPLACE(CONVERT (date,getdate()),'-','')
	 + '_' +  LEFT(@tm,6) + '.bu'

SET @bustr = 'BACKUP DATABASE Model TO DISK = ' 
	+ char(39)+ 'G:\SQLBackup\' + @db + CHAR(39)
EXEC sp_executesql @bustr
--PRINT @bustr
	
SET @bustr =  'RESTORE VERIFYONLY FROM DISK = ' + char(39) + 'G:\SQLBackup\' + @db + CHAR(39)

EXEC sp_executesql @bustr
