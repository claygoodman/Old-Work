USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[consldatr_distributions]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[consldatr_distributions]
GO


IF OBJECT_ID('consldatr_distributions') IS NOT NULL
DROP VIEW DBO.consldatr_distributions
GO

IF OBJECT_ID('consldatr_distributions_saved') IS NOT NULL
DROP VIEW DBO.consldatr_distributions_saved
GO

create view [dbo].[consldatr_distributions_saved]
as
select * from consldatr_distributions_2008_Q1
union all
select * from consldatr_distributions_2008_Q2
union all
select * from consldatr_distributions_2008_Q3
union all
select * from consldatr_distributions_2008_Q4
union all
select * from consldatr_distributions_2009_Q1
union all
select * from consldatr_distributions_2009_Q2
union all
select * from consldatr_distributions_2009_Q3
union all
select * from consldatr_distributions_2009_Q4




GO


