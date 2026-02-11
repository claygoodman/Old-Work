USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

PRINT 'Insert into change_history...'
GO

INSERT INTO [dbo].[change_history]
	SELECT * 
	FROM [Fpars].[dbo].[change_hist_2008_Q4]	

GO

INSERT INTO [dbo].[change_history]
	SELECT * 
	FROM [Fpars].[dbo].[change_hist_2009_Q1]	

GO

INSERT INTO [dbo].[change_history]
	SELECT * 
	FROM [Fpars].[dbo].[change_hist_2009_Q2]	

GO

INSERT INTO [dbo].[change_history]
	SELECT * 
	FROM [Fpars].[dbo].[change_hist_2009_Q3]	

GO

INSERT INTO [dbo].[change_history]
	SELECT * 
	FROM [Fpars].[dbo].[change_hist_2009_Q4]	

GO

PRINT 'Insert into change_history Done'
GO
