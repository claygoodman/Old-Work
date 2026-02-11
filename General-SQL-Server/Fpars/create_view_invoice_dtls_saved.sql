USE [Fpars]
GO

/****** Object:  View [dbo].[invoice_dtls]    Script Date: 10/05/2009 13:43:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[invoice_dtls]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[invoice_dtls]
GO


IF OBJECT_ID('invoice_dtls') IS NOT NULL
DROP VIEW DBO.[invoice_dtls]
GO

IF OBJECT_ID('invoice_dtls_saved') IS NOT NULL
DROP VIEW DBO.[invoice_dtls_saved]
GO

create     VIEW [dbo].[invoice_dtls_saved] 
AS 
 SELECT * FROM fpars.dbo.invoice_dtls_2008_Q1 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_dtls_2008_Q2
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_dtls_2008_Q3 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_dtls_2008_Q4 
 UNION ALL
 SELECT * FROM fpars.dbo.invoice_dtls_2009_Q1 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_dtls_2009_Q2 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_dtls_2009_Q3 
 UNION ALL 
 SELECT * FROM fpars.dbo.invoice_dtls_2009_Q4 






GO


