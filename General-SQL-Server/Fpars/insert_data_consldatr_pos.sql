
USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

PRINT 'Insert into consldatr_pos...'
GO

--insert data

INSERT INTO [dbo].[consldatr_pos]
	SELECT * 
	FROM [Fpars].[dbo].[consldatr_pos_2008_Q1]	

GO

INSERT INTO [dbo].[consldatr_pos]
	SELECT * 
	FROM [Fpars].[dbo].[consldatr_pos_2008_Q2]	

GO

INSERT INTO [dbo].[consldatr_pos]
	SELECT * 
	FROM [Fpars].[dbo].[consldatr_pos_2008_Q3]	

GO

INSERT INTO [dbo].[consldatr_pos]
	SELECT * 
	FROM [Fpars].[dbo].[consldatr_pos_2008_Q4]	

GO

INSERT INTO [dbo].[consldatr_pos]
	SELECT * 
	FROM [Fpars].[dbo].[consldatr_pos_2009_Q1]	

GO

INSERT INTO [dbo].[consldatr_pos]
	SELECT * 
	FROM [Fpars].[dbo].[consldatr_pos_2009_Q2]	

GO

INSERT INTO [dbo].[consldatr_pos]
	SELECT * 
	FROM [Fpars].[dbo].[consldatr_pos_2009_Q3]	

GO

INSERT INTO [dbo].[consldatr_pos]
	SELECT * 
	FROM [Fpars].[dbo].[consldatr_pos_2009_Q4]	

GO

PRINT 'Insert into consldatr_pos Done'
GO