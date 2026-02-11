USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if exists (select * from dbo.sysobjects 
			where id = object_id(N'[dbo].[po_headers]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[po_headers]
GO

IF OBJECT_ID('po_headers') IS NOT NULL
DROP VIEW DBO.[po_headers]
GO

IF OBJECT_ID('po_headers_saved') IS NOT NULL
DROP VIEW DBO.[po_headers_saved]
GO

CREATE    VIEW [dbo].[po_headers_saved] 
AS
SELECT * FROM fpars.dbo.po_headers_2008_Q1
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2008_Q2
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2008_Q3
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2008_Q4
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2009_Q1
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2009_Q2
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2009_Q3
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2009_Q4
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2010_Q1
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2010_Q2
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2010_Q3
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2010_Q4
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2011_Q1
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2011_Q2
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2011_Q3
UNION ALL
SELECT * FROM fpars.dbo.po_headers_2011_Q4






GO


