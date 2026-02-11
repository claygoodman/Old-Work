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
			where id = object_id(N'[dbo].[change_history]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[change_history]
GO

CREATE TABLE [dbo].[change_history](
	[partn_key] [int] NOT NULL,
	[work_id] [int] NOT NULL,
	[chg_datetime] [datetime] NOT NULL,
	[chg_table] [varchar](50) NOT NULL,
	[table_id] [int] NOT NULL,
	[chg_column] [varchar](50) NOT NULL,
	[chg_orig_value] [varchar](100) NOT NULL,
	[chg_new_value] [varchar](100) NOT NULL,
	[chg_type_code] [varchar](25) NOT NULL,
	[chg_type_desc] [varchar](100) NOT NULL,
	[chg_comment] [varchar](100) NULL,
	[chg_trigger_comment] [varchar](100) NULL,
	[rule_id] [int] NULL	
) ON [chg_hist]

GO

--ctreate PRIMARY KEY CLUSTERED 
ALTER TABLE [dbo].[change_history] 
ADD CONSTRAINT PK_change_history PRIMARY KEY CLUSTERED 
(
	[chg_table] ASC,
	[table_id] ASC,
	[chg_column] ASC,
	[chg_orig_value] ASC,
	[chg_new_value] ASC,
	[partn_key] ASC,
	[work_id] ASC,
	[chg_datetime] ASC,
	[chg_type_code] ASC,
	[chg_type_desc] ASC
)WITH FILLFACTOR = 90 ON [chg_hist]
GO




