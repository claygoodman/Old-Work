	/**************************************************COMMENTS****************************************
	Bridger et al
	dgoodman
	7/27/2018

	While developing set @PreviewOutput = 1 to preview results as query results. When you are ready to
	send mail change @PreviewOutput = 0 to enable the send_dbmail procedure to fire.

	***************************************************DECLARATIONS****************************************/

	DECLARE @PreviewOutput BIT = 1;
	DECLARE @Description VARCHAR(500)
	DECLARE @ColHeaderBGColor VARCHAR(7) = '#1152a9'; -- Bridger Blue
	DECLARE @ColHeaderFontColor VARCHAR(7) = '#ffffff'; -- White Text Color
	DECLARE @table VARCHAR(100) = '<table cellspacing="0" cellpadding="20">';
	DECLARE @table_close VARCHAR(8) = '</table>';
	DECLARE @tr_head VARCHAR(100) = '<tr bgcolor="' + @ColHeaderBGColor + '" color="' + @ColHeaderFontColor + '">';
	DECLARE @th_font VARCHAR(100) = '<th><font color="' + @ColHeaderFontColor + '">';
	DECLARE @th_close VARCHAR(5) = '</th>';
	DECLARE @tr_close VARCHAR(5) = '</tr>';
	DECLARE @tr_body VARCHAR(100) = '<tr>';
	DECLARE @td_body VARCHAR(100) = '<td style="border-bottom: 1px double #eeeeee;">';
	DECLARE @td_close VARCHAR(5) = '</td>';
	DECLARE @td_close_td_body VARCHAR(105) = @td_close + @td_body;
	DECLARE @SubjectLine VARCHAR(500);
	DECLARE @SendTo NVARCHAR(500);
	DECLARE @EmailBody VARCHAR(MAX);


	--**************************************************TABLES****************************************

	--**************************************************CODE****************************************

	-- SET RECIPIENT
	SELECT
		@SendTo = N'an email address';

	--SET SUBJECT LINE
	SELECT
		@SubjectLine = 'The subject line'

	SELECT
		@Description = 'Include a more detailed description of the email for the end user.'

	-- BEGIN HTML (MUST COME FIRST)
	SELECT 
		@EmailBody = '<html>'

	-- SUBJECT LINE AS HEADER
	SELECT
		@EmailBody += '<h1>' + @SubjectLine + '</h1>' 

	-- DISPLAY DEFAULT RECIPIENTS 
	SELECT
		@EmailBody += '<p><b>Default Recipient:</b> ' + @SendTo + '<br><br>';

	-- DISPLAY THE DISCRIPTION
	SELECT
		@EmailBody += '<b>Description:</b> ' + @Description + '</p><br>';

	-- BEGIN TABLE AND SET TABLE HEADERS	
	SELECT 
		@EmailBody += @table + @tr_head -- BEGIN TABLE HEADERS
								+ @th_font + 'TitleColumn1' + @th_close
								+ @th_font + 'TitleColumn2' + @th_close
								+ @th_font + 'TitleColumn3' + @th_close
								+ @th_font + 'TitleColumn4' + @th_close 
								+ @tr_close; --END TABLE HEADERS

	-- SELECT ROWS
	SELECT
		@EmailBody += @tr_body 
						+ @td_body +		  'Column1' 
						+ @td_close_td_body + 'Column2' 
						+ @td_close_td_body + 'Column3' 
						+ @td_close_td_body + 'Column4' 
						+ @td_close + @tr_close;

	-- CLOSE TABLE
	SELECT
		@EmailBody += @table_close;

	-- CLOSE HTML (MUST COME LAST)
	SELECT
		@EmailBody += '</html>'

	IF @PreviewOutput = 1
		BEGIN

			/* PREVIEW OUTPUT QUERY */
			SELECT
				@SendTo
				,@SubjectLine
				,@EmailBody;

		END;
	ELSE
		BEGIN

			/* SEND DB MAIL PROCEDURE CALL */
			EXEC msdb.dbo.sp_send_dbmail
				@recipients = @SendTo
				,@body = @EmailBody
				,@subject = @SubjectLine
				,@body_format = 'HTML';

		END;