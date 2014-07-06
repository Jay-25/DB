@echo off

set DB=Mydb
set user=postgres

psql -U %user% -f %DB%_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2% %DB%
