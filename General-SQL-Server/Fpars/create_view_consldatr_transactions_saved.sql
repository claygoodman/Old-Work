USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[consldatr_transactions]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[consldatr_transactions]
GO


IF OBJECT_ID('consldatr_transactions') IS NOT NULL
DROP VIEW DBO.[consldatr_transactions]
GO

IF OBJECT_ID('consldatr_transactions_saved') IS NOT NULL
DROP VIEW DBO.[consldatr_transactions_saved]
GO

create view [dbo].[consldatr_transactions_saved]
as
select * from consldatr_transactions_2008_Q1
union all
select * from consldatr_transactions_2008_Q2
union all
select * from consldatr_transactions_2008_Q3
union all
select * from consldatr_transactions_2008_Q4
union all
select * from consldatr_transactions_2009_Q1
union all
select * from consldatr_transactions_2009_Q2
union all
select * from consldatr_transactions_2009_Q3
union all
select * from consldatr_transactions_2009_Q4





GO


