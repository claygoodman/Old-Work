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
			where id = object_id(N'[dbo].[consldatr_pos]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[consldatr_pos]
GO

CREATE TABLE [dbo].[consldatr_pos](
	[PARTN_KEY] [int] NOT NULL,
	[CONSLDATR_ID] [int] NOT NULL,
	[CONSLDATR_ID_SRC] [varchar](150) NOT NULL,
	[PURCHASE_ORDER_NO] [varchar](20) NOT NULL,
	[PURCHASE_ORDER_FOUND_FLAG] [char](1) NOT NULL,
	[CONSLDATRPO_STATUS] [char](1) NULL,
	[CONSLDATRPO_CRTD_DTTM] [datetime] NULL,
	[CONSLDATRPO_CRTD_WORK_ID] [int] NULL,
	[CONSLDATRPO_UPD_DTTM] [datetime] NULL,
	[CONSLDATRPO_UPD_WORK_ID] [int] NULL,
	[CONSLDATRPO_REC_CHKSUM] [int] NULL
) ON [con_pos]

GO

--create PRIMARY KEY CLUSTERED 
ALTER TABLE [dbo].[consldatr_pos] 
ADD CONSTRAINT PK_consldatr_pos PRIMARY KEY CLUSTERED 
(
	[PARTN_KEY] ASC,
	[CONSLDATR_ID] ASC,
	[CONSLDATR_ID_SRC] ASC,
	[PURCHASE_ORDER_NO] ASC
)WITH FILLFACTOR = 90 ON [con_pos]


GO


