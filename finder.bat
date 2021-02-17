@echo off
call :finder
goto :eof

:finder
set FINDME=private static final String propertyFilePath
for %%f in (*.java) do (
	>nul find "%FINDME%" %%f && (
		  echo %FINDME% was found in %%f)
	)
)

for /D %%d in (*) do (
    cd %%d
    call :finder
    cd ..
)



