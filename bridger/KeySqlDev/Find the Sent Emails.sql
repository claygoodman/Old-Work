SELECT recipients,copy_recipients,blind_copy_recipients,subject,body,file_attachments
,sent_date
FROM msdb.dbo.sysmail_sentitems 
ORDER BY sent_date DESC

SELECT * FROM msdb.dbo.sysmail_faileditems ORDER BY sent_date DESC
