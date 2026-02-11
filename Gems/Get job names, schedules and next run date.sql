USE msdb
GO
SELECT NAME FROM dbo.sysjobs WHERE NAME LIKE 'jb%'
SELECT * FROM sysjobschedules

SELECT sysjobs.name, sysschedules.name, sysjobschedules.next_run_date FROM sysschedules
  INNER JOIN sysjobschedules ON sysschedules.schedule_id = sysjobschedules.schedule_id
  INNER JOIN sysjobs ON sysjobschedules.job_id = sysjobs.job_id
  WHERE sysjobs.name IN (SELECT NAME FROM dbo.sysjobs WHERE NAME LIKE 'jb%')
  ORDER BY sysjobs.name