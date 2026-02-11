SQLcmd -U fpars_batch -P fpars_batch -S MP093SQLDT01\TEST2K -dFpars -i "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\RenameViewsToSaved.sql" -o "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\RenameViewsOutput.txt"
PAUSE

SQLcmd -U fpars_batch -P fpars_batch -S MP093SQLDT01\TEST2K -dFpars -i "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\CreateNewTables.sql" -o "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\CreateNewTablesOutput.txt"
PAUSE

SQLcmd -U fpars_batch -P fpars_batch -S MP093SQLDT01\TEST2K -dFpars -i "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\InsertDataToNewTables.sql" -o "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\InsertDataOutput.txt"
PAUSE

SQLcmd -U fpars_batch -P fpars_batch -S MP093SQLDT01\TEST2K -dFpars -i "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\CreateIndexOnNewTables.sql" -o "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\CreateIndexOutput.txt" 
PAUSE

SQLcmd -U fpars_batch -P fpars_batch -S MP093SQLDT01\TEST2K -dFpars -i "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\CreateTriggerNewTables.sql" -o "C:\Documents and Settings\Hong Rong\My Documents\MillerAssociates\NM\Fpars\HongModified\Scripts\CreateTriggerOtput.txt"
PAUSE
