USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[consldatr_pos]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[consldatr_pos]
GO


IF OBJECT_ID('consldatr_pos') IS NOT NULL
DROP VIEW DBO.[consldatr_pos]
GO

IF OBJECT_ID('consldatr_pos_saved') IS NOT NULL
DROP VIEW DBO.[consldatr_pos_saved]
GO

create view [dbo].[consldatr_pos_saved]
as
select * from consldatr_pos_2008_Q1
union all
select * from consldatr_pos_2008_Q2
union all
select * from consldatr_pos_2008_Q3
union all
select * from consldatr_pos_2008_Q4
union all
select * from consldatr_pos_2009_Q1
union all
select * from consldatr_pos_2009_Q2
union all
select * from consldatr_pos_2009_Q3
union all
select * from consldatr_pos_2009_Q4



GO


