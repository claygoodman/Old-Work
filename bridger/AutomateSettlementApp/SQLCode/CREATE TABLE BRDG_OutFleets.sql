USE TMW_Live
GO

/**************************************************COMMENTS****************************************
Bridger
dgoodman
3/22/2018

**************************************************DECLARATIONS****************************************/


--**************************************************TABLES****************************************


--**************************************************CODE****************************************



	IF EXISTS(SELECT * FROM sys.tables WHERE name = 'BRDG_OutFleets')
	DROP TABLE BRDG_OutFleets
	GO

	CREATE TABLE BRDG_OutFleets(
		FleetID		INT IDENTITY(1,1)
		,Fleet		VARCHAR(10)
		,FileStart	DATETIME
		,FileEnd	DATETIME
		,PayDate	DATE
		,Delta		AS DATEDIFF(MINUTE,FileStart,FileEnd) PERSISTED
		)
