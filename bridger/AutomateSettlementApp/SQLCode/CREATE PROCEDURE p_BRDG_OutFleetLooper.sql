USE TMW_Live
GO

	IF EXISTS(SELECT * FROM sys.procedures WHERE name = 'p_BRDG_OutFleetLooper')
	DROP PROCEDURE p_BRDG_OutFleetLooper
	GO
	
	CREATE PROCEDURE p_BRDG_OutFleetLooper(
		@RwCnt		INT
	)
	AS
	/*******************************************************COMMENTS********************************************
	Bridger
	dgoodman
	3/22/2018

	Usage: 
	
	Returns the Fleet ID used by the powershell

	*******************************************************DECLARATIONS********************************************/
	--DECLARE @SET_DATE VARCHAR(10) = '12/31/2017'
	DECLARE @Fleet VARCHAR(10) 
	
	DECLARE @Dy VARCHAR(5)
	DECLARE @Mo VARCHAR(5)
	DECLARE @Yr VARCHAR(6)

--*******************************************************TABLES********************************************


--*******************************************************CODE********************************************

	SELECT  Fleet 
	FROM BRDG_OutFleets 
	WHERE FLeetID = @RwCnt

