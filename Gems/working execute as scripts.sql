
----Create a login with view server state permissions
--CREATE LOGIN ViewServerStateLogin
--WITH password = 'Hello123';
--CREATE user ViewServerStateLogin;

--CREATE the user to receive server state permission
CREATE LOGIN vssl WITH PASSWORD = '-09234uksfmaskflmasdothaoih'
CREATE USER vssl

--Create a login to test the permissions assignment
--CREATE LOGIN TestViewServerState
--WITH password = 'Hello123';
--CREATE user TestViewServerState;


--Grant view server state permission to the ViewServerStateLogin
--GRANT VIEW SERVER state TO ViewServerStateLogin;
--grant server state to vssl
USE master
GO

GRANT VIEW SERVER STATE TO vssl


--Create a procedure to wrap the call to the system view
CREATE PROCEDURE p_VSS
WITH ENCRYPTION 
AS
    SET NOCOUNT ON;

    EXECUTE AS LOGIN='vssl'

        select transaction_id from sys.dm_tran_current_transaction

    revert;

RETURN(0);

--add user aerodyn as public to master
USE master
GO

--add the user aerodyn to the public role of master db
--CREATE USER AbolrousHazem FOR LOGIN AbolrousHazem
CREATE USER aerodyn FOR LOGIN aerodyn
--GRANT THE RIGHT TO USE THE vssl login  to aerodyn
GRANT EXECUTE ON p_VSS TO aerodyn
GO


--Assign execute permission to the test accounts
--GRANT EXECUTE ON proc_TestViewServerState TO TestViewServerState

--Grant impersonation rights to the test login
GRANT IMPERSONATE ON LOGIN::vssl TO aerodyn

--Test with Procedure
USE DSI
GO

EXECUTE AS LOGIN = 'aerodyn';
    EXEC master..p_VSS
revert;
