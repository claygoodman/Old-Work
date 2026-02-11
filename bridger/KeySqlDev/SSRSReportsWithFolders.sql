/**************************************************COMMENTS****************************************
Bridger
dgoodman
6/25/2018

**************************************************DECLARATIONS****************************************/
	DECLARE @MinRID				INT = 1
	DECLARE @MaxRID				INT
	DECLARE @FolderName			VARCHAR(250)
	DECLARE @LastFolderName		VARCHAR(250)
	DECLARE @RptCnt				INT
	DECLARE @NextRID			INT


--**************************************************TABLES****************************************
	IF OBJECT_ID('tempdb.dbo.#Reports') IS NOT NULL
	DROP TABLE #Reports
	CREATE TABLE #Reports(
		RID					INT IDENTITY(1,1)
		,ReportName			VARCHAR(250)
		,ReportPath			VARCHAR(MAX)
		,FolderName			VARCHAR(250)
		,TotalReports		INT
		)

--**************************************************CODE****************************************

	INSERT #Reports(
		ReportName
		,ReportPath
		,FolderName
		)
	SELECT
       Name	AS ReportName
       ,[Path]	AS ReportPath
	   ,LEFT(
			 [Path],CHARINDEX(
							  '/',RIGHT(
										[Path],LEN(
													[Path]
													)- 1
										)
							 ) 
			) AS FolderName

	FROM ReportServer.dbo.[Catalog]
	WHERE [Type] = 2
	ORDER BY [Path]

	UPDATE #Reports
	SET FolderName = RIGHT(
							FolderName,LEN(
											FolderName
										  )-1
						  )
	FROM #Reports

	SELECT @MaxRID = MAX(RID) 
	FROM #Reports

	WHILE @MinRID <= @MaxRID
	BEGIN
		SELECT @FolderName = FolderName FROM #Reports WHERE RID = @MinRID
		SELECT @RptCnt = COUNT(*) FROM #Reports WHERE FolderName = @FolderName
		UPDATE #Reports
		SET TotalReports = @RptCnt FROM #Reports WHERE FolderName = @FolderName
		SELECT @NextRID = MAX(RID)+ 1 FROM #Reports WHERE FolderName = @FolderName
		SET @MinRID = @NextRID
	END

	SELECT  
		ReportName
		,ReportPath
		,FolderName
		,TotalReports
	FROM #Reports