USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[change_history]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[change_history]
GO


IF OBJECT_ID('change_history') IS NOT NULL
DROP VIEW DBO.[change_history]
GO

IF OBJECT_ID('change_history_saved') IS NOT NULL
DROP VIEW DBO.[change_history_saved]
GO

CREATE    VIEW [dbo].[change_history_saved] 
AS
SELECT * FROM fpars.dbo.change_hist_2008_Q4
UNION ALL
SELECT * FROM fpars.dbo.change_hist_2009_Q1
UNION ALL
SELECT * FROM fpars.dbo.change_hist_2009_Q2
UNION ALL
SELECT * FROM fpars.dbo.change_hist_2009_Q3
UNION ALL
SELECT * FROM fpars.dbo.change_hist_2009_Q4



GO


