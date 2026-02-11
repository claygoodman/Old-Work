USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[po_details]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[po_details]
GO


IF OBJECT_ID('po_details') IS NOT NULL
DROP VIEW DBO.[po_details]
GO

IF OBJECT_ID('po_details_saved') IS NOT NULL
DROP VIEW DBO.[po_details_saved]
GO

CREATE VIEW [dbo].[po_details_saved]
AS
SELECT * FROM fpars.dbo.po_details_2008_Q1
UNION ALL
SELECT * FROM fpars.dbo.po_details_2008_Q2
UNION ALL
SELECT * FROM fpars.dbo.po_details_2008_Q3
UNION ALL
SELECT * FROM fpars.dbo.po_details_2008_Q4
UNION ALL
SELECT * FROM fpars.dbo.po_details_2009_Q1
UNION ALL
SELECT * FROM fpars.dbo.po_details_2009_Q2
UNION ALL
SELECT * FROM fpars.dbo.po_details_2009_Q3
UNION ALL
SELECT * FROM fpars.dbo.po_details_2009_Q4
UNION ALL
SELECT * FROM fpars.dbo.po_details_2010_Q1
UNION ALL
SELECT * FROM fpars.dbo.po_details_2010_Q2
UNION ALL
SELECT * FROM fpars.dbo.po_details_2010_Q3
UNION ALL
SELECT * FROM fpars.dbo.po_details_2010_Q4
UNION ALL
SELECT * FROM fpars.dbo.po_details_2011_Q1
UNION ALL
SELECT * FROM fpars.dbo.po_details_2011_Q2
UNION ALL
SELECT * FROM fpars.dbo.po_details_2011_Q3
UNION ALL
SELECT * FROM fpars.dbo.po_details_2011_Q4








GO


