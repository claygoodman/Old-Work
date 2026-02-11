USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[invoice_mstr]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[invoice_mstr]
GO


IF OBJECT_ID('invoice_mstr') IS NOT NULL
DROP VIEW DBO.[invoice_mstr]
GO

IF OBJECT_ID('invoice_mstr_saved') IS NOT NULL
DROP VIEW DBO.[invoice_mstr_saved]
GO

CREATE VIEW [dbo].[invoice_mstr_saved] 
AS 
 SELECT * FROM fpars.dbo.invoice_mstr_2008_Q1 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_mstr_2008_Q2 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_mstr_2008_Q3 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_mstr_2008_Q4 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_mstr_2009_Q1 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_mstr_2009_Q2 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_mstr_2009_Q3 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_mstr_2009_Q4

GO


