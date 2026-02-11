	BEGIN TRY
	--PUT CODE HERE
	SELECT 1/0

	END TRY

	BEGIN CATCH 
		DECLARE @Bod NVARCHAR(MAX) 
		DECLARE @HTbl NVARCHAR(MAX)
		DECLARE @ErrorProcedure NVARCHAR(512) = CAST(
													 ERROR_PROCEDURE() AS NVARCHAR
													 );
		DECLARE @ErrorNumber NVARCHAR(256) = CAST(
												  ERROR_NUMBER() AS NVARCHAR
												  );
		DECLARE @ErrorLine NVARCHAR(256) = CAST(
												ERROR_LINE() AS NVARCHAR
												);
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity NVARCHAR(256) = CAST(
													ERROR_SEVERITY() AS NVARCHAR
													);
		DECLARE @ErrorState NVARCHAR(256) = CAST(
												 ERROR_STATE() AS NVARCHAR
												 );
		
		IF @ErrorProcedure IS NULL 
			SET @ErrorProcedure = 'No Proc'

		SET @HTbl = 
				'<tr><th>' + @ErrorProcedure +' </th><th>' + @ErrorNumber
				+' </th><th>' + @ErrorLine +' </th><th>' + @ErrorMessage
				+' </th><th>' +  @ErrorSeverity +' </th><th>' + @ErrorState


			SET @Bod = '<html><body>
			<table border = 1>
			<tr><th> Error Procedure</th><th> Error Number </th><th> Error Line ID</th><th> Error Message</th><th> ErrorSeverity </th><th>Error State</th></tr>'
			+ @HTbl 
				+ '</table></body></html>'

 			EXEC msdb.dbo.sp_send_dbmail
			@recipients =  'don.goodman@pilottravelcenters.com;daniel.newman@pilottravelcenters.com'
			,@Subject = 'Error Message'
			,@body_format = 'HTML' 
			,@body = @Bod

	END CATCH  
