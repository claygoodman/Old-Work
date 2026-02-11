
DECLARE @wrkDate varchar(20)
DECLARE @dy varchar(2)
DECLARE @yr varchar(4)
DECLARE @mo varchar(2)
DECLARE @hr varchar(2)
DECLARE @mn varchar(2)
DECLARE @day varchar(20)
DECLARE @tm varchar(20)
DECLARE @db varchar(100)
DECLARE @bustr nvarchar(2000)


SET @wrkDate = GETDATE()
SET @mo = MONTH(@wrkDate)
SET @dy = DAY(@wrkDate)
SET @yr = YEAR(@wrkDate)
SET @hr = DATEPART(hh,@wrkDate)
SET @mn = DATEPART(mi,@wrkDate)

IF LEN(@mo) = 1 SET @mo = '0'+ @mo
IF LEN(@dy) = 1 SET @dy = '0' + @dy
IF LEN(@hr) = 1 SET @hr = '0' + @hr
IF LEN(@mn) = 1 SET @mn = '0'+@mn

SET @wrkDate = @yr+@mn+@dy + '_'+@hr+@mn+'00'

SET @day = 
CASE DATEPART(dw,Getdate())
	WHEN 1 THEN 'Sun'
	WHEN 2 THEN 'Mon'
	WHEN 3 THEN 'Tue'
	WHEN 4 THEN 'Wed'
	WHEN 5 THEN 'Thu'
	WHEN 6 THEN 'Fri'
	WHEN 7 THEN 'Sat'
END

SET @db = 'Cohesion_L_' + @day +'_' + @wrkDate + '.bu'

SET @bustr = 'BACKUP LOG [Cohesion] TO DISK = ' 	+ char(39)+ 'Z:\SQLBackup\' + @db + CHAR(39)

SELECT @bustr