
--DIFFERENTIAL CODE SCHEDULES

/*
COMMON TASKS:
F - Th
final differential at 11:50 AM with the dir flip
jb_BackupTLS2D_F_Th_1150A	Done

Hot Times: 1 job for thrs and fri.
Thrs: 1 am, 3 AM, 5 am, 7 am, 9 am, 11 am
Fri: 1 am, 3 am, 5 am, 7 am, 9 am, 11 am
Thrs: 3 PM, 5 PM, 7 PM, 9 PM, 11 PM, 


jb_BackupTLS2D_Th_F_1AtoF11A	Done
jb_BackupTLS2D_Th_3Pto11P	DONE

Standard Times
fri - wed. - 1 job
4 pm, 8 pm
jb_BackupTLS2D_F_W_4Pto8P	Done

Sat - Wed -1 job
12 AM, 4 am, 8 am
jb_BackupTLS2D_StoW_12Ato8A	Done

total of 4 jobs for differential work

*/

DECLARE @day varchar(20)
DECLARE @tm varchar(20)
DECLARE @db varchar(100)
DECLARE @bustr nvarchar(2000)

SET @day = 
CASE Day(Getdate())
	WHEN 1 THEN 'Sun'
	WHEN 2 THEN 'Mon'
	WHEN 3 THEN 'Tue'
	WHEN 4 THEN 'Wed'
	WHEN 5 THEN 'Thu'
	WHEN 6 THEN 'Fri'
	WHEN 7 THEN 'Sat'
END

SELECT @day

SET @tm = REPLACE(CONVERT (time,getdate()),':','')
SET @tm = REPLACE(@tm,'.','')
SET @db = 'TLS2_' + @day +'_' + REPLACE(CONVERT (date,getdate()),'-','')  + '_' +  LEFT(@tm,6) + '.bu'

SET @bustr = 'BACKUP DATABASE [TLS2] TO DISK = ' 	+ char(39)+ 'G:\SQLBackup\' + @db + CHAR(39)
+ ' WITH DIFFERENTIAL, CHECKSUM, COMPRESSION'	
EXEC sp_executesql @bustr

	
SET @bustr =  'RESTORE VERIFYONLY FROM DISK = ' + char(39) + 'G:\SQLBackup\' + @db + CHAR(39)
EXEC sp_executesql @bustr
