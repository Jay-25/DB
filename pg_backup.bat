@echo off

set DB=Mydb
set user=postgres
set file=%DB%_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%

pg_dump -U %user% %DB% > %file%
"C:\Program Files\WinRAR\rar.exe" m %file%.rar %file%
