USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[log_table]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[log_table]
GO


IF OBJECT_ID('log_table') IS NOT NULL
DROP VIEW DBO.[log_table]
GO

IF OBJECT_ID('log_table_saved') IS NOT NULL
DROP VIEW DBO.[log_table_saved]
GO

CREATE    VIEW [dbo].[log_table_saved] 
AS
SELECT * FROM fpars.dbo.log_table_2009_Q1
UNION ALL
SELECT * FROM fpars.dbo.log_table_2009_Q2
UNION ALL
SELECT * FROM fpars.dbo.log_table_2009_Q3
UNION ALL
SELECT * FROM fpars.dbo.log_table_2009_Q4
UNION ALL
SELECT * FROM fpars.dbo.log_table_2010_Q1
UNION ALL
SELECT * FROM fpars.dbo.log_table_2010_Q2
UNION ALL
SELECT * FROM fpars.dbo.log_table_2010_Q3
UNION ALL
SELECT * FROM fpars.dbo.log_table_2010_Q4








GO


