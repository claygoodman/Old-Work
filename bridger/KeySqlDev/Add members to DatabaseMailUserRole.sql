EXEC msdb.dbo.sp_addrolemember @rolename = 'DatabaseMailUserRole'
    ,@membername = 'BRIDGERGROUP\dgoodman';
GO