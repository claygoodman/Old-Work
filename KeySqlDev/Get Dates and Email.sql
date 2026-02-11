	DECLARE @Q NVARCHAR(MAX) =
	'DECLARE @Tbl TABLE(Source VARCHAR(100),LateDate DATE)
	INSERT @Tbl(Source,LateDate)
	SELECT '+ CHAR(39) +  'History' + CHAR(39) + ', MAX(EventDate) FROM Storage.dbo.History
	INSERT @Tbl(Source,LateDate)
	SELECT ' + CHAR(39)+ 'OERRollup' + CHAR(39) + ', MAX(EventDate) FROM Storage.dbo.OERRollup
	INSERT @Tbl(Source,LateDate)
	SELECT ' + CHAR(39) + 'SpeedAlarms' + CHAR(39) + ', MAX(EventDate) FROM Storage.dbo.SpeedAlarms
	INSERT @Tbl(Source,LateDate)
	SELECT ' + CHAR(39) + 'LatLonRollups' + CHAR(39) + ', MAX(EventDate) FROM Storage.dbo.LatLonRollups
	INSERT @Tbl(Source,LateDate)
	SELECT ' + CHAR(39) + 'SuddenAlarms' + CHAR(39) + ', MAX(EventDate) FROM Storage.dbo.SuddenAlarms

	SELECT * FROM @Tbl'   
	
	SELECT @Q  

	--EXEC msdb.dbo.sp_send_dbmail   
	--@recipients = 'dgoodman@bridgergroup.com',      
	--@subject = 'Daily Latest Pnet Dates in Storage', 
	--@query = @Q      
	
