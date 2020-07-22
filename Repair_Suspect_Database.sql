// Link: https://support.managed.com/kb/a398/how-to-repair-a-suspect-database-in-mssql.aspx

// Issue:
// You have a database in MS SQL that is tagged as (suspect) and you are unable to connect to the database.

// Possible Causes:
// The database could have become corrupted.
// There is not enough space available for the SQL Server to recover the database during startup.
// The database cannot be opened due to inaccessible files or insufficient memory or disk space.
// The database files are being held by operating system, third party backup software etc.
// There was an unexpected SQL Server Shutdown, power failure or a hardware failure.


EXEC sp_resetstatus [YourDatabase];
ALTER DATABASE [YourDatabase] SET EMERGENCY
DBCC checkdb([YourDatabase])
ALTER DATABASE [YourDatabase] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DBCC CheckDB ([YourDatabase], REPAIR_ALLOW_DATA_LOSS)
ALTER DATABASE [YourDatabase] SET MULTI_USER
