USE FileLoading
--PRINT 'Started Run Line 2 ' +  CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

SET NOCOUNT ON

TRUNCATE TABLE dbo.Items
DBCC CHECKIDENT (Items,RESEED)

TRUNCATE TABLE dbo.CLientCols
DBCC CHECKIDENT(CLientCols,RESEED)

TRUNCATE TABLE dbo.Parents

TRUNCATE TABLE dbo.ItemCounts

TRUNCATE TABLE Custodians
DBCC CHECKIDENT(Custodians,RESEED)

TRUNCATE TABLE dbo.LoadingResults
EXEC AnamolousData

--Intializing Variables; many reinitialized and reused throughout
DECLARE @MaxPID BIGINT = 0			--holds the starting identity value for a parent; parent of next level
DECLARE @ChildID INT	= 1			--Holds the child ID when incrementing dirs with files; next level parent; start with NULL
DECLARE @MaxChildID INT = 0			--the largest ChildID associated with #RootPaths
DECLARE @MaxID INT = 0				--An ItemID counter
DECLARE @SumCnt INT = 0				--total count of files
DECLARE @SumSize DECIMAL(20,2)		--total size of files
DECLARE @ClientColsID INT = 0		--the batch ID of this load
DECLARE @LvlIdx INT = 1				--index check for levels
DECLARE @RootPathID INT = 1				--counter for the files loop
DECLARE @SourcePath NVARCHAR(2000)  = ''	--contains a string to parse
DECLARE @TrimString NVARCHAR(1000) = ''	--pieces of a string
DECLARE @ClientCollName VARCHAR(100) = ''	--the Evidence Number
DECLARE @RootPath NVARCHAR(255) = ''	--a directory name

--Recursion oriented variables
DECLARE @FileLevel INT = 0			--Holds the number of levels for the first recursion
DECLARE @DirCount INT = 0			--Counts Dirs at the levels with files
DECLARE @RootPathCnt INT = 0		--Counts the RootPaths used by files
DECLARE @ParentID INT = 0			--ID used to define Paths in secondary recursive loops
DECLARE @RecCnt INT = 0				--Counts the Records in #TrimPath and #TrimPath2
DECLARE @PathID INT = 0
DECLARE @LnVal INT = 0
DECLARE @cnt INT = 1				--counts the dir loop
DECLARE @cnt2 INT					--floating counter
DECLARE @TotRows INT				--all the rows in tblFileInventory
DECLARE @FallBackCnt INT			--gets the value before @cnt2 is advanced
DECLARE @LenLead INT			--length of the leadpath
DECLARE @SrcCnts INT			--count of records in tblFileInventory
DECLARE @Pcnts INT				--Count of Parent records for this clientID
DECLARE @Icnts INT				--count of Item records for this evidence number



DECLARE @tblItemCnts TABLE(MinID INT, MaxID INT)	--used to Count Levels at completion


--intermediate table with first rootpaths, and parentpaths
IF OBJECT_ID('tempdb..#ItemValues') IS NOT NULL DROP TABLE #ItemValues
CREATE TABLE #ItemValues (IVID INT IDENTITY(1,1),LeadPath NVARCHAR(255),RootPath NVARCHAR(255),RemainPath NVARCHAR(255))

--Listings of directory paths without any file names
IF OBJECT_ID('tempdb..#FileFreePaths') IS NOT NULL DROP TABLE #FileFreePaths
CREATE TABLE #FileFreePaths (ID INT , FullPath NVARCHAR(2000))

--Contains the data for preloads and the second recursive loop 
IF OBJECT_ID('tempdb..#TrimPath') IS NOT NULL DROP TABLE #TrimPath
CREATE TABLE #TrimPath(TrimString NVARCHAR(400),RootPath NVARCHAR(200), ParentID INT, ChildID INT, TrimPath NVARCHAR(2000),
SourceID INT, SourcePath NVARCHAR(2000), SourceFileName NVARCHAR(255) ,DataType NVARCHAR(255), Fname NVARCHAR(255),FSize DECIMAL(20,2) )
--CREATE CLUSTERED INDEX clsRootPath ON #TrimPath(RootPath)

----Contains the data for the first recursive loop
IF OBJECT_ID('tempdb..#TrimPath2') IS NOT NULL DROP TABLE #TrimPath2
CREATE TABLE #TrimPath2(TrimString NVARCHAR(400),RootPath NVARCHAR(200), ParentID INT, ChildID INT, TrimPath NVARCHAR(2000),
SourceID INT, SourcePath NVARCHAR(2000), SourceFileName NVARCHAR(255) ,DataType NVARCHAR(255), Fname NVARCHAR(255),FSize DECIMAL(20,2) )
--CREATE CLUSTERED INDEX clsRootPath2 ON #TrimPath2(RootPath)

--Contains the multiple mid level directories and files
IF OBJECT_ID('tempdb..#TrimChild') IS NOT NULL DROP TABLE #TrimChild
CREATE TABLE #TrimChild(TrimString NVARCHAR(400),RootPath NVARCHAR(200), ParentID INT, ChildID INT,
 TrimPath NVARCHAR(MAX), SourceID INT, SourcePath NVARCHAR(2000), DataType NVARCHAR(255), Fname NVARCHAR(255),FSize DECIMAL(20,2) )
--CREATE CLUSTERED INDEX clsChildRootPath ON #TrimChild(RootPath)

--Tracks directory names within loops
IF OBJECT_ID('tempdb..#RootPaths') IS NOT NULL DROP TABLE #RootPaths
CREATE TABLE #RootPaths(ID INT IDENTITY(1,1),ParentPath NVARCHAR(1000),SourceID INT, RootPath NVARCHAR(200),ParentsParentID INT,ParentID INT )

--Consolidates directory names with full paths and source IDs
IF OBJECT_ID('tempdb..#FlyRoots') IS NOT NULL DROP TABLE #FlyRoots
CREATE TABLE #FlyRoots (ID INT, PPath NVARCHAR(2000), SourceID INT)

