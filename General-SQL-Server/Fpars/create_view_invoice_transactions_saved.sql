USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[invoice_transactions]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[invoice_transactions]
GO


IF OBJECT_ID('invoice_transactions') IS NOT NULL
DROP VIEW DBO.[invoice_transactions]
GO

IF OBJECT_ID('invoice_transactions_saved') IS NOT NULL
DROP VIEW DBO.[invoice_transactions_saved]
GO

create  view [dbo].[invoice_transactions_saved]
as
select * from invoice_transactions_2008_q1
union all
select * from invoice_transactions_2008_q2
union all
select * from invoice_transactions_2008_q3
union all
select * from invoice_transactions_2008_q4
union all
select * from invoice_transactions_2009_q1
union all
select * from invoice_transactions_2009_q2
union all
select * from invoice_transactions_2009_q3
union all
select * from invoice_transactions_2009_q4




GO


