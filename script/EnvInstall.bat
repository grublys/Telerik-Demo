@echo off
@echo+
@echo --------------------------------------------------------------------------------
@echo Part 1 Installation
@echo --------------------------------------------------------------------------------
@echo+
@echo Press Ctrl+C to exit or
pause ...


@echo ----------------------------------------------------------------
@ECHO STEP 1/4: Installing Git ...
@echo ----------------------------------------------------------------
IF NOT EXIST .\script\Git-1.7.6-preview20110708.exe wget http://msysgit.googlecode.com/files/Git-1.7.6-preview20110708.exe .\script\Git-1.7.6-preview20110708.exe
.\script\Git-1.7.6-preview20110708.exe /silent /dir=c:\utils\Git1.7.6
@echo+
@echo+


@echo ----------------------------------------------------------------
ECHO STEP 2/4: Installing Ruby ...
@echo ----------------------------------------------------------------
IF NOT EXIST .\script\rubyinstaller-1.9.2-p290.exe wget http://rubyforge.org/frs/download.php/75127/rubyinstaller-1.9.2-p290.exe .\script\rubyinstaller-1.9.2-p290.exe
.\script\rubyinstaller-1.9.2-p290.exe /silent /dir=c:\utils\Ruby1.9.2
@echo+
@echo+


@echo ----------------------------------------------------------------
ECHO STEP 3/4: Setting up .gemrc ...
@echo ----------------------------------------------------------------
echo install: --no-ri --no-rdoc >> %userprofile%/.gemrc
echo update: --no-ri --no-rdoc >> %userprofile%/.gemrc
@echo+
@echo+


@echo ----------------------------------------------------------------
ECHO STEP 4/4: Installing Gems ...
@echo ----------------------------------------------------------------
call gem install rails
call gem install rspec
call gem install rake
rem call gem install win32console
rem call gem install cucumber
rem call gem install albacore
@echo+
@echo+
