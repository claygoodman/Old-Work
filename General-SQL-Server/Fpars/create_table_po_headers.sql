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
			where id = object_id(N'[dbo].[po_headers]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[po_headers]
GO

CREATE TABLE [dbo].[po_headers](
	[partn_key] [int] NOT NULL,
	[po_number] [varchar](20) NOT NULL,
	[po_status] [char](1) NOT NULL,
	[company_id] [int] NOT NULL,
	[nmg_company_code] [smallint] NOT NULL,
	[fpars_company_code] [smallint] NOT NULL,
	[revisn_number] [smallint] NULL,
	[created_date] [datetime] NOT NULL,
	[fiscal_yyyymm] [int] NULL,
	[comment1] [varchar](60) NULL,
	[comment2] [varchar](60) NULL,
	[comment3] [varchar](60) NULL,
	[comment4] [varchar](60) NULL,
	[auto_cancel_date] [datetime] NULL,
	[ship_after_date] [datetime] NULL,
	[apprvl_date] [datetime] NULL,
	[partl_recvd_ind] [char](1) NULL,
	[compltd_date] [datetime] NULL,
	[orignl_cancel_date] [datetime] NULL,
	[prev_cancel_date] [datetime] NULL,
	[exit_factory_cancel_date] [datetime] NULL,
	[exit_factory_date] [datetime] NULL,
	[prnt_ind] [char](1) NULL,
	[prnt_date] [datetime] NULL,
	[src_code] [varchar](20) NULL,
	[lcl_currency] [varchar](20) NULL,
	[div_code] [smallint] NULL,
	[warehse_code] [smallint] NULL,
	[buyer_code] [varchar](10) NULL,
	[buyer_name] [varchar](30) NULL,
	[vndr_number] [varchar](10) NULL,
	[vndr_HSE_number] [smallint] NULL,
	[vndr_name] [varchar](50) NULL,
	[vndr_contact_name] [varchar](30) NULL,
	[vndr_contact_method] [varchar](20) NULL,
	[vndr_contact_phone1] [varchar](10) NULL,
	[vndr_contact_phone2] [varchar](10) NULL,
	[vndr_discnt_percentage] [smallint] NULL,
	[vndr_discnt_days_good] [smallint] NULL,
	[vndr_terms] [varchar](20) NULL,
	[advnc_allowance_code] [varchar](10) NULL,
	[advnc_allowance_amt] [money] NULL,
	[advnc_allowance_percentage] [smallint] NULL,
	[freight_desc] [varchar](30) NULL,
	[freight_charge] [varchar](30) NULL,
	[stores_csv] [varchar](15) NULL,
	[lst_maintenance_date] [datetime] NULL,
	[total_cost] [money] NULL,
	[special_order_ind] [char](1) NULL,
	[pohdr_rec_chcksum] [int] NULL,
	[pohdr_crtd_date] [datetime] NULL,
	[pohdr_crtd_work_id] [int] NULL,
	[pohdr_upd_date] [datetime] NULL,
	[pohdr_upd_work_id] [int] NULL
) ON [po_hdrs]

GO

--ctreate PRIMARY KEY CLUSTERED 
ALTER TABLE [dbo].[po_headers] 
ADD CONSTRAINT PK_po_headers PRIMARY KEY CLUSTERED 
(
	[partn_key] ASC,
	[nmg_company_code] ASC,
	[po_number] ASC
)WITH FILLFACTOR = 90 ON [po_hdrs]



GO


