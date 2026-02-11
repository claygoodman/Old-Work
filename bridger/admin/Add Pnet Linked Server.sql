EXEC master.dbo.sp_addlinkedserver 
@server = 'PNETLINKSQL',@srvproduct = ''
,@provider = 'SQLNCLI'
,@datasrc = '10.223.96.28'
,@catalog = 'PNet'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = 'PNETLINKSQL'
,@Useself = 'FALSE'
,@rmtuser = 'RmtUser'
,@rmtpassword = 'p29xfuzfyq'



--EXEC master.dbo.sp_addlinkedserver @server = '@ServerName,@Port_nbr'
--, @srvproduct = N''
--, @datasrc = @ServerName
--, @provider = N'SQLOLEDB';
--END