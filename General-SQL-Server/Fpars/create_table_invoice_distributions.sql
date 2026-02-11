USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

if exists (select * 
			from dbo.sysobjects 
			where id = object_id(N'[dbo].[invoice_distributions]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[invoice_distributions]
GO

CREATE TABLE [dbo].[invoice_distributions](
	[PARTN_KEY] [int] NOT NULL,
	[INVOICE_ID] [int] NOT NULL,
	[INVOICE_ID_SRC] [varchar](50) NOT NULL,
	[INVDISB_SEQUENCE_NO] [smallint] NOT NULL,
	[INVDISB_ACCT_ID] [int] NULL,
	[INVDISB_ACCT_NO] [varchar](50) NULL,
	[INVDISB_CODE_LEGACY] [varchar](35) NULL,
	[INVDISB_CODE_TYPE] [varchar](20) NULL,
	[INVDISB_AMT] [money] NULL,
	[COMPANY_ID] [int] NULL,
	[NMG_COMPANY_CODE] [smallint] NULL,
	[FPARS_COMPANY_CODE] [smallint] NULL,
	[DEPT_ID] [int] NULL,
	[DEPT_CODE] [smallint] NULL,
	[LOCATION_ID] [int] NULL,
	[NMG_LOC_STORE_NO] [smallint] NULL,
	[INVDISB_STATUS] [char](1) NULL,
	[INVDISB_CRTD_DTTM] [datetime] NULL,
	[INVDISB_CRTD_WORK_ID] [int] NULL,
	[INVDISB_UPD_DTTM] [datetime] NULL,
	[INVDISB_UPD_WORK_ID] [int] NULL,
	[INVDISB_CHKSUM] [int] NULL
) ON [inv_dist]

GO

--ctreate PRIMARY KEY CLUSTERED 
ALTER TABLE [dbo].[invoice_distributions] 
ADD CONSTRAINT PK_invoice_distributions PRIMARY KEY CLUSTERED 
(
	[PARTN_KEY] ASC,
	[INVOICE_ID] ASC,
	[INVOICE_ID_SRC] ASC,
	[INVDISB_SEQUENCE_NO] ASC
)WITH FILLFACTOR = 90 ON [inv_dist]


GO


