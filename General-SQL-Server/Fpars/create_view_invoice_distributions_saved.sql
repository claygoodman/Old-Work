USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[invoice_distributions]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[invoice_distributions]
GO


IF OBJECT_ID('invoice_distributions') IS NOT NULL
DROP VIEW DBO.invoice_distributions
GO

IF OBJECT_ID('invoice_distributions_saved') IS NOT NULL
DROP VIEW DBO.[invoice_distributions_saved]
GO

CREATE   VIEW [dbo].[invoice_distributions_saved] 
AS 
 SELECT * FROM fpars.dbo.invoice_distributions_2008_Q1 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_distributions_2008_Q2
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_distributions_2008_Q3 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_distributions_2008_Q4 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_distributions_2009_Q1 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_distributions_2009_Q2 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_distributions_2009_Q3 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_distributions_2009_Q4 





GO


