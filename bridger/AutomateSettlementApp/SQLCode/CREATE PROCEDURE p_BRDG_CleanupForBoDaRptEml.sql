USE TMW_Live
GO
/**************************************************COMMENTS****************************************
Bridger
dgoodman
3/22/2018

**************************************************DECLARATIONS****************************************/


--**************************************************TABLES****************************************


--**************************************************CODE****************************************


	IF EXISTS(SELECT * FROM sys.procedures WHERE name = 'p_BRDG_CleanupForBoDaRptEml')
	DROP PROCEDURE p_BRDG_CleanupForBoDaRptEml
	GO

	CREATE PROCEDURE p_BRDG_CleanupForBoDaRptEml

	AS

	DELETE BRDG_EmailSettlements

	TRUNCATE TABLE BRDG_TrackPids

	TRUNCATE TABLE BRDG_Fleets

	TRUNCATE TABLE BRDG_OutFleets

	TRUNCATE TABLE BRDG_OutSettleRpts