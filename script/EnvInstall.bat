@echo off
@echo+
@echo --------------------------------------------------------------------------------
@echo Part 1 Installation
@echo --------------------------------------------------------------------------------
@echo+
@echo Press Ctrl+C to exit or
pause ...


@echo ----------------------------------------------------------------
ECHO STEP 1/6: Updating User Path ...
@echo ----------------------------------------------------------------
IF NOT EXIST c:\utils mkdir c:\utils
path=%path%;c:\utils\bin;c:\utils\Git1.7.6\bin;c:\utils\Ruby1.9.2\bin
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 2/6: Installing Git ...
@echo ----------------------------------------------------------------
IF NOT EXIST Git-1.7.6-preview20110708.exe wget http://msysgit.googlecode.com/files/Git-1.7.6-preview20110708.exe
Git-1.7.6-preview20110708.exe /silent /dir=c:\utils\Git1.7.6
@echo+
@echo+


@echo ----------------------------------------------------------------
ECHO STEP 3/6: Installing Ruby ...
@echo ----------------------------------------------------------------
IF NOT EXIST rubyinstaller-1.9.2-p290.exe wget http://rubyforge.org/frs/download.php/75127/rubyinstaller-1.9.2-p290.exe
rubyinstaller-1.9.2-p290.exe /silent /dir=c:\utils\Ruby1.9.2
@echo+
@echo+


@echo ----------------------------------------------------------------
ECHO STEP 4/6: Setting up .gemrc ...
@echo ----------------------------------------------------------------
echo install: --no-ri --no-rdoc >> %userprofile%/.gemrc
echo update: --no-ri --no-rdoc >> %userprofile%/.gemrc
@echo+
@echo+


@echo ----------------------------------------------------------------
ECHO STEP 5/6: Installing Gems ...
@echo ----------------------------------------------------------------
call gem install rails
call gem install rspec
call gem install rake
rem call gem install win32console
rem call gem install cucumber
rem call gem install albacore
@echo+
@echo+


@echo ----------------------------------------------------------------
ECHO STEP 6/6: Installing Pik ...
@echo ----------------------------------------------------------------
call gem install pik
call pik_install c:\utils\bin
@echo+
@echo+
