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
			where id = object_id(N'[dbo].[invoice_mstr]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[invoice_mstr]
GO

CREATE TABLE [dbo].[invoice_mstr](
	[PARTN_KEY] [int] NOT NULL,
	[INVOICE_ID] [int] NOT NULL,
	[SRC_CODE] [varchar](10) NOT NULL,
	[MOVEMENT_DIRECTION] [varchar](20) NULL,
	[EDI_FILE_SRC_ID] [int] NULL,
	[EDI_FILE_ID] [int] NULL,
	[BATCH_NO] [varchar](7) NULL,
	[INVOICE_BATCH_NO] [varchar](15) NULL,
	[INVOICE_ID_SRC] [varchar](50) NOT NULL,
	[PRONO_TRACKING_NO] [varchar](26) NULL,
	[PRONO_TRACKING_NO_CLIPPED] [varchar](26) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[INVOICE_CREATED_DTTM] [datetime] NULL,
	[STORE_TERMINAL_TRANSACTION] [varchar](25) NULL,
	[EDI_EXCEPTION_HISTORY] [varchar](50) NULL,
	[COMPANY_ID] [int] NULL,
	[NMG_COMPANY_CODE] [smallint] NULL,
	[FPARS_COMPANY_CODE] [smallint] NULL,
	[LOC_ID] [int] NULL,
	[NMG_LOCATION_CODE] [smallint] NULL,
	[WORKFLOW_STEP] [varchar](25) NULL,
	[WORKFLOW_STATUS] [varchar](20) NULL,
	[HOLD_ACCTS_PAYABLE_CODE] [varchar](20) NULL,
	[HOLD_AGING_DAYS] [int] NULL,
	[HOLD_AGING_END_DATE] [datetime] NULL,
	[HOLD_AGING_CODE] [varchar](20) NULL,
	[HOLD_AUDIT_CODE] [varchar](25) NULL,
	[HOLD_DISTRIBUTIONCODE_CODE] [varchar](20) NULL,
	[HOLD_MATCH_CODE] [varchar](20) NULL,
	[HOLD_USER_CODE] [varchar](20) NULL,
	[HOLD_USER_REASON_CODE] [varchar](25) NULL,
	[HOLD_USER_REASON] [varchar](25) NULL,
	[HOLD_VERIFICATION_CODE] [varchar](20) NULL,
	[ORIGIN_NAME] [varchar](40) NULL,
	[ORIGIN_AUX_NAME] [varchar](40) NULL,
	[ORIGIN_ADDRESS1] [varchar](40) NULL,
	[ORIGIN_ADDRESS2] [varchar](40) NULL,
	[ORIGIN_CITY] [varchar](25) NULL,
	[ORIGIN_STATE] [char](2) NULL,
	[ORIGIN_ZIPCODE] [varchar](10) NULL,
	[ORIGIN_PHONE_NUMBER] [varchar](10) NULL,
	[ORIGIN_COUNTRY] [varchar](40) NULL,
	[ORIGIN_SUPPLIED_REFERENCE] [varchar](20) NULL,
	[ORIGIN_DECLARED_VALUE] [money] NULL,
	[DEST_NAME] [varchar](40) NULL,
	[DEST_AUX_NAME] [varchar](40) NULL,
	[DEST_ADDRESS1] [varchar](40) NULL,
	[DEST_ADDRESS2] [varchar](40) NULL,
	[DEST_CITY] [varchar](25) NULL,
	[DEST_STATE] [char](2) NULL,
	[DEST_PHONE_NUMBER] [varchar](10) NULL,
	[DEST_COUNTRY] [varchar](40) NULL,
	[DEST_ZIPCODE] [varchar](10) NULL,
	[DEST_BILL_OF_LADING] [varchar](17) NULL,
	[BILL_OF_LADING_SRC_ID] [int] NULL,
	[SHIPPED_DTTM] [datetime] NULL,
	[FREIGHT_CLASS] [varchar](25) NULL,
	[SERVICE_LEVEL] [varchar](80) NULL,
	[PACKAGE_TYPE] [varchar](80) NULL,
	[SHIPMENT_DESCRIPTION] [varchar](35) NULL,
	[DOMESTIC_SHIPMENT_FLAG] [char](1) NULL,
	[VENDOR_ID] [int] NULL,
	[GOODS_VENDOR_DUNS_NO] [varchar](11) NULL,
	[GOODS_HEIGHT_INCHES] [decimal](9, 2) NULL,
	[GOODS_LENGTH_INCHES] [decimal](9, 2) NULL,
	[GOODS_WIDTH_INCHES] [decimal](9, 2) NULL,
	[GOODS_WEIGHT_DIMENSIONAL] [varchar](10) NULL,
	[GOODS_WEIGHT_DIMENSIONAL_FLAG] [char](1) NULL,
	[GOODS_WEIGHT_TTL_LBS] [int] NULL,
	[GOODS_HAZARDOUS_FLAG] [char](1) NULL,
	[PURCHASE_ORDER_FOUND_FLAG] [char](1) NULL,
	[PURCHASE_ORDER_NO] [varchar](25) NULL,
	[OTHER_REFERENCE_NO] [varchar](50) NULL,
	[ORDER_ID] [int] NULL,
	[ORDER_NUMBER] [varchar](10) NULL,
	[ORDER_TICKET_NUMBER] [varchar](15) NULL,
	[ORDER_DTL_NUMBER] [varchar](15) NULL,
	[CARRIER_ID] [int] NULL,
	[CARRIER_NAME] [varchar](35) NULL,
	[CARRIER_NO] [int] NULL,
	[CARRIER_SCAC] [char](4) NULL,
	[CARRIER_TRAILER_NO] [varchar](13) NULL,
	[CARRIER_ACCT_NO] [varchar](35) NULL,
	[CARRIER_MANIFEST_ID] [int] NULL,
	[CARRIER_MANIFEST] [varchar](10) NULL,
	[CARRIER_EXCEPTN_RESPONSE_CODE] [varchar](25) NULL,
	[CARRIER_EXCEPTN_RESPONSE_DTTM] [datetime] NULL,
	[MULTIPLE_CARRIER_FLAG] [char](1) NULL,
	[DELIVERY_ATTMPT1_DTTM] [datetime] NULL,
	[DELIVERY_ATTMPT2_DTTM] [datetime] NULL,
	[DELIVERY_EXCEPTION_CODE] [varchar](75) NULL,
	[RATER_AUDITOR_REMARK] [varchar](50) NULL,
	[RATER_DISCOUNT] [varchar](4) NULL,
	[RATER_ERROR] [int] NULL,
	[RATER_INPUT_OUTPUT] [varchar](254) NULL,
	[RATER_MILEAGE] [int] NULL,
	[RATER_REMARK_DATA] [varchar](50) NULL,
	[RATER_WORKFLOW_CODE] [varchar](30) NULL,
	[TTL_PIECES] [int] NULL,
	[DISCOUNT_BILLED] [varchar](4) NULL,
	[MILEAGE_BILLED] [int] NULL,
	[TTL_AMT_BILLED] [money] NULL,
	[TTL_AMT_PAID] [money] NULL,
	[BILLING_DISCREPANCY] [char](1) NULL,
	[PAYMENT_CHECK_NO_SRC] [varchar](13) NULL,
	[PAYMENT_CHECK_NO_FPARS] [varchar](13) NULL,
	[PAYMENT_DTTM_SRC] [datetime] NULL,
	[PAYMENT_DTTM_FPARS] [datetime] NULL,
	[PAYMENT_METHOD] [varchar](25) NULL,
	[PAYMENT_SET_ID_SRC] [varchar](25) NULL,
	[DISTRIBUTION_SPLIT_COUNT] [int] NULL,
	[DISTRIBUTION_SPLIT_TYPE_CODE] [varchar](20) NULL,
	[UPD_DTTM_SRC] [datetime] NULL,
	[VERIFICATION_DTTM] [datetime] NULL,
	[INVHDR_STATUS] [char](1) NULL,
	[INVHDR_CRTD_DTTM] [datetime] NULL,
	[INVHDR_CRTD_WORK_ID] [int] NULL,
	[INVHDR_UPD_DTTM] [datetime] NULL,
	[INVHDR_UPD_WORK_ID] [int] NULL,
	[INVHDR_CHKSUM] [int] NULL
) ON [inv_mstr]

GO

--ctreate PRIMARY KEY CLUSTERED 
ALTER TABLE [dbo].[invoice_mstr] 
ADD CONSTRAINT PK_invoice_mstr PRIMARY KEY CLUSTERED 
(
	[PARTN_KEY] ASC,
	[INVOICE_ID] ASC,
	[SRC_CODE] ASC,
	[INVOICE_ID_SRC] ASC
)WITH FILLFACTOR = 90 ON [inv_mstr]




GO


