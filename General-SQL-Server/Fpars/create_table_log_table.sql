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
			where id = object_id(N'[dbo].[log_table]') 
			and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[log_table]
GO

CREATE TABLE [dbo].[log_table](
	[partn_key] [int] NOT NULL,
	[work_id] [int] NOT NULL,
	[log_datetime] [datetime] NOT NULL,
	[log_type] [varchar](25) NOT NULL,
	[log_info] [varchar](100) NOT NULL,
	[log_err_code] [int] NULL,
	[log_err_desc] [varchar](100) NULL
) ON [app_logs]

GO

--ctreate PRIMARY KEY CLUSTERED 
ALTER TABLE [dbo].[log_table] 
ADD CONSTRAINT PK_log_table PRIMARY KEY CLUSTERED 
(
	[partn_key] ASC,
	[log_datetime] ASC,
	[work_id] ASC,
	[log_type] ASC,
	[log_info] ASC
)WITH FILLFACTOR = 90 ON [app_logs]



GO


