
	-- To Get First Day of Previous Month
	SELECT CAST(DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()) - 1, '19000101') AS DATE)  AS [FIRST DAY Previous MONTH]

	--Last Day of Previous Month
	SELECT CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0)) AS DATE)  AS LastDay_PreviousMonth


	-- To Get First Day of Current Month
	SELECT CAST(DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()), '19000101') AS DATE) AS [FIRST DAY CURRENT MONTH]

	----Last Day of Current Month
	SELECT CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0)) AS DATE) AS LastDay_CurrentMonth


	-- To Get First Day of Next Month
	SELECT CAST(DATEADD(MONTH, DATEDIFF(MONTH, '19000101', GETDATE()) + 1, '19000101') AS DATE) AS [FIRST DAY NEXT MONTH]


	------Last Day of Next Month
	SELECT CAST(DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+2,0)) AS DATE) AS LastDay_NextMonth


	--get the prior day in correct format for TMW scheduling

	SELECT CAST(CAST(GETDATE() AS DATE) AS DATETIME) + ' 07:00:00'

	SELECT  CONVERT(VARCHAR(8), GETDATE(), 108) 'hh:mi:ss'

	--		--,CAST(FORMAT(CAST(PunchDate AS DATE),'yyyy-MM-dd') + ' ' + CAST(CAST(PunchDate AS TIME(0)) AS NVARCHAR) AS DATETIME)
