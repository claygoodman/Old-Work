exec sp_executesql N'
            create table #tempbackup (database_name nvarchar(128), [type] char(1), backup_finish_date datetime)
            insert into #tempbackup select database_name, [type], max(backup_finish_date) from msdb..backupset where [type] = ''D'' or [type] = ''L'' or [type]=''I'' group by database_name, [type]
          


                create table #tmp_sp_db_vardecimal_storage_format (dbname sysname null, vardecimal_enabled varchar(3) null)
                if exists (select o.object_id from sys.system_objects o where o.name=N''sp_db_vardecimal_storage_format'')
                begin
                insert into #tmp_sp_db_vardecimal_storage_format exec sys.sp_db_vardecimal_storage_format
                end
            


        DECLARE @is_policy_automation_enabled bit
        SET @is_policy_automation_enabled  = (SELECT CONVERT(bit, current_value)
        FROM msdb.dbo.syspolicy_configuration
        WHERE name = ''Enabled'')
      


        create table #tmp_db_hadr_dbrs (group_database_id uniqueidentifier, synchronization_state tinyint, is_local bit)
      


        declare @HasViewPermission int
        select @HasViewPermission = HAS_PERMS_BY_NAME(null, null, ''VIEW SERVER STATE'')
      


        if (@HasViewPermission = 1)
        begin
        insert into #tmp_db_hadr_dbrs select group_database_id, synchronization_state, is_local from master.sys.dm_hadr_database_replica_states
        end
      


        create table #tmp_db_encryption_keys (database_id int)
      


        if (@HasViewPermission = 1)
        begin
        insert into #tmp_db_encryption_keys select database_id from master.sys.dm_database_encryption_keys
        end
      


