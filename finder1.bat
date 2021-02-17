@echo off
call :finder
goto :eof

:finder
set FINDME=private static final String propertyFilePath = System.getProperty
for %%f in (*.*) do (
	>nul find "%FINDME%" %%f && (
		  echo ####################### %FINDME% was found in %%f)
	) || ( echo %FINDME% wasn't found in %%f)
)

for /D %%d in (*) do (
    cd %%d
    call :finder
    cd ..
)