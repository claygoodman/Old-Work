USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[TR_fpars_consldatr_mstr]
ON [Fpars].[dbo].[consldatr_mstr]
AFTER UPDATE 
AS 
    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.consldatr_upd_work_id as work_id,
           getdate() as chg_datetime,
           'CONSLDATR_MSTR', 
           i.consldatr_id, 
           'FPARS_COMPANY_CODE' as chg_column,
           convert(varchar, d.FPARS_COMPANY_CODE) as chg_orig_value,
           convert(varchar, i.FPARS_COMPANY_CODE) as chg_new_value,
           'UPDATED',
           'Column Updated',
           NULL as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.consldatr_id = i.consldatr_id
     where d.FPARS_COMPANY_CODE <> i.FPARS_COMPANY_CODE
       and d.FPARS_COMPANY_CODE is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.consldatr_upd_work_id as work_id,
           getdate() as chg_datetime,
           'CONSLDATR_MSTR', 
           i.consldatr_id, 
           'NMG_LOCATION_CODE' as chg_column,
           convert(varchar, d.NMG_LOCATION_CODE) as chg_orig_value,
           convert(varchar, i.NMG_LOCATION_CODE) as chg_new_value,
           'UPDATED',
           'Column Updated',
           NULL as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.consldatr_id = i.consldatr_id
     where d.NMG_LOCATION_CODE <> i.NMG_LOCATION_CODE
       and d.NMG_LOCATION_CODE is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.consldatr_upd_work_id as work_id,
           getdate() as chg_datetime,
           'CONSLDATR_MSTR', 
           i.consldatr_id, 
           'WORKFLOW_STEP' as chg_column,
           d.WORKFLOW_STEP as chg_orig_value,
           i.WORKFLOW_STEP as chg_new_value,
           'UPDATED',
           'Column Updated',
           NULL as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.consldatr_id = i.consldatr_id
     where upper(d.WORKFLOW_STEP) <> upper(i.WORKFLOW_STEP)
       and d.WORKFLOW_STEP is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.consldatr_upd_work_id as work_id,
           getdate() as chg_datetime,
           'CONSLDATR_MSTR', 
           i.consldatr_id, 
           'WORKFLOW_STATUS' as chg_column,
           d.WORKFLOW_STATUS as chg_orig_value,
           i.WORKFLOW_STATUS as chg_new_value,
           'UPDATED',
           'Column Updated',
           NULL as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.consldatr_id = i.consldatr_id
     where upper(d.WORKFLOW_STATUS) <> upper(i.WORKFLOW_STATUS)
       and d.WORKFLOW_STATUS is not null

    insert into fpars.dbo.change_history
          (partn_key, work_id, chg_datetime, chg_table, table_id, 
           chg_column, chg_orig_value, chg_new_value, chg_type_code, chg_type_desc, 
           chg_comment, chg_trigger_comment, rule_id)
    select convert(integer, substring(convert(varchar, getdate(), 112),1,6)) as partn_key,
           i.consldatr_upd_work_id as work_id,
           getdate() as chg_datetime,
           'CONSLDATR_MSTR', 
           i.consldatr_id, 
           'DEPT_CODE' as chg_column,
           convert(varchar, d.DEPT_CODE) as chg_orig_value,
           convert(varchar, i.DEPT_CODE) as chg_new_value,
           'UPDATED',
           'Column Updated',
           NULL as chg_comment, 
           NULL as chg_trigger_comment, 
           -1 as rule_id
      from deleted d INNER JOIN inserted i ON d.consldatr_id = i.consldatr_id
     where d.DEPT_CODE <> i.DEPT_CODE
       and d.DEPT_CODE is not null






GO


