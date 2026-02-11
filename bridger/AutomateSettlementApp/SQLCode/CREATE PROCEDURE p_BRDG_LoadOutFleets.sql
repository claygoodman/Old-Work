USE TMW_Live
GO

	IF EXISTS(SELECT * FROM sys.procedures WHERE name = 'p_BRDG_LoadOutFleets')
	DROP PROCEDURE p_BRDG_LoadOutFleets
	GO

	CREATE PROCEDURE p_BRDG_LoadOutFleets
	(@dt DATE)
	AS

/*******************************************************COMMENTS********************************************
Bridger
dgoodman
2/2/2018

This is called when the app starts up

*******************************************************DECLARATIONS********************************************/


--*******************************************************TABLES********************************************



--*******************************************************CODE********************************************
	TRUNCATE TABLE TMW_Live.dbo.BRDG_OutFleets

	INSERT TMW_Live.dbo.BRDG_OutFleets(
		Fleet
		,PayDate
		)
	SELECT 
		DISTINCT M.mpp_fleet
		,@dt	
	FROM TMW_Live.dbo.manpowerprofile M
	INNER JOIN TMW_Live.dbo.payheader P ON P.asgn_id = M.mpp_id
	LEFT JOIN TMW_Live.dbo.BRDG_Fleets F ON M.mpp_fleet = F.Fleet
	WHERE 
		 M.mpp_type1 IN (
						  'OO'
						  ,'OWNONL'
						  )
		 AND F.PayDate IS NULL
		 AND M.mpp_status IN (
							  'OUT'
							  ,'PTERM'
							  ,'PTERMI'
							  )
		AND P.pyh_totalcomp <> 0
	RETURN 1