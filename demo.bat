@echo off
@echo+
@echo ----------------------------------------------------------------
@ECHO Updating User Path ...
@echo ----------------------------------------------------------------
@echo+
IF NOT EXIST c:\utils mkdir c:\utils
path=%path%;c:\utils\bin;c:\utils\Git1.7.6\bin;c:\utils\Ruby1.9.2\bin
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO Starting Rails Demo ...
@echo ----------------------------------------------------------------
rake demo
@echo+
@echo+