--Contains level parents used to construct new Parents
IF OBJECT_ID('tempdb..#LvParents') IS NOT NULL DROP TABLE #LvParents
CREATE TABLE #LvParents(NewChildID INT IDENTITY(25,1), ParentID INT, ParentPath NVARCHAR(1000), ClientColsID INT)

--A temporary collection of this customer's Parent table information
IF OBJECT_ID('tempdb..#Parents') IS NOT NULL DROP TABLE #Parents
CREATE TABLE #Parents(ParentID INT, CHILDID INT, ParentPath NVARCHAR(1000), ClientColsID INT)

--A temporary collection of Item ParentIDs, Fnames, Fsizes, SourceIDs
IF OBJECT_ID('tempdb..#Items') IS NOT NULL DROP TABLE #Items
CREATE TABLE #Items(ParentID INT, Fname NVARCHAR(255),Fsize DECIMAL(20,2), SourceID INT, ItemID INT)

--Optimize queries for the columns used to build reporting tables
--PRINT 'Temp tables Created LIne 106 ' +  CAST (CAST (GETDATE() AS TIME) AS VARCHAR)


UPDATE STATISTICS tblFileInventory(clsTblFileInventory)
    WITH FULLSCAN, NORECOMPUTE

UPDATE STATISTICS tblFileInventory(nclsFP)
	 WITH FULLSCAN, NORECOMPUTE

UPDATE STATISTICS tblFileInventory(nclsSig)
	WITH FULLSCAN, NORECOMPUTE


IF EXISTS(SELECT * FROM tempdb.sys.indexes WHERE object_id =  OBJECT_ID('Tempdb..#TrimPath') AND name = 'nclsTS1') DROP INDEX nclsTS1 ON #TrimPath
CREATE NONCLUSTERED INDEX nclsTS1 ON #TrimPath(TrimString,ParentID)

IF EXISTS(SELECT * FROM tempdb.sys.indexes WHERE object_id = OBJECT_ID('tembdb..#TrimPath2') AND name = 'nclsTS2') DROP INDEX nclsTS2 ON #TrimPath
CREATE NONCLUSTERED INDEX nclsTS2 ON #TrimPath2(TrimString)


--PRINT 'Index Changes Complete Line 126 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)


--****************************************
--BEGIN PROCESSING
--****************************************

--Create the Client Collection Record
--******************Load Batch Record***************

BEGIN TRY
	INSERT INTO ClientCols(ClientCollName) (SELECT TOP 1 CLientCollName FROM TblFileInventory)	--there will be only 1
	SELECT @ClientColsID = @@IDENTITY
	SELECT @ClientCollName = ClientCollName FROM ClientCols WHERE ClientColsID = @ClientColsID

	--Intialize @MaxPID for this batch
	SET @MaxPID = (SELECT MAX(ParentID) FROM Parents)--Get the highest parent
	IF @MaxPID IS NULL OR @MaxPID = 0 SET @MaxPID = 7 ELSE SET @MaxPID = @MaxPID + 7

	--Initialize the Level at 1
	IF @LvlIdx IS NULL OR @LvlIdx = 0 SET @LvlIdx = 1 
	--get the least numerous directory level

--NEW BETA CODE

