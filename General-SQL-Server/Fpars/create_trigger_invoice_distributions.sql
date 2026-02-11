USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE  TRIGGER [dbo].[TR_fpars_invoice_distributions]
ON [Fpars].[dbo].[invoice_distributions]
AFTER UPDATE 
AS 

    declare @chg_comment varchar(100)

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.invdisb_upd_work_id as work_id,
           getdate() as chg_datetime,
           'INVOICE_DISTRIBUTIONS', 
           i.invoice_id, 
           'FPARS_COMPANY_CODE' as chg_column,
           convert(varchar, d.FPARS_COMPANY_CODE) as chg_orig_value,
           convert(varchar, i.FPARS_COMPANY_CODE) as chg_new_value,
           'UPDATED',
           'Column Updated',
           convert(varchar, i.invdisb_sequence_no) as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.invoice_id = i.invoice_id and d.invdisb_sequence_no = i.invdisb_sequence_no
     where d.FPARS_COMPANY_CODE <> i.FPARS_COMPANY_CODE
       and d.FPARS_COMPANY_CODE is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.invdisb_upd_work_id as work_id,
           getdate() as chg_datetime,
           'INVOICE_DISTRIBUTIONS', 
           i.invoice_id, 
           'NMG_LOC_STORE_NO' as chg_column,
           convert(varchar, d.NMG_LOC_STORE_NO) as chg_orig_value,
           convert(varchar, i.NMG_LOC_STORE_NO) as chg_new_value,
           'UPDATED',
           'Column Updated',
           convert(varchar, i.invdisb_sequence_no) as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.invoice_id = i.invoice_id and d.invdisb_sequence_no = i.invdisb_sequence_no
     where d.NMG_LOC_STORE_NO <> i.NMG_LOC_STORE_NO
       and d.NMG_LOC_STORE_NO is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.invdisb_upd_work_id as work_id,
           getdate() as chg_datetime,
           'INVOICE_DISTRIBUTIONS', 
           i.invoice_id, 
           'DEPT_CODE' as chg_column,
           convert(varchar, d.DEPT_CODE) as chg_orig_value,
           convert(varchar, i.DEPT_CODE) as chg_new_value,
           'UPDATED',
           'Column Updated',
           convert(varchar, i.invdisb_sequence_no) as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.invoice_id = i.invoice_id and d.invdisb_sequence_no = i.invdisb_sequence_no
     where d.DEPT_CODE <> i.DEPT_CODE
       and d.DEPT_CODE is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.invdisb_upd_work_id as work_id,
           getdate() as chg_datetime,
           'INVOICE_DISTRIBUTIONS', 
           i.invoice_id, 
           'INVDISB_ACCT_NO' as chg_column,
           d.INVDISB_ACCT_NO as chg_orig_value,
           i.INVDISB_ACCT_NO as chg_new_value,
           'UPDATED',
           'Column Updated',
           convert(varchar, i.invdisb_sequence_no) as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.invoice_id = i.invoice_id and d.invdisb_sequence_no = i.invdisb_sequence_no
     where upper(d.INVDISB_ACCT_NO) <> upper(i.INVDISB_ACCT_NO)
       and d.INVDISB_ACCT_NO is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.invdisb_upd_work_id as work_id,
           getdate() as chg_datetime,
           'INVOICE_DISTRIBUTIONS', 
           i.invoice_id, 
           'INVDISB_CODE_LEGACY' as chg_column,
           d.INVDISB_CODE_LEGACY as chg_orig_value,
           i.INVDISB_CODE_LEGACY as chg_new_value,
           'UPDATED',
           'Column Updated',
           convert(varchar, i.invdisb_sequence_no) as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.invoice_id = i.invoice_id and d.invdisb_sequence_no = i.invdisb_sequence_no
     where upper(d.INVDISB_CODE_LEGACY) <> upper(i.INVDISB_CODE_LEGACY)
       and d.INVDISB_CODE_LEGACY is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.invdisb_upd_work_id as work_id,
           getdate() as chg_datetime,
           'INVOICE_DISTRIBUTIONS', 
           i.invoice_id, 
           'INVDISB_CODE_TYPE' as chg_column,
           d.INVDISB_CODE_TYPE as chg_orig_value,
           i.INVDISB_CODE_TYPE as chg_new_value,
           'UPDATED',
           'Column Updated',
           convert(varchar, i.invdisb_sequence_no) as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.invoice_id = i.invoice_id and d.invdisb_sequence_no = i.invdisb_sequence_no
     where upper(d.INVDISB_CODE_TYPE) <> upper(i.INVDISB_CODE_TYPE)
       and d.INVDISB_CODE_TYPE is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.invdisb_upd_work_id as work_id,
           getdate() as chg_datetime,
           'INVOICE_DISTRIBUTIONS', 
           i.invoice_id, 
           'INVDISB_AMT' as chg_column,
           convert(varchar, d.INVDISB_AMT) as chg_orig_value,
           convert(varchar, i.INVDISB_AMT) as chg_new_value,
           'UPDATED',
           'Column Updated',
           convert(varchar, i.invdisb_sequence_no) as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.invoice_id = i.invoice_id and d.invdisb_sequence_no = i.invdisb_sequence_no
     where d.INVDISB_AMT <> i.INVDISB_AMT
       and d.INVDISB_AMT is not null




GO


