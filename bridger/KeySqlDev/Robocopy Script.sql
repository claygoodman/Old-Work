DECLARE @cnt INT = 1, @MaxCnt INT --counters for backup loop
DECLARE @NewDT DATE = GETDATE()
DECLARE @SvDt VARCHAR(15)
DECLARE @RCopy NVARCHAR(1000)
 
USE Tempdb

IF EXISTS(SELECT * FROM sys.tables WHERE name = 'Paths')
DROP  TABLE Paths
CREATE TABLE Paths(ID INT IDENTITY(1,1),dbname NVARCHAR(100),  dbPath NVARCHAR(255),DestPath NVARCHAR(255) 
,RoboPath NVARCHAR(1000)
)


INSERT Paths(dbname,dbPath,DestPath)
VALUES
('PNET_','\\10.150.62.79\SQLBackups','E:\SQLBackup')
,('Staging_','\\10.150.62.79\SQLBackups','E:\SQLBackup')
,('TMW_Live_','\\10.150.62.79\SQLBackups','E:\SQLBackup')
,('Warehouse_','\\10.150.62.79\SQLBackups','E:\SQLBackup')
,('TMW_Live_Audit_','\\10.150.62.79\SQLBackups','E:\SQLBackup')

SELECT @SvDt=  CAST(MONTH(@NewDT)AS VARCHAR) + CAST(DAY(@NewDT) AS VARCHAR) + CAST(YEAR(@NewDT)AS VARCHAR)

UPDATE Paths SET dbname = dbname + @SvDt + '.bak'
SELECT @MaxCnt = MAX(ID) FROM Paths

--SELECT * FROM Paths

SELECT @RCopy = ' ' + dbPath + ' ' + DestPath + ' ' + dbname + ' ' FROM Paths WHERE ID = @cnt
SET @cnt = @cnt + 1

WHILE @cnt <= @MaxCnt
BEGIN
SELECT @RCopy = @RCopy + ' ' + dbname  FROM Paths WHERE ID = @cnt
SET @cnt = @cnt + 1
END
SET @RCopy = 'Robocopy ' + @RCopy

UPDATE Paths SET RoboPath = @RCopy WHERE ID = 1

SELECT RoboPath FROM Paths WHERE ID = 1

