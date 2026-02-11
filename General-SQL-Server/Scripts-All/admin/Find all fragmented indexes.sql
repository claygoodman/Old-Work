IF OBJECT_ID('tempdb..#tbl') IS NOT NULL DROP TABLE #tbl

CREATE TABLE #tbl(tblName NVARCHAR(255),OBJTID INT,IDXNm NVARCHAR(255), IndexID INT, IndexType NVARCHAR(255),PercentFragmented FLOAT(53),FragCnt INT)

INSERT INTO #Tbl(tblName,OBJTID,IndexID,IndexType,PercentFragmented,FragCnt)
SELECT OBJECT_NAME(FizFats.object_id) AS TblName
,FizFats.object_id
,FizFats.index_id AS IDXID
,FizFats.index_type_desc
,FizFats.avg_fragmentation_in_percent
,FizFats.fragment_count
FROM sys.dm_db_index_physical_stats (NULL, NULL, NULL, NULL, NULL) FizFats
WHERE OBJECT_NAME(FizFats.object_id) IN (SELECT Name FROM sys.objects WHERE type = 'U')
AND FizFats.Fragment_count IS NOT NULL 
AND FizFats.avg_fragmentation_in_percent <> 0

--SELECT DISTINCT T.TblName, T.OBJTID, SI.name, T.IndexID, T.IndexType, T.PercentFragmented, T.FragCnt FROM sys.indexes SI
--INNER JOIN #Tbl T ON SI.index_id = T.indexid AND SI.object_id = T.OBJTID

UPDATE #Tbl SET IDXNm = SI.Name FROM sys.indexes SI INNER JOIN #Tbl T ON SI.index_id = T.indexid AND SI.object_id = T.OBJTID
--FROM #Tbl T INNER ON sys.indexes SI ON T.indexid = SI.index_id AND T.OBJTID = SI.object_id

SELECT * FROM #Tbl