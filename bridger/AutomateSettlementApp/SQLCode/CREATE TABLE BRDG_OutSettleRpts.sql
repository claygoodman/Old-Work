USE TMW_Live
GO

/**************************************************COMMENTS****************************************
Bridger
dgoodman
3/23/2018

**************************************************DECLARATIONS****************************************/


--**************************************************TABLES****************************************


--**************************************************CODE****************************************



	IF EXISTS(SELECT * FROM sys.tables WHERE name = 'BRDG_OutSettleRpts')
	DROP TABLE BRDG_OutSettleRpts
	GO

	CREATE TABLE BRDG_OutSettleRpts(
		OSRID			INT IDENTITY(1,1)
		,PayTo			VARCHAR(10)
		,Fleet			VARCHAR(10)
		,RptFileName	VARCHAR(150)
		,PayDate		DATE
		)