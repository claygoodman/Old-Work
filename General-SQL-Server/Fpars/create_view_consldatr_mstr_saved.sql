USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[consldatr_mstr]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[consldatr_mstr]
GO


IF OBJECT_ID('consldatr_mstr') IS NOT NULL
DROP VIEW DBO.[consldatr_mstr]
GO

IF OBJECT_ID('consldatr_mstr_saved') IS NOT NULL
DROP VIEW DBO.[consldatr_mstr_saved]
GO


CREATE  view [dbo].[consldatr_mstr_saved]
as
select * from consldatr_mstr_2008_Q1
union all
select * from consldatr_mstr_2008_Q2
union all
select * from consldatr_mstr_2008_Q3
union all
select * from consldatr_mstr_2008_Q4
union all
select * from consldatr_mstr_2009_Q1
union all
select * from consldatr_mstr_2009_Q2
union all
select * from consldatr_mstr_2009_Q3
union all
select * from consldatr_mstr_2009_Q4




GO


