select 'DROP LOGIN [' +  name + '];'
from sys.server_principals 
WHERE name NOT IN ('sa','public','sysadmin','securityadmin','serveradmin','setupadmin','processadmin','diskadmin'
,'dbcreator','bulkadmin','##MS_SQLResourceSigningCertificate##','##MS_SQLReplicationSigningCertificate##'
,'##MS_SQLAuthenticatorCertificate##','##MS_PolicySigningCertificate##'
,'##MS_SmoExtendedSigningCertificate##','##MS_PolicyTsqlExecutionLogin##'
,'##MS_PolicyEventProcessingLogin##','##MS_AgentSigningCertificate##'
,'NT AUTHORITY\SYSTEM','NT SERVICE\MSSQLSERVER','NT SERVICE\SQLSERVERAGENT'
,'NT AUTHORITY\NETWORK SERVICE','BRIDGERGROUP\SQL_ADMIN'
,'BRIDGERGROUP\RA_D_SQL_AGT','BRIDGERGROUP\dnewman'
,'BRIDGERGROUP\sapplefeld','SAPPLEFELD','MAPPLEFELD','DSCHILLINGER'
,'BPORTER''JCOLNAGHI','TTRZECIAK','TOTALMAIL','GPTTRZECIAK','ASRTEST'
,'ReportRunner','RGMonitor','Bporter','BRIDGERGROUP\sql_mon'
,'BRIDGERGROUP\khussain','BRIDGERGROUP\bporter','BRIDGERGROUP\mapplefeld'
,'KHUSSAIN','DNEWMAN','TMWADMIN','guest','MMM','TMW'

) ORDER BY name