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
			where id = object_id(N'[dbo].[invoice_dtls]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[invoice_dtls]
GO

CREATE TABLE [dbo].[invoice_dtls](
	[PARTN_KEY] [int] NOT NULL,
	[INVOICE_ID] [int] NOT NULL,
	[INVOICE_ID_SRC] [varchar](50) NOT NULL,
	[INVDTL_SEQUENCE_NO] [decimal](5, 3) NOT NULL,
	[INVDTL_NO_PIECES] [int] NOT NULL,
	[INVDTL_NO_PIECES_QUALIFER] [varchar](20) NULL,
	[INVDTL_DESCRIPTION] [varchar](35) NULL,
	[INVDTL_NATL_MTR_FREIGHT_CLASS] [varchar](70) NULL,
	[INVDTL_CLASS] [varchar](20) NULL,
	[INVDTL_WEIGHT_LBS] [int] NULL,
	[INVDTL_RATE] [money] NULL,
	[INVDTL_RATE_QUALIFIER] [varchar](20) NULL,
	[INVDTL_CHARGE_AMT] [money] NULL,
	[INVDTL_CHARGE_CODE] [varchar](80) NULL,
	[INVDTL_TYPE_CODE] [varchar](20) NULL,
	[INVDTL_STATUS] [char](1) NULL,
	[INVDTL_CRTD_DTTM] [datetime] NULL,
	[INVDTL_CRTD_WORK_ID] [int] NULL,
	[INVDTL_UPD_DTTM] [datetime] NULL,
	[INVDTL_UPD_WORK_ID] [int] NULL,
	[INVDTL_CHKSUM] [int] NULL
) ON [inv_det]

GO

--ctreate PRIMARY KEY CLUSTERED 
ALTER TABLE [dbo].[invoice_dtls] 
ADD CONSTRAINT PK_invoice_dtls PRIMARY KEY CLUSTERED 
(
	[PARTN_KEY] ASC,
	[INVOICE_ID] ASC,
	[INVOICE_ID_SRC] ASC,
	[INVDTL_SEQUENCE_NO] ASC,
	[INVDTL_NO_PIECES] ASC
)WITH FILLFACTOR = 90 ON [inv_det]



GO


