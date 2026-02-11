USE [TMW_Live]
GO
/*******************************************************COMMENTS********************************************
Bridger
dgoodman
2/5/2017

Usage:
called by the "SettlementApp" during the load of the "New" form

*******************************************************DECLARATIONS********************************************/


--*******************************************************TABLES********************************************


--*******************************************************CODE********************************************
	IF EXISTS(SELECT * FROM sys.procedures WHERE name = 'p_BRDG_UniquePayPeriods')
	DROP PROCEDURE p_BRDG_UniquePayPeriods
	GO

	CREATE PROCEDURE p_BRDG_UniquePayPeriods
	AS

		SELECT DISTINCT
			pyh_payperiod
	FROM TMW_Live.dbo.payheader
	ORDER BY pyh_payperiod DESC

GO


