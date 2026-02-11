DECLARE @str varchar(50)

SET @str='20080818 00:27:00'
IF ISDATE(@str) = 1
SELECT CAST(@str AS datetime2)
ELSE
PRINT 'no'