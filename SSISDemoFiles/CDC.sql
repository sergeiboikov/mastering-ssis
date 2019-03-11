--ENSURE SQLSERVER AGENT SERVICE IS RUNNING 

EXEC sys.sp_cdc_enable_db
--exec sys.sp_cdc_disable_db

SELECT is_CDC_enabled from MASTER.SYS.Databases
Where name = 'Demo'


SELECT is_tracked_by_cdc from sys.tables
Where name = 'Employees_Source'

EXEC sys.sp_cdc_enable_table
@source_schema = dbo,
@source_name = N'Employees_Source',
@role_name = NULL,
@supports_net_changes = 1,
@capture_instance = N'Employees_Source'

SELECT is_tracked_by_cdc from sys.tables
Where name = 'Employees_Source'