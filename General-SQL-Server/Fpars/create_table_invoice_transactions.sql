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
			where id = object_id(N'[dbo].[invoice_transactions]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[invoice_transactions]
GO

CREATE TABLE [dbo].[invoice_transactions](
	[partn_key] [int] NOT NULL,
	[inv_partn_key] [int] NOT NULL,
	[INVOICE_ID] [int] NOT NULL,
	[INVOICE_ID_SRC] [varchar](50) NOT NULL,
	[SRC_CODE] [varchar](10) NOT NULL,
	[ACCOUNTING_METHOD] [varchar](10) NOT NULL,
	[TRANS_DESCRIPTION] [varchar](50) NOT NULL,
	[DEBIT_ACCT_ID] [int] NULL,
	[DEBIT_ACCT_NO] [varchar](50) NULL,
	[DEBIT_LEGACY_CODE] [varchar](35) NOT NULL,
	[DEBIT_CODE_TYPE] [varchar](20) NOT NULL,
	[CREDIT_ACCT_ID] [int] NULL,
	[CREDIT_ACCT_NO] [varchar](50) NULL,
	[CREDIT_LEGACY_CODE] [varchar](35) NOT NULL,
	[TRANS_AMT] [money] NOT NULL,
	[PRONO_TRACKING_NO] [varchar](26) NULL,
	[PRONO_TRACKING_NO_CLIPPED] [varchar](26) NULL,
	[COMPANY_ID] [int] NOT NULL,
	[NMG_COMPANY_CODE] [smallint] NULL,
	[FPARS_COMPANY_CODE] [smallint] NULL,
	[DEPT_ID] [int] NOT NULL,
	[DEPT_CODE] [smallint] NULL,
	[LOC_ID] [int] NOT NULL,
	[NMG_LOCATION_CODE] [smallint] NULL,
	[CARRIER_ID] [int] NULL,
	[CARRIER_SCAC] [char](4) NULL,
	[transet_id] [int] NOT NULL,
	[workflow_step] [varchar](25) NOT NULL,
	[workflow_status] [varchar](20) NOT NULL,
	[trans_status] [char](1) NOT NULL,
	[trans_crtd_dttm] [datetime] NOT NULL,
	[trans_crtd_work_id] [int] NOT NULL,
	[trans_upd_dttm] [datetime] NOT NULL,
	[trans_upd_work_id] [int] NOT NULL
) ON [inv_trans]

GO

--ctreate PRIMARY KEY CLUSTERED 
ALTER TABLE [dbo].[invoice_transactions] 
ADD CONSTRAINT PK_invoice_transactions PRIMARY KEY CLUSTERED 
(
	[partn_key] ASC,
	[INVOICE_ID] ASC,
	[ACCOUNTING_METHOD] ASC,
	[DEBIT_LEGACY_CODE] ASC,
	[CREDIT_LEGACY_CODE] ASC,
	[TRANS_DESCRIPTION] ASC,
	[trans_crtd_dttm] ASC
)WITH FILLFACTOR = 90 ON [inv_trans]

GO


