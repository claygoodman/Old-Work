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
			where id = object_id(N'[dbo].[consldatr_mstr]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[consldatr_mstr]
GO

CREATE TABLE [dbo].[consldatr_mstr](
	[PARTN_KEY] [int] NOT NULL,
	[CONSLDATR_ID] [int] NOT NULL,
	[CONSLDATR_ID_SRC] [varchar](150) NOT NULL,
	[CONSLDATR_SRC_CODE] [varchar](25) NOT NULL,
	[MANIFEST_NO] [varchar](10) NULL,
	[MANIFEST_DTTM] [datetime] NULL,
	[TRAILER_NO] [varchar](10) NULL,
	[LOAD_NO] [varchar](10) NULL,
	[SEAL_NO] [varchar](10) NULL,
	[CARRIER_ID] [int] NOT NULL,
	[CARRIER_NO] [int] NULL,
	[CARRIER_SCAC] [varchar](10) NULL,
	[CARRIER_NAME] [varchar](35) NULL,
	[BILL_OF_LADING_NO] [varchar](40) NULL,
	[VENDOR_ID] [int] NOT NULL,
	[VENDOR_DUNS_NO] [varchar](20) NULL,
	[VENDOR_NAME] [varchar](40) NULL,
	[VENDOR_FREIGHT_TERM] [varchar](10) NULL,
	[VENDOR_ADDRESS1] [varchar](40) NULL,
	[VENDOR_CITY] [varchar](20) NULL,
	[VENDOR_STATE] [char](2) NULL,
	[VENDOR_ZIPCODE] [varchar](10) NULL,
	[CONSLDATR_RECEIPT_NO] [varchar](15) NULL,
	[CONSLDATR_RECEIPT_DTTM] [datetime] NULL,
	[CONSLDATR_SHIP_DTTM] [datetime] NULL,
	[NMG_RECEIVER_NO] [varchar](10) NULL,
	[COMPANY_ID] [int] NOT NULL,
	[NMG_COMPANY_CODE] [int] NULL,
	[FPARS_COMPANY_CODE] [int] NULL,
	[LOC_ID] [int] NOT NULL,
	[NMG_LOCATION_CODE] [smallint] NULL,
	[DEPT_ID] [int] NOT NULL,
	[DEPT_CODE] [smallint] NULL,
	[NO_OF_CARTONS] [smallint] NULL,
	[WEIGHT_IN_LBS] [smallint] NULL,
	[PICKUP_CHARGE] [money] NULL,
	[FUEL_CHARGE] [money] NULL,
	[CONSOLIDATION_CHARGE] [money] NULL,
	[RPTD_TTL_CHARGES] [money] NULL,
	[CALC_TTL_CHARGES] [money] NULL,
	[CHARGE_EXCEPTION_FLAG] [char](1) NULL,
	[LINE_HAUL_CHARGE] [money] NULL,
	[LINE_HAUL_MULTIPLIER] [money] NULL,
	[WORKFLOW_STEP] [varchar](25) NULL,
	[WORKFLOW_STATUS] [varchar](20) NULL,
	[CONSLDATR_STATUS] [char](1) NULL,
	[CONSLDATR_CRTD_DTTM] [datetime] NULL,
	[CONSLDATR_CRTD_WORK_ID] [int] NULL,
	[CONSLDATR_UPD_DTTM] [datetime] NULL,
	[CONSLDATR_UPD_WORK_ID] [int] NULL,
	[CONSLDATR_REC_CHKSUM] [int] NULL
) ON [con_mstr]

GO

--primary key
ALTER TABLE [dbo].[consldatr_mstr] 
ADD CONSTRAINT PK_consldatr_mstr PRIMARY KEY CLUSTERED 
(
	[PARTN_KEY] ASC,
	[CONSLDATR_ID] ASC,
	[CONSLDATR_ID_SRC] ASC
)WITH FILLFACTOR = 90 ON [con_mstr]



