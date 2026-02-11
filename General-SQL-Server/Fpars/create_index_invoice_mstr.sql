USE [Fpars]
GO

CREATE NONCLUSTERED INDEX [fpars_inv_mstr_idsrc] 
ON [dbo].[invoice_mstr] 
(
	[INVOICE_ID_SRC] ASC
)WITH FILLFACTOR = 33 ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [fpars_inv_mstr_prono] 
ON [dbo].[invoice_mstr] 
(
	[PRONO_TRACKING_NO_CLIPPED] ASC
)WITH FILLFACTOR = 33 ON [PRIMARY]

GO
