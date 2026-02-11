	SELECT
           b.name  AS JobName 
           ,e.name
           ,e.path
         --  ,CAST(d.description AS VARCHAR)
          -- ,CAST(a.SubscriptionID AS VARCHAR)
          --  ,CAST(laststatus AS VARCHAR)
          --  ,CAST(eventtype AS VARCHAR)
       --     , date_modified
    FROM ReportServer.dbo.ReportSchedule a JOIN msdb.dbo.sysjobs b
            ON a.ScheduleID = b.name
            LEFT JOIN ReportServer.dbo.ReportSchedule c ON b.name = c.ScheduleID
            JOIN ReportServer.dbo.Subscriptions d ON c.SubscriptionID = d.SubscriptionID
            JOIN ReportServer.dbo.Catalog e ON d.report_oid = e.itemid
		--WHERE b.name LIKE  '%46F5BF2F-4E25-4274-A942-BE50FDD251DD%'
		WHERE e.Name = 'Sinclair Daily Tickets'
		
	--SELECT * FROM Catalog WHERE Name LIKE '%sinclair%'--Sinclair Daily Tickets
	
	SELECT * FROM ReportSchedule R INNER JOIN Subscriptions S ON R.SubscriptionID = S.SubscriptionID
	
	WHERE R.ReportID = '46F5BF2F-4E25-4274-A942-BE50FDD251DD'