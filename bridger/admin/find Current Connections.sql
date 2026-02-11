SELECT 
Sp.SPID
,Sp.Status
,Sp.HostName
,Sp.Loginame
,Sp.Blocked
,DB_NAME(Sp.DBID) as [Database]
,Sp.[Program_Name]
,Sp.Login_Time
,Sp.Last_Batch
,Sp.[sql_handle]
,s2.text 
FROM sys.sysprocesses sp 
CROSS APPLY Sys.Dm_Exec_Sql_Text(Sp.Sql_Handle) As S2 
WHERE SP.spid > 50 
AND DB_NAME(Sp.DBID) = 'TMW_Live' --AND sp.blocked <> 0
ORDER BY Sp.loginame
