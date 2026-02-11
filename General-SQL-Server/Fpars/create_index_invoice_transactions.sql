USE [Fpars]
GO

CREATE NONCLUSTERED INDEX [fpars_inv_trans] 
ON [dbo].[invoice_transactions] 
(
	[PRONO_TRACKING_NO_CLIPPED] ASC
)WITH FILLFACTOR = 33 ON [PRIMARY]



GO


