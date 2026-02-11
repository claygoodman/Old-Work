	--TRUNCATE TABLE Warehouse.dbo.JobAudit
	INSERT Warehouse.dbo.JobAudit(ServerName,JobName,JobResult,RunDate,RunTime,DateCreated,DateModified)
	SELECT H.server,
	S.name
	,CASE  LEFT(H.message,14)  WHEN 'The job failed' THEN 'Failure' ELSE 'Success' END AS JobResult
	,CAST(RTRIM(H.run_date) AS DATE) AS RunDate,
	CAST((CONVERT(DATETIME, RTRIM(H.run_date)) + (H.run_time * 9 + H.run_time % 10000 * 6 + H.run_time % 100 * 10) / 216e4) AS TIME(0)) AS RunTime
	,S.date_created,S.date_modified
	FROM msdb.dbo.sysjobhistory H INNER JOIN msdb.dbo.sysjobs S ON H.job_id = S.job_id
	LEFT JOIN Warehouse.dbo.JobAudit A ON A.RunDate = CAST(RTRIM(H.run_date) AS DATE)
	WHERE H.step_id = 0 AND A.RunDate IS NULL


	--USE Warehouse
	--GO
	--CREATE TABLE JobAudit(ServerName VARCHAR(50),JobName VARCHAR(500),JobResult VARCHAR(20),RunDate DATE, RunTime TIME(0)
	--,DateCreated DATETIME,DateModified DATETIME)
	
	--SELECT * FROM  msdb.dbo.sysjobhistory H INNER JOIN msdb.dbo.sysjobs S ON H.job_id = S.job_id
	
	--WHERE name = 'Rebuild TMW_Live Indexes'