TRUNCATE TABLE #FileFreePaths
--Load the Distinct paths into a working table	--down to 3 seconds with nclsSig index
INSERT INTO #FileFreePaths(FullPath)
SELECT DISTINCT LEFT([Full Path],LEN([Full Path])- LEN(REVERSE(SUBSTRING(REVERSE([Full Path]),0,CHARINDEX('\',REVERSE([Full Path]))))))
FROM TblFileInventory  

CREATE NONCLUSTERED INDEX nclsFP ON #FileFreePaths (FullPath)

--Get the ID values associated with the distinct paths
UPDATE #FileFreePaths SET ID = T.ID FROM TblFileInventory T 
WHERE LEFT([Full Path],LEN([Full Path])- LEN(REVERSE(SUBSTRING(REVERSE([Full Path]),0,CHARINDEX('\',REVERSE([Full Path])))))) = #FileFreePaths.FullPath


--Total runtime to this point: 9 Seconds

--Get the ID for the shortest path
SET @PathID = (SELECT ID FROM #FileFreePaths WHERE LEN(fullPath) = (SELECT MIN(LEN(fullPath)) FROM #FileFreePaths))

--Get the length of the shortest path
SET @LnVal = (SELECT MIN(LEN(fullPath)) FROM #FileFreePaths WHERE ID = @PathID)
SET @FileLevel = (SELECT MIN(LEN(FullPath)- (LEN(REPLACE(FullPath, '\', '')))) FROM #FileFreePaths
	WHERE ID = @PathID)
--SET SourcePath to the full path of the shortest path
SET @SourcePath = (SELECT FullPath FROM #FileFreePaths WHERE ID = @PathID)


--PRINT '#FileFreePaths Loaded and @SourcePath filled LIne 176 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)


--Load the leading paths, rootpaths and remaining paths into an intermediate table
INSERT INTO #ItemValues(LeadPath,RootPath,RemainPath)
SELECT LEFT(@SourcePath,CHARINDEX('\',@SourcePath))--the LeadPath
,LEFT(RIGHT(@SourcePath,LEN(@SourcePath)- LEN(LEFT(@SourcePath,CHARINDEX('\',@SourcePath)))),CHARINDEX('\'
	,RIGHT(@SourcePath,LEN(@SourcePath)- LEN(LEFT(@SourcePath,CHARINDEX('\',@SourcePath)))))) --AS RootPath
,RIGHT(@SourcePath,LEN(@sourcepath) 
-(LEN(LEFT(@SourcePath,CHARINDEX('\',@SourcePath)))+ LEN(LEFT(RIGHT(@SourcePath,LEN(@SourcePath)- LEN(LEFT(@SourcePath,CHARINDEX('\',@SourcePath)))),CHARINDEX('\'
	,RIGHT(@SourcePath,LEN(@SourcePath)- LEN(LEFT(@SourcePath,CHARINDEX('\',@SourcePath)))))))))

SET @cnt = (SELECT MAX(IVID) FROM #ItemValues)
WHILE @cnt <= @FileLevel
BEGIN 
	INSERT INTO #ItemValues(LeadPath,RootPath,RemainPath)
		SELECT 
		LeadPath + RootPath 
		,LEFT(RemainPath,CHARINDEX('\',RemainPath))
		,RIGHT(RemainPath,LEN(RemainPath)- LEN(LEFT(RemainPath,CHARINDEX('\',RemainPath)))) FROM #ItemValues WHERE IVID = (SELECT MAX(IVID) FROM #ItemValues)
		AND LEN(RIGHT(RemainPath,LEN(RemainPath)- LEN(LEFT(RemainPath,CHARINDEX('\',RemainPath))))) <> 0
	SET @cnt = @cnt + 1
END
INSERT INTO #ItemValues(LeadPath,RootPath,RemainPath)
		SELECT 
		LeadPath + RootPath 
		,LEFT(RemainPath,CHARINDEX('\',RemainPath))
		,''
		FROM #ItemValues WHERE IVID = (SELECT MAX(IVID) FROM #ItemValues)
INSERT INTO #ItemValues(LeadPath,RootPath,RemainPath)
		SELECT 
		LeadPath + RootPath
		,''
		,''
		FROM #ItemValues WHERE IVID = (SELECT MAX(IVID) FROM #ItemValues)




--PRINT '#ItemValues Loaded Line 212 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)


SELECT @TotRows = COUNT(*) FROM TblFileInventory --total records 195791
SET @cnt = 1
SELECT @cnt2 = @TotRows --COUNT(*) FROM TblFileInventory WHERE LEFT([full path],@LenLead) = (SELECT LeadPath FROM #ItemValues WHERE IVID = @cnt )--195791

WHILE @cnt2 = @TotRows
BEGIN
	SET @LenLead = (SELECT LEN(LeadPath) FROM #ItemValues WHERE IVID = @cnt)
	SET @cnt2 = (SELECT COUNT(*) FROM TblFileInventory WHERE LEFT([full path],@LenLead) = (SELECT LeadPath FROM #ItemValues WHERE IVID = @cnt))--195791
	IF @cnt2 <> @TotRows BREAK
	--SET @FallBackCnt = @cnt2
	SET @cnt = @cnt + 1	--increment the level up one until @cnt2 <> @TotRows
END
SET @cnt = @cnt - 1	--step back to the level you were at prior to the Break; this is the top level that all have in common

--PRINT '@cnt, @cnt2 Loaded Line 229 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)


--@cnt represents the total number of levels that all directories have in common
--Each preceding LeadPath has the level #, the associated ParentPath and RootPath 

--Initialize the records in Parents and Items
SET @cnt2 = 1	--start a new counter
INSERT INTO Parents(ParentID,ChildID,ParentPath,ClientColsID)
	SELECT @MaxPID,@MaxPID,LeadPath ,@ClientColsID FROM #ItemValues WHERE IVID = @cnt2
	
INSERT INTO #Parents(ParentID,CHILDID,ParentPath,ClientColsID)
		SELECT @MaxPID,@MaxPID,LeadPath ,@ClientColsID FROM #ItemValues WHERE IVID = @cnt2

INSERT INTO Items(ParentID,[Evidence Number],ItemValue, SourceID, SourcePath, ItemID)
	SELECT  @MaxPID, @ClientCollName,LeadPath,@PathID, LeadPath + RootPath + RemainPath,  @LvlIdx FROM #ItemValues WHERE IVID = @cnt2
	

INSERT INTO #Items(ParentID,Fname, Fsize,SourceID,ItemID)
	SELECT @MaxPID, NULL,NULL, @PathID, @LvlIdx FROM #ItemValues WHERE IVID = @cnt2



IF @ChildID = 1 SET @ChildID = (SELECT MAX(ChildID) FROM #Parents)

SET @cnt2 = @cnt2 + 1	
--the first record is inserted into items; level 1
WHILE @cnt2 <= @cnt	--this starts at level 1
BEGIN
		SET @MaxPID = (SELECT MAX(ChildID) FROM #Parents)
		SET @ChildID = @ChildID + 1
		SET @LvlIdx = @LvlIdx + 1
		--SET @RootPath = (SELECT RootPath FROM #ItemValues WHERE IVID = @cnt2)
	INSERT INTO Parents(ParentID,ChildID,ParentPath,ClientColsID)
		SELECT @MaxPID,@ChildID,LeadPath ,@ClientColsID FROM #ItemValues WHERE IVID = @cnt2
	
	INSERT INTO #Parents(ParentID,CHILDID,ParentPath,ClientColsID)
		SELECT @MaxPID,@ChildID,LeadPath ,@ClientColsID FROM #ItemValues WHERE IVID = @cnt2

		--SET @RootPath = (SELECT RootPath FROM #ItemValues WHERE IVID = @cnt2 -1)
		
	INSERT INTO Items(ParentID,[Evidence Number],ItemValue, SourceID, SourcePath, ItemID)
		SELECT  @ChildID, @ClientCollName,RootPath,@PathID, LeadPath + RootPath + RemainPath,  @LvlIdx FROM #ItemValues WHERE IVID = @cnt2 -1
		
	INSERT INTO #Items(ParentID,Fname, Fsize,SourceID,ItemID)
		SELECT @ChildID, NULL, NULL, @PathID, @LvlIdx FROM #ItemValues WHERE IVID = @cnt2 -1
	SET @cnt2 = @cnt2 + 1
END
--get the missing level
	SET @MaxPID = (SELECT MAX(ChildID) FROM #Parents)
	SET @ChildID = @ChildID + 1
	SET @LvlIdx = @LvlIdx + 1
	--SET @RootPath = (SELECT RootPath FROM #ItemValues WHERE IVID = @cnt2)
INSERT INTO Parents(ParentID,ChildID,ParentPath,ClientColsID)
	SELECT @MaxPID,@ChildID,LeadPath ,@ClientColsID FROM #ItemValues WHERE IVID = @cnt2

INSERT INTO #Parents(ParentID,CHILDID,ParentPath,ClientColsID)
	SELECT @MaxPID,@ChildID,LeadPath ,@ClientColsID FROM #ItemValues WHERE IVID = @cnt2

	--SET @RootPath = (SELECT RootPath FROM #ItemValues WHERE IVID = @cnt2 -1)
	
INSERT INTO Items(ParentID,[Evidence Number],ItemValue, SourceID, SourcePath, ItemID)
	SELECT  @ChildID, @ClientCollName,RootPath,@PathID, LeadPath + RootPath + RemainPath,  @LvlIdx FROM #ItemValues WHERE IVID = @cnt2 -1
	
INSERT INTO #Items(ParentID,Fname, Fsize,SourceID,ItemID)
	SELECT @ChildID, NULL, NULL, @PathID, @LvlIdx FROM #ItemValues WHERE IVID = @cnt2 -1

	SET @TrimString = (SELECT LeadPath FROM #ItemValues WHERE IVID = @cnt) --this Value is used to build #TrimPath

--PRINT '#Parents, #Items initially Loaded, @TrimString Set Line 280 ' +CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

	SET @MaxPID = (SELECT MAX(ChildID) FROM #Parents)
	--Load TrimPath; 
	TRUNCATE TABLE #TrimPath
	ALTER INDEX nclsTS1 ON #TrimPath DISABLE
	
	INSERT INTO #TrimPath(TrimString,RootPath, ParentID, TrimPath, SourceID, SourcePath, Datatype, Fname, FSize)
	SELECT @TrimString
	,LEFT( RIGHT([Full Path],LEN([Full Path])- LEN(@trimstring)),CHARINDEX('\', RIGHT([Full Path],LEN([Full Path])- LEN(@trimstring)))) AS RootPath
	,@MaxPID AS ParentID
	,RIGHT([Full Path],LEN([Full Path])- LEN(@trimstring)) AS TrimPath
	,ID
	,[Full Path]
	,[File Type]
	,Name
	,[Physical Size]
	FROM TblFileInventory WHERE Signature <> 'Folder' 
	ORDER BY [Full Path]   --This ORDER BY is Essential to sort all the levels correctly

--PRINT '#TrimPath Loaded for first time Line 300 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

	ALTER INDEX nclsTS1 ON #TrimPath REBUILD
	UPDATE STATISTICS #TrimPath(nclsTS1)WITH FULLSCAN, NORECOMPUTE

	SELECT @RecCnt = COUNT(*) FROM #TrimPath

	--*********************************************************************************************************
	--**Preparatory While/
	--*********************************************************************************************************
	--Loop through all the remaining directories at this level
	--load any files they have and give them IDs to use a Parents for the next level 
	SET @ChildID = (SELECT MAX(ChildID) FROM #Parents WHERE ClientColsID = @ClientColsID) + 1 
	--Reset filecount
	SET @DirCount = -1
	--Reset the Parent Loop
	SET @RootPathID = 1
	SET @cnt = 1
	--Load Unique ItemValues as RootPaths
	TRUNCATE TABLE #RootPaths	--clear it 
	DBCC CHECKIDENT (#RootPaths,RESEED)	--reset the ID

	INSERT INTO #RootPaths(RootPath,ParentsParentID)
	SELECT DISTINCT LEFT(TrimPath,CHARINDEX('\',TrimPath)),ParentID FROM #TrimPath 

	SET @RootPathCnt = (SELECT MAX(ID) FROM #RootPaths)

	WHILE @cnt <= @RootPathCnt
	BEGIN
		INSERT INTO #FlyRoots(ID,PPath,SourceID)
		SELECT TOP 1 R.ID, T.SourcePath,T.SourceID FROM #TrimPath T INNER JOIN #RootPaths R ON LEFT(T.TrimPath,CHARINDEX('\',T.TrimPath)) = R.RootPath WHERE R.ID = @cnt
		SET @cnt = @cnt + 1
	END
	UPDATE #RootPaths SET ParentPath = F.PPath, SourceID = F.SourceID FROM #FlyRoots F INNER JOIN #RootPaths R ON F.ID = R.ID

	--PRINT '#RootPaths fully Loaded Line 335 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)


	SET @ChildID = (SELECT MAX(ChildID) FROM #Parents) + 1
	SET @cnt = (SELECT MIN(ID) FROM #RootPaths)
	SET @MaxID = (SELECT MAX(ID) FROM #RootPaths)

	WHILE @cnt <= @MaxID
	BEGIN
		UPDATE #RootPaths SET ParentID = @ChildID WHERE ID = @cnt
		SET @cnt = @cnt + 1
		SET @ChildID = @ChildID + 1
	END


	UPDATE #TrimPath SET ChildID = R.ParentID FROM #RootPaths R WHERE #TrimPath.RootPath = R.RootPath

	INSERT INTO Parents(ParentID,ChildID,ParentPath,ClientColsID)
		SELECT ParentsParentID, ParentID, @TrimString + RootPath, @ClientColsID FROM #RootPaths 

	INSERT INTO #Parents(ParentID,CHILDID,ParentPath,ClientColsID)
		SELECT ParentsParentID, ParentID, @TrimString + RootPath, @ClientColsID FROM #RootPaths 

	--IF (SELECT MAX(ID) FROM #RootPaths) <> 0 SET @LvlIdx = @LvlIdx + 1
	
	INSERT INTO Items(ParentID,[Evidence Number],ItemValue,SourceID, SourcePath,fName, FSize, [Data Type], ItemID )
	SELECT R.ParentID, @ClientCollName, TP.RootPath, TP.SourceID, TP.SourcePath, TP.Fname, TP.FSize, TP.DataType, @LvlIdx FROM #TrimPath TP ,#RootPaths R
			WHERE LEFT(TP.TrimPath,CHARINDEX('\',TP.TrimPath)) = R.RootPath
			AND (CHARINDEX('\',RIGHT(TP.TrimPath,LEN(TP.TrimPath)-LEN(R.RootPath)))) = 0
			GROUP BY  R.ParentID, TP.RootPath, TP.SourceID, TP.SourcePath, TP.Fname, TP.FSize, TP.DataType

	INSERT INTO #Items(ParentID,Fname, Fsize,SourceID,ItemID)
		SELECT R.ParentID, TP.Fname, TP.Fsize, TP.SourceID, @LvlIdx FROM #TrimPath TP, #RootPaths R
		WHERE LEFT(TP.TrimPath,CHARINDEX('\',TP.TrimPath)) = R.RootPath
		AND (CHARINDEX('\',RIGHT(TP.TrimPath,LEN(TP.TrimPath)-LEN(R.RootPath)))) = 0
		GROUP BY R.ParentID,TP.Fname, TP.FSize, TP.SourceID
			
	--PRINT '#Items Loaded with #TrimPath and #RootPath data Line 371 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)



--PRINT 'nclsChildPath ON #Parents disabled/rebuilt Line 375 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

	--Remove Items that have been loaded
	
	DELETE #TrimPath WHERE RootPath = (LEFT(TrimPath,CHARINDEX('\',TrimPath)))
	AND Fname IN(SELECT I.Fname FROM #Items I 
		INNER JOIN #Parents P ON I.ParentID = P.ChildID WHERE I.Fname IS NOT NULL AND P.ClientColsID = @ClientColsID)

--PRINT '#Items and #Parents Loaded before #TP2 Line 383 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)
	--************************************************************************
	--Load the records into TP2 that have not been loaded into Items
	--************************************************************************
	TRUNCATE TABLE #TrimPath2
	ALTER INDEX nclsTS2 ON #TrimPath2 DISABLE
	INSERT INTO #TrimPath2(TrimString,RootPath,ParentID,TrimPath,SourceID,SourcePath,SourceFileName,DataType,Fname,FSize)
	SELECT 
	TrimString + RootPath AS NewTrimString
	,RootPath
	,ChildID
	,RIGHT(TrimPath,LEN(TrimPath) - LEN(LEFT(TrimPath,CHARINDEX('\', TrimPath)))) AS NewTrimPath
	,SourceID
	,SourcePath
	,SourceFileName
	,DataType
	,Fname
	,Fsize
	FROM #TrimPath 

	
	UPDATE #TrimPath2 SET ParentID = P.ParentID, ChildID = P.ChildID FROM #Parents P
	INNER JOIN #TrimPath2 T ON T.TrimString = P.ParentPath

	--PRINT '#TrimPath2 Updated Line 373 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)
	
	ALTER INDEX nclsTS2 ON #TrimPath2 REBUILD
	UPDATE STATISTICS #TrimPath2(nclsTS2)WITH FULLSCAN, NORECOMPUTE




	--CREATE NEW PARENTS IF NEEDED
	SET @MaxPid = (SELECT MAX(ChildID) FROM #Parents) + 1	--becomes the next childID

	TRUNCATE TABLE #LvParents
	DBCC CHECKIDENT(#LvParents,RESEED,@MaxPid)
	--create a list of new parents and generate ChildIDs simultaneously
	INSERT INTO #LvParents(ParentID,ParentPath,ClientColsID)
	SELECT DISTINCT ParentID, TrimString, @ClientColsID As ClientColsID 
		FROM #TrimPath2 WHERE TrimString NOT IN (SELECT ParentPath FROM #Parents)

	--Load the new parents
	IF (SELECT COUNT(*) FROM #LvParents) > 0
	BEGIN
		INSERT INTO Parents(ParentID,ChildID,ParentPath,ClientColsID)
			SELECT ParentID, NewChildID, ParentPath,ClientColsID FROM #LvParents
		
		
		INSERT INTO #Parents(ParentID,CHILDID,ParentPath,ClientColsID)
			SELECT ParentID, NewChildID, ParentPath,ClientColsID FROM #LvParents
		--set the level; all of these parents are at the same level
		SET @LvlIdx = @LvlIdx + 1 
		--UPDATE TrimPath2.ChildID with the newly generated ParentIDs 


	--PRINT 'nclsChildPath ON #Parents disabled/rebuilt Line 439 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)
		
		UPDATE #TrimPath2 SET ChildID = 
		P.ChildID FROM #Parents P INNER JOIN #TrimPath2 T ON P.ParentPath =  T.TrimString 
		AND P.ParentID = T.ParentID
	END
	--Load the files based on these new parent IDs
	INSERT INTO Items(ParentID,[Evidence Number],ItemValue,SourceID, SourcePath,Fname,Fsize,[Data Type],ItemID)
	SELECT ChildID,@ClientCollName,RootPath AS ItemValue,SourceID,SourcePath,Fname,Fsize,DataType,@LvlIdx
		FROM #TrimPath2 WHERE (CHARINDEX('\',TrimPath)) = 0

	
	INSERT INTO #Items(ParentID, Fname, Fsize, SourceID,ItemID)
		SELECT ChildID, SourceID, Fname, Fsize,@LvlIdx FROM #TrimPath2 WHERE (CHARINDEX('\',TrimPath)) = 0
		
	--Delete them after Items have been loaded
	DELETE #TrimPath2 WHERE (CHARINDEX('\',TrimPath)) = 0

	--PRINT 'Items loaded with #TrimPath2 Line 457 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)



	--***************************************************************************
	/*
	Finalize the structure of TrimString, RootPath and TrimPath
	each subsequent form of these will have the same form:
	TrimString ends with RootPath, TrimString + TrimPath = the full path and the same as SourcePath
	*/
	--***************************************************************************
	TRUNCATE TABLE #TrimPath
	ALTER INDEX nclsTS1 ON #TrimPath DISABLE
	
	INSERT INTO #TrimPath(TrimString,RootPath,ParentID,TrimPath,SourceID,SourcePath,SourceFileName,DataType,Fname,FSize)
	SELECT 
	TrimString + LEFT(TrimPath,CHARINDEX('\',TrimPath)) AS NewTrimString
	,LEFT(TrimPath,CHARINDEX('\',TrimPath))AS NewRootPath 
	,ChildID
	,RIGHT(TrimPath,LEN(TrimPath) - LEN(LEFT(TrimPath,CHARINDEX('\', TrimPath)))) AS NewTrimPath
	,SourceID
	,SourcePath
	,SourceFileName
	,DataType
	,Fname
	,Fsize
	FROM #TrimPath2

	ALTER INDEX nclsTS1 ON #TrimPath REBUILD
	UPDATE STATISTICS #TrimPath(nclsTS1)WITH FULLSCAN, NORECOMPUTE

	
	UPDATE #TrimPath SET ParentID = P.ParentID, ChildID = P.ChildID FROM #Parents P
	INNER JOIN #TrimPath T ON T.TrimString = P.ParentPath

	--PRINT '#TrimPath Loaded for from #TrimPath2 Line 492 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)


	SET @MaxPid = (SELECT MAX(ChildID) FROM #Parents) + 1	--becomes the next childID
	--CREATE NEW PARENTS IF NEEDED
	TRUNCATE TABLE #LvParents
	DBCC CHECKIDENT(#LvParents,RESEED,@MaxPid)
	--create a list of new parents and generate ChildIDs simultaneously
	INSERT INTO #LvParents(ParentID,ParentPath,ClientColsID)
	SELECT DISTINCT ParentID, TrimString, @ClientColsID As ClientColsID 
		FROM #TrimPath WHERE TrimString NOT IN (SELECT ParentPath FROM #Parents)


	--Load the new parents
	IF (SELECT COUNT(*) FROM #LvParents) > 0
	BEGIN
		INSERT INTO Parents(ParentID,ChildID,ParentPath,ClientColsID)
			SELECT ParentID, NewChildID, ParentPath,ClientColsID FROM #LvParents
		
		
		INSERT INTO #Parents(ParentID,CHILDID,ParentPath,ClientColsID)
			SELECT ParentID, NewChildID, ParentPath,ClientColsID FROM #LvParents

		--set the level; all of these parents are at the same level
		SET @LvlIdx = @LvlIdx + 1 
		--UPDATE TrimPath.ChildID with the newly generated ParentIDs 

		UPDATE #TrimPath SET ChildID = 
		P.ChildID FROM #Parents P INNER JOIN #TrimPath T ON P.ParentPath =  T.TrimString 
		AND P.ParentID = T.ParentID
	END
	--Load the files based on these new parent IDs
	INSERT INTO Items(ParentID,[Evidence Number],ItemValue,SourceID, SourcePath,Fname,Fsize,[Data Type],ItemID)
		SELECT ChildID,@ClientCollName,RootPath AS ItemValue,SourceID,SourcePath,Fname,Fsize,DataType,@LvlIdx
			FROM #TrimPath WHERE (CHARINDEX('\',TrimPath)) = 0
	
	INSERT INTO #Items(ParentID, Fname, Fsize,SourceID,ItemID)
		SELECT ChildID,Fname,Fsize,SourceID, @LvlIdx FROM #TrimPath WHERE (CHARINDEX('\',TrimPath)) = 0
	
	--Delete them after Items have been loaded
	DELETE #TrimPath WHERE (CHARINDEX('\',TrimPath)) = 0

	--PRINT 'Items Loaded from #TrimPath Line 534 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

	--*************************************************************************************************
	--********** RECURSIVE-LIKE WHILE *****************************************************************
	--********* Loops On @RecCnt **********************************************************************
	--*************************************************************************************************

	--Start Recursive WHILE here
	WHILE @RecCnt <> 0
	BEGIN
	--#TrimPath2 Level
	--Modify Source so that
	--TrimString ends with RootPath, TrimString + TrimPath = the full path and the same as SourcePath
		TRUNCATE TABLE #TrimPath2
		ALTER INDEX nclsTS2 ON #TrimPath2 DISABLE
		INSERT INTO #TrimPath2(TrimString,RootPath,ParentID,TrimPath,SourceID,SourcePath,SourceFileName,DataType,Fname,FSize)
		SELECT 
		TrimString + LEFT(TrimPath,CHARINDEX('\',TrimPath)) AS NewTrimString
		,LEFT(TrimPath,CHARINDEX('\',TrimPath)) AS NewRootPath
		,ChildID
		,RIGHT(TrimPath,LEN(TrimPath) - LEN(LEFT(TrimPath,CHARINDEX('\', TrimPath)))) AS NewTrimPath
		,SourceID
		,SourcePath
		,SourceFileName
		,DataType
		,Fname
		,Fsize
		FROM #TrimPath
		

		--associate new RootPath with ChildIDs
		UPDATE #TrimPath2 SET ParentID = P.ParentID, ChildID = P.ChildID FROM #Parents P
		INNER JOIN #TrimPath2 T ON T.TrimString = P.ParentPath

		ALTER INDEX nclsTS2 ON #TrimPath2 REBUILD
		UPDATE STATISTICS #TrimPath2(nclsTS2)WITH FULLSCAN, NORECOMPUTE

		--PRINT '#TrimPath2 Loaded from #TrimPath in Recursive While Line 571 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

		SET @MaxPid = (SELECT MAX(ChildID) FROM #Parents) + 1
		--CREATE NEW PARENTS IF NEEDED
		TRUNCATE TABLE #LvParents
		DBCC CHECKIDENT(#LvParents,RESEED,@MaxPid)
		--create a list of new parents
		--THis is the guilty code
		INSERT INTO #LvParents(ParentID,ParentPath,ClientColsID)
		SELECT DISTINCT ParentID, TrimString, @ClientColsID As ClientColsID 
		FROM #TrimPath2 WHERE TrimString NOT IN (SELECT ParentPath FROM #Parents WHERE ClientColsID = @ClientColsID)	



		IF (SELECT COUNT(*) FROM #LvParents) > 0
		BEGIN		
			--set the level; all of these parents are at the same level
			SET @LvlIdx = @LvlIdx + 1 
				--Load the new parents
			INSERT INTO Parents(ParentID,ChildID,ParentPath,ClientColsID)
			SELECT ParentID, NewChildID, ParentPath,ClientColsID FROM #LvParents
		
			
			INSERT INTO #Parents(ParentID,CHILDID,ParentPath,ClientColsID)
				SELECT ParentID, NewChildID, ParentPath,ClientColsID FROM #LvParents

			--UPDATE TrimPath2.ChildID with the newly generated ParentIDs 


			UPDATE #TrimPath2 SET ChildID = 
			P.ChildID FROM #Parents P INNER JOIN #TrimPath2 T ON P.ParentPath =  T.TrimString 
			AND P.ParentID = T.ParentID
		END
		--Load the files and not the dirs
		TRUNCATE TABLE #TrimChild
		INSERT INTO #TrimChild(TrimString,RootPath,ParentID,ChildID, TrimPath,SourceID, SourcePath, DataType,Fname,FSize)
		SELECT 
		TrimString + RootPath AS NewTrimString
		,RootPath AS NewItemValue 
		,ParentID
		,ChildID
		,RIGHT(TrimPath,LEN(TrimPath) - LEN(LEFT(TrimPath,CHARINDEX('\', TrimPath)))) AS NewTrimPath
		,SourceID
		,SourcePath
		,DataType
		,Fname
		,Fsize
		FROM #TrimPath2
		WHERE (CHARINDEX('\',TrimPath)) = 0
		--Load the files based on these new parent IDs
		INSERT INTO Items(ParentID,[Evidence Number],ItemValue,SourceID,SourcePath,[Data Type],Fname,Fsize,ItemID)
			SELECT T.ChildID , @ClientCollName, RootPath, SourceID,SourcePath, T.DataType, T.Fname, T.Fsize, @LvlIdx 
			FROM #TrimChild T
		
		 INSERT INTO #Items(ParentID,Fname,Fsize,SourceID,ItemID)
			SELECT T.ChildID ,T.Fname, T.Fsize, SourceID, @LvlIdx FROM #TrimChild T
		 
		--Delete them after Items have been loaded
		DELETE #TrimPath2 WHERE (CHARINDEX('\',TrimPath)) = 0

		SET @RecCnt = (SELECT COUNT(*) FROM #TrimPath2)
		IF @RecCnt = 0 BREAK

		--PRINT '#Items Loaded from #TrimChild in Recursive While LIne 634 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

		
		--TrimString ends with RootPath, TrimString + TrimPath = the full path and the same as SourcePath
		TRUNCATE TABLE #TrimPath
		ALTER INDEX nclsTS1 ON #TrimPath DISABLE
		INSERT INTO #TrimPath(TrimString,RootPath,ParentID,TrimPath,SourceID,SourcePath,SourceFileName,DataType,Fname,FSize)
		SELECT 
		TrimString + LEFT(TrimPath,CHARINDEX('\',TrimPath)) AS NewTrimString
		,LEFT(TrimPath,CHARINDEX('\',TrimPath)) AS NewRootPath
		,ChildID
		,RIGHT(TrimPath,LEN(TrimPath) - LEN(LEFT(TrimPath,CHARINDEX('\', TrimPath)))) AS NewTrimPath
		,SourceID
		,SourcePath
		,SourceFileName
		,DataType
		,Fname
		,Fsize
		FROM #TrimPath2


		UPDATE #TrimPath SET ParentID = P.ParentID, ChildID = P.ChildID FROM #Parents P
		INNER JOIN #TrimPath T ON T.TrimString = P.ParentPath --
		
		ALTER INDEX nclsTS1 ON #TrimPath REBUILD
		UPDATE STATISTICS #TrimPath(nclsTS1)WITH FULLSCAN, NORECOMPUTE
		
		SET @MaxPid = (SELECT MAX(ChildID) FROM #Parents) + 1

		--PRINT '#TrimPath Loaded from #TrimPath2 recursive while Line 663 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

		
		--CREATE NEW PARENTS IF NEEDED
		TRUNCATE TABLE #LvParents
		DBCC CHECKIDENT(#LvParents,RESEED,@MaxPid)
		--create a list of new parents
		INSERT INTO #LvParents(ParentID,ParentPath,ClientColsID)
		SELECT DISTINCT ParentID, TrimString, @ClientColsID As ClientColsID 
		FROM #TrimPath WHERE TrimString NOT IN (SELECT  ParentPath FROM #Parents WHERE ClientColsID = @ClientColsID)	

		IF (SELECT COUNT(*) FROM #LvParents) > 0
		BEGIN		
			--set the level; all of these parents are at the same level
			SET @LvlIdx = @LvlIdx + 1 
				--Load the new parents
			INSERT INTO Parents(ParentID,ChildID,ParentPath,ClientColsID)
			SELECT ParentID, NewChildID, ParentPath,ClientColsID FROM #LvParents
		
		
		INSERT INTO #Parents(ParentID,CHILDID,ParentPath,ClientColsID)
			SELECT ParentID, NewChildID, ParentPath,ClientColsID FROM #LvParents



			--UPDATE TrimPath2.ChildID with the newly generated ParentIDs 
			UPDATE #TrimPath SET ChildID = 
			P.ChildID FROM #Parents P INNER JOIN #TrimPath T ON P.ParentPath =  T.TrimString 
			AND P.ParentID = T.ParentID
		END
		--These are the files to load at this level
		TRUNCATE TABLE #TrimChild
		INSERT INTO #TrimChild(TrimString,RootPath,ParentID,ChildID, TrimPath,SourceID, SourcePath, DataType,Fname,FSize)
		SELECT 
		TrimString + RootPath AS NewTrimString
		,RootPath AS NewItemValue 
		,ParentID
		,ChildID
		,RIGHT(TrimPath,LEN(TrimPath) - LEN(LEFT(TrimPath,CHARINDEX('\', TrimPath)))) AS NewTrimPath
		,SourceID
		,SourcePath
		,DataType
		,Fname
		,Fsize
		FROM #TrimPath
		WHERE (CHARINDEX('\',TrimPath)) = 0
		--Load the files based on these new parent IDs
		INSERT INTO Items(ParentID,[Evidence Number],ItemValue,SourceID,SourcePath,[Data Type],Fname,Fsize,ItemID)
			SELECT T.ChildID , @ClientCollName, RootPath, SourceID,SourcePath, T.DataType, T.Fname, T.Fsize, @LvlIdx 
				FROM #TrimChild T
		
		INSERT INTO #Items(ParentID,Fname,Fsize,SourceID,ItemID)
			SELECT T.ChildID ,T.Fname, T.Fsize, T.SourceID, @LvlIdx FROM #TrimChild T

		--Delete them after Items have been loaded
		DELETE #TrimPath WHERE (CHARINDEX('\',TrimPath)) = 0

		SET @RecCnt = (SELECT COUNT(*) FROM #TrimPath)
		IF @RecCnt = 0 BREAK
		--PRINT '#Items Loaded from #TrimChild in recursive while Line 722 ' + CAST (CAST (GETDATE() AS TIME) AS VARCHAR)

	END	--this ends the @RecCnt loop 
	--**********************************************************************************
	--Recursion Complete
	--Load the Level Counts
	--**********************************************************************************


IF EXISTS(SELECT * FROM tempdb.sys.indexes WHERE object_id = OBJECT_ID(N'#Items') AND name = N'clsGrp')
DROP INDEX clsGrp ON #Items
CREATE UNIQUE CLUSTERED INDEX clsGRP ON #Items(ItemID,ParentID,Fname,Fsize) WITH (IGNORE_DUP_KEY = ON)

IF EXISTS (SELECT * FROM tempdb.sys.indexes WHERE object_id = OBJECT_ID(N'#Items') AND name = N'nclsItemID') 
DROP INDEX nclsItemID ON #Items
CREATE NONCLUSTERED INDEX nclsItemID ON #Items(ItemID)

	INSERT INTO @tblItemCnts(MinID,MaxID)
	SELECT MIN(ITemID), MAX(ItemID) FROM #Items I INNER JOIN #Parents P ON I.ParentID = P.ChildID
	WHERE I.FName IS NOT NULL AND
	P.ClientColsID = @ClientColsID

	SET @MaxID = (SELECT MaxID FROM @tblItemCnts)
	SET @cnt = (SELECT MinID FROM @tblItemCnts)
	WHILE @cnt <= @MaxID
	BEGIN
		INSERT INTO ItemCounts(ClientColsID, ItemCounts,CumulativeItemSize,ItemID)
		SELECT @ClientColsID, COUNT(I.Fname),SUM(I.Fsize) , @cnt FROM #Items I
		INNER JOIN #Parents P ON P.ChildID = I.ParentID
		WHERE I.Fname IS NOT NULL
		AND I.ItemID = @cnt 
		GROUP BY I.ItemID
		SET @cnt = @cnt + 1
	END
	--Calculate the total number of files and their sizes
	--load them into ItemCounts with the remaining levels that have not been loaded there
	SELECT @MaxID = MIN(ItemID) FROM ITemCounts WHERE  ClientColsID = @ClientColsID
	SET @SumCnt = (SELECT SUM(ItemCounts) FROM ItemCounts WHERE ClientColsID = @ClientColsID)
	SET @SumSize = (SELECT SUM(CumulativeItemSize) FROM ItemCounts WHERE ClientColsID = @ClientColsID)

	WHILE @MaxID > = 1
	BEGIN
	SELECT @cnt = MIN(ItemID) FROM ITemCounts WHERE  ClientColsID = @ClientColsID
		IF @cnt > 1
		BEGIN
			SET @cnt = @cnt - 1 
			INSERT INTO ItemCounts(ItemID,ClientColsID,ItemCounts,CumulativeItemSize)SELECT @cnt,@ClientColsID,@SumCnt,@SumSize
		END
		SELECT @MaxID = MIN(ItemID) FROM ITemCounts WHERE  ClientColsID = @ClientColsID
		IF @MaxID = 1 BREAK
	END


	--********************************************************************************
	--Level Counts Complete
	--Update Items with LoadingCorrections data
	--********************************************************************************
	UPDATE Items SET SourcePath = C.SourcePath, SourceFileName = C.SourceName
	FROM LoadingCorrections C
	INNER JOIN Items I ON I.SourceID = C.SourceID

	--RESET the Source Table to its orignal state
	UPDATE TblFileInventory SET [Full Path] = C.SourcePath, Name = C.SourceName FROM LoadingCorrections C
	WHERE TblFileInventory.ID = C.SourceID

	SET @SrcCnts = (SELECT COUNT(*) FROM TblFileInventory)
	SET @Pcnts = (SELECT COUNT(*) FROM Parents WHERE ClientColsID = @ClientColsID)
	SET @Icnts = (SELECT COUNT(*) FROM Items WHERE [Evidence Number] = @ClientCollName)
	INSERT INTO LoadingResults(ErrMsg , ErrNumber , ErrProcedure , ErrLine , ErrSeverity ,tblFileInventoryCounts ,ParentCnts , ItemCnts)
	SELECT NULL,NULL,NULL,NULL,0,@SrcCnts, @Pcnts,@Icnts

END TRY

BEGIN CATCH
	SET @SrcCnts = (SELECT COUNT(*) FROM TblFileInventory)
	SET @Pcnts = (SELECT COUNT(*) FROM Parents WHERE ClientColsID = @ClientColsID)
	SET @Icnts = (SELECT COUNT(*) FROM Items WHERE [Evidence Number] = @ClientCollName)
	INSERT INTO LoadingResults(ErrMsg , ErrNumber , ErrProcedure , ErrLine , ErrSeverity ,tblFileInventoryCounts ,ParentCnts , ItemCnts)
		SELECT ERROR_MESSAGE(), ERROR_NUMBER() ,ERROR_PROCEDURE(), ERROR_LINE(),ERROR_SEVERITY() , @SrcCnts, @Pcnts,@Icnts
END CATCH

 
 
 


--Execute Validation
--TRUNCATE TABLE QuestionedLoads

--INSERT INTO QuestionedLoads(QLID,Fname,SourcePath)
--SELECT ID,Name,[Full Path] FROM TblFileInventory 
--WHERE [Full Path] NOT IN (SELECT SourcePath FROM Items)