SELECT
dtb.name AS [Name],
--(select count(*) from master.dbo.sysprocesses p where dtb.database_id=p.dbid) AS [ActiveConnections],
dtb.is_auto_close_on AS [AutoClose],
dtb.is_auto_shrink_on AS [AutoShrink],
dtb.compatibility_level AS [CompatibilityLevel],
--dtb.create_date AS [CreateDate],
CAST(0 AS float) AS [DataSpaceUsage],
--CAST(0 AS bit) AS [DboLogin],
--N'''' AS [DefaultFileGroup],
--'''' AS [DefaultSchema],
--dtb.database_id AS [ID],
--CAST(0 AS float) AS [IndexSpaceUsage],
--CAST(has_dbaccess(dtb.name) AS bit) AS [IsAccessible],
--CAST(0 AS bit) AS [IsDbAccessAdmin],
--CAST(0 AS bit) AS [IsDbBackupOperator],
--CAST(0 AS bit) AS [IsDbDatareader],
--CAST(0 AS bit) AS [IsDbDatawriter],
--CAST(0 AS bit) AS [IsDbDdlAdmin],
--CAST(0 AS bit) AS [IsDbDenyDatareader],
--CAST(0 AS bit) AS [IsDbDenyDatawriter],
--CAST(0 AS bit) AS [IsDbOwner],
--CAST(0 AS bit) AS [IsDbSecurityAdmin],
dtb.is_fulltext_enabled AS [IsFullTextEnabled],
--CAST(case when dtb.name in (''master'',''model'',''msdb'',''tempdb'') then 1 else dtb.is_distributor end AS bit) AS [IsSystemObject],
suser_sname(dtb.owner_sid) AS [Owner],
--ISNULL(df.physical_name, N'''') AS [PrimaryFilePath],
(dtb.is_published*1+dtb.is_subscribed*2+dtb.is_merge_published*4) AS [ReplicationOptions],
CAST(0 AS float) AS [Size],
CAST(0 AS float) AS [SpaceAvailable],
          case
          when dtb.collation_name is null then 0x200
          else 0
          end |
          case
          when 1 = dtb.is_in_standby then 0x40
          else 0
          end |
          case dtb.state
          when 1 then 0x2
          when 2 then 0x8
          when 3 then 0x4
          when 4 then 0x10
          when 5 then 0x100
          when 6 then 0x20
          else 1
          end
         AS [Status],
--'''' AS [UserName],
dtb.is_ansi_null_default_on AS [AnsiNullDefault],
dtb.is_ansi_nulls_on AS [AnsiNullsEnabled],
dtb.is_ansi_padding_on AS [AnsiPaddingEnabled],
--dtb.is_ansi_warnings_on AS [AnsiWarningsEnabled],
dtb.is_arithabort_on AS [ArithmeticAbortEnabled],
dtb.is_auto_create_stats_on AS [AutoCreateStatisticsEnabled],
dtb.is_auto_update_stats_on AS [AutoUpdateStatisticsEnabled],
CAST(CHARINDEX(N''_CS_'', dtb.collation_name) AS bit) AS [CaseSensitive],
dtb.is_cursor_close_on_commit_on AS [CloseCursorsOnCommitEnabled],
dtb.collation_name AS [Collation],
dtb.is_concat_null_yields_null_on AS [ConcatenateNullYieldsNull],
dtb.is_db_chaining_on AS [DatabaseOwnershipChaining],
CAST(( case LOWER(convert( nvarchar(128), DATABASEPROPERTYEX(dtb.name, ''Updateability''))) when ''read_write'' then 1 else 0 end) AS bit) AS [IsUpdateable],
--(select backup_finish_date from #tempbackup where type = @_msparam_0 and db_id(database_name) = dtb.database_id) AS [LastBackupDate],
--(select backup_finish_date from #tempbackup where type = @_msparam_1 and db_id(database_name) = dtb.database_id) AS [LastDifferentialBackupDate],
--(select backup_finish_date from #tempbackup where type = @_msparam_2 and db_id(database_name) = dtb.database_id) AS [LastLogBackupDate],
dtb.is_local_cursor_default AS [LocalCursorsDefault],
dtb.is_numeric_roundabort_on AS [NumericRoundAbortEnabled],
dtb.page_verify_option AS [PageVerify],
dtb.is_quoted_identifier_on AS [QuotedIdentifiersEnabled],
dtb.is_read_only AS [ReadOnly],
dtb.recovery_model AS [RecoveryModel],
dtb.is_recursive_triggers_on AS [RecursiveTriggersEnabled],
dtb.user_access AS [UserAccess],
CAST(DATABASEPROPERTYEX(dtb.name, ''Version'') AS int) AS [Version],
dtb.is_auto_update_stats_async_on AS [AutoUpdateStatisticsAsync],
dtb.is_broker_enabled AS [BrokerEnabled],
drs.database_guid AS [DatabaseGuid],
--ISNULL(DB_NAME(dtb.source_database_id), N'''') AS [DatabaseSnapshotBaseName],
--dtb.is_date_correlation_on AS [DateCorrelationOptimization],
ISNULL((select top 1 ftc.name from sys.fulltext_catalogs as ftc where ftc.is_default=1),N'''') AS [DefaultFullTextCatalog],
--CAST((case when drs.last_log_backup_lsn is not null then 1 else 0 end) AS bit) AS [HasFullBackup],
--CAST(isnull(dtb.source_database_id, 0) AS bit) AS [IsDatabaseSnapshot],
--CAST((select count(1) from sys.databases dtbmir where dtbmir.source_database_id = dtb.database_id) AS bit) AS [IsDatabaseSnapshotBase],
--0 AS [IsMailHost],
CAST(case when dmi.mirroring_partner_name is null then 0 else 1 end AS bit) AS [IsMirroringEnabled],
dtb.is_parameterization_forced AS [IsParameterizationForced],
dtb.is_read_committed_snapshot_on AS [IsReadCommittedSnapshotOn],
                case
                when vardec.vardecimal_enabled = ''ON'' then cast(1 as bit)
                else cast(0 as bit)
                end
             AS [IsVarDecimalStorageFormatEnabled],
--ISNULL(dtb.log_reuse_wait,0) AS [LogReuseWaitStatus],
--ISNULL(dmi.mirroring_failover_lsn,0) AS [MirroringFailoverLogSequenceNumber],
--ISNULL(dmi.mirroring_guid,''00000000-0000-0000-0000-0000000000000000'') AS [MirroringID],
--ISNULL(dmi.mirroring_partner_name,'''') AS [MirroringPartner],
--ISNULL(dmi.mirroring_partner_instance,'''') AS [MirroringPartnerInstance],
--ISNULL((case dmi.mirroring_redo_queue_type when N''UNLIMITED'' then 0 else dmi.mirroring_redo_queue end),0) AS [MirroringRedoQueueMaxSize],
--ISNULL(dmi.mirroring_role,0) AS [MirroringRole],
--ISNULL(dmi.mirroring_role_sequence,0) AS [MirroringRoleSequence],
--ISNULL(dmi.mirroring_safety_level + 1, 0) AS [MirroringSafetyLevel],
--ISNULL(dmi.mirroring_safety_sequence,0) AS [MirroringSafetySequence],
--ISNULL(dmi.mirroring_state + 1, 0) AS [MirroringStatus],
--ISNULL(dmi.mirroring_connection_timeout,0) AS [MirroringTimeout],
--ISNULL(dmi.mirroring_witness_name,'''') AS [MirroringWitness],
--ISNULL(dmi.mirroring_witness_state + 1, 0) AS [MirroringWitnessStatus],
--drs.recovery_fork_guid AS [RecoveryForkGuid],
dtb.service_broker_guid AS [ServiceBrokerGuid],
dtb.snapshot_isolation_state AS [SnapshotIsolationState],
dtb.is_trustworthy_on AS [Trustworthy],
--CAST(ISNULL(ctb.is_auto_cleanup_on,0) AS bit) AS [ChangeTrackingAutoCleanUp],
CAST(case when ctb.database_id is null then 0 else 1  end AS bit) AS [ChangeTrackingEnabled],
--ISNULL(ctb.retention_period,0) AS [ChangeTrackingRetentionPeriod],
--CAST(ISNULL(ctb.retention_period_units,0) AS tinyint) AS [ChangeTrackingRetentionPeriodUnits],
N'''' AS [DefaultFileStreamFileGroup],
CAST(dtb.is_encrypted AS bit) AS [EncryptionEnabled],
CAST(dtb.is_honor_broker_priority_on AS bit) AS [HonorBrokerPriority],
--CAST(0 AS bit) AS [IsManagementDataWarehouse],
case when 1=@is_policy_automation_enabled and exists (select * from msdb.dbo.syspolicy_system_health_state where target_query_expression_with_id like ''Server''+ ''/Database\[@ID='' + convert(nvarchar(20),dtb.database_id) + ''\]%'' ESCAPE ''\'') then 1 else 0 end AS [PolicyHealthState],
dbrs.synchronization_state AS [AvailabilityDatabaseSynchronizationState],
--dtb.containment AS [ContainmentType],
dtb.default_fulltext_language_lcid AS [DefaultFullTextLanguageLcid],
ISNULL(dtb.default_fulltext_language_name,N'''') AS [DefaultFullTextLanguageName],
dtb.default_language_lcid AS [DefaultLanguageLcid],
dtb.default_language_name AS [DefaultLanguageName],
ISNULL(fsopt.directory_name , N'''') AS [FilestreamDirectoryName],
ISNULL(fsopt.non_transacted_access , 0) AS [FilestreamNonTransactedAccess],
CAST(ISNULL(dek.database_id, 0) AS bit) AS [HasDatabaseEncryptionKey],
CAST(dtb.is_nested_triggers_on AS bit) AS [NestedTriggersEnabled],
dtb.target_recovery_time_in_seconds AS [TargetRecoveryTime],
CAST(dtb.is_transform_noise_words_on AS bit) AS [TransformNoiseWords],
dtb.two_digit_year_cutoff AS [TwoDigitYearCutoff],
dtb.name AS [DatabaseName],
dtb.name AS [DatabaseName2],
dtb.containment AS [ContainmentType2]
FROM
master.sys.databases AS dtb
LEFT OUTER JOIN sys.master_files AS df ON df.database_id = dtb.database_id and 1=df.data_space_id and 1 = df.file_id
LEFT OUTER JOIN sys.database_recovery_status AS drs ON drs.database_id = dtb.database_id
LEFT OUTER JOIN sys.database_mirroring AS dmi ON dmi.database_id = dtb.database_id
LEFT OUTER JOIN #tmp_sp_db_vardecimal_storage_format as vardec ON dtb.database_id = db_id(vardec.dbname)
LEFT OUTER JOIN sys.change_tracking_databases AS ctb ON ctb.database_id = dtb.database_id 
LEFT OUTER JOIN #tmp_db_hadr_dbrs AS dbrs ON dtb.group_database_id = dbrs.group_database_id and dbrs.is_local = 1
LEFT OUTER JOIN sys.database_filestream_options AS fsopt ON fsopt.database_id = dtb.database_id
LEFT OUTER JOIN #tmp_db_encryption_keys AS dek ON dek.database_id = dtb.database_id 
WHERE
(dtb.name=@_msparam_3)

            drop table #tempbackup
          


            drop table #tmp_sp_db_vardecimal_storage_format
          

        
        drop table #tmp_db_hadr_dbrs
      


        drop table #tmp_db_encryption_keys
      
',N'@_msparam_0 nvarchar(4000),@_msparam_1 nvarchar(4000),@_msparam_2 nvarchar(4000),@_msparam_3 nvarchar(4000)',@_msparam_0=N'D',@_msparam_1=N'I',@_msparam_2=N'L',@_msparam_3=N'Test'