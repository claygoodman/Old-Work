USE [Fpars]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE TRIGGER [dbo].[TR_fpars_po_details]
ON [Fpars].[dbo].[po_details]
FOR UPDATE 
AS 
   DECLARE @lodept_code int,
           @lodept_id int,
           @lndept_code int,
           @lndept_id int,
           @lnpodtl_upd_date datetime,
           @lnpodtl_upd_work_id int,
	   @lnpartn_key int,
	   @lnnmg_company_code smallint,
           @lnpo_number varchar(20),
           @lnline_item_number smallint,
           @ltrgcmnt varchar(100)

    SELECT @lodept_code = d.dept_code,
           @lodept_id = d.dept_id,
           @lndept_code = i.dept_code,
           @lndept_id = i.dept_id,
	   @lnpartn_key = i.partn_key,
	   @lnnmg_company_code = i.nmg_company_code,
           @lnpo_number = i.po_number,
           @lnline_item_number = i.line_item_number,
           @lnpodtl_upd_date = i.podtl_upd_date,
           @lnpodtl_upd_work_id = i.podtl_upd_work_id
      FROM deleted d INNER JOIN inserted i ON d.partn_key = i.partn_key 
       and d.nmg_company_code = i.nmg_company_code
       and d.po_number = i.po_number
       and d.line_item_number = i.line_item_number

      set @ltrgcmnt = convert(varchar, @lnpartn_key) + "," +
                      convert(varchar, @lnnmg_company_code) + "," +
		      @lnpo_number + "," +
		      convert(varchar, @lnline_item_number)

      IF (UPDATE(partn_key) OR UPDATE(nmg_company_code) OR UPDATE(po_number) OR UPDATE(line_item_number))
      BEGIN
         RAISERROR ('You are not allowed to update partn_key, nmg_company_code, po_number nor line_item_number', 10, 1)
         ROLLBACK TRANSACTION
      END

      IF UPDATE(dept_id) and (@lodept_id != @lndept_id)
      BEGIN
           execute fpars.dbo.fpars_ins_chg_history @work_id = @lnpodtl_upd_work_id,
                                         @chg_table = 'PO_DETAILS',
                                         @table_id = @lnpartn_key,
                                         @chg_column = 'DEPT_ID',
                                         @chg_orig_value = @lodept_id,
                                         @chg_new_value = @lndept_id,
                                         @chg_type_code = 'UPDATED',
                                         @chg_type_desc = 'Column Updated',
                                         @chg_comment = NULL,
                                         @chg_trigger_comment = @ltrgcmnt,
                                         @rule_id = NULL
      END
      IF UPDATE(dept_code) and (@lodept_code != @lndept_code)
      BEGIN
           execute fpars.dbo.fpars_ins_chg_history @work_id = @lnpodtl_upd_work_id,
                                         @chg_table = 'PO_DETAILS',
                                         @table_id = @lnpartn_key,
                                         @chg_column = 'DEPT_CODE',
                                         @chg_orig_value = @lodept_code,
                                         @chg_new_value = @lndept_code,
                                         @chg_type_code = 'UPDATED',
                                         @chg_type_desc = 'Column Updated',
                                         @chg_comment = NULL,
                                         @chg_trigger_comment = @ltrgcmnt,
                                         @rule_id = NULL
      END









GO


