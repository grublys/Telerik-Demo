@echo off
@echo+
@echo --------------------------------------------------------------------------------
@echo Part 1 Installation
@echo --------------------------------------------------------------------------------
@echo+
@echo Press Ctrl+C to exit or
pause ...


@echo ----------------------------------------------------------------
@ECHO STEP 1/5: Updating User Path ...
@echo ----------------------------------------------------------------
path=%path%;%CD%\utils\bin;%CD%\utils\Git1.7.6\bin;%CD%\utils\Ruby1.9.2\bin
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 2/5: Installing Git ...
@echo ----------------------------------------------------------------
IF NOT EXIST Git-1.7.6-preview20110708.exe wget http://msysgit.googlecode.com/files/Git-1.7.6-preview20110708.exe Git-1.7.6-preview20110708.exe
Git-1.7.6-preview20110708.exe /silent /dir=%CD%\utils\Git1.7.6
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 3/5: Installing Ruby ...
@echo ----------------------------------------------------------------
IF NOT EXIST rubyinstaller-1.9.2-p290.exe wget http://rubyforge.org/frs/download.php/75127/rubyinstaller-1.9.2-p290.exe rubyinstaller-1.9.2-p290.exe
rubyinstaller-1.9.2-p290.exe /silent /dir=%CD%\utils\Ruby1.9.2
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 4/5: Setting up .gemrc ...
@echo ----------------------------------------------------------------
echo install: --no-ri --no-rdoc >> %userprofile%/.gemrc
echo update: --no-ri --no-rdoc >> %userprofile%/.gemrc
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 5/5: Installing Gems ...
@echo ----------------------------------------------------------------
call gem install rails
call gem install rspec
call gem install rake
cd ..
bundle install
@echo+
@echo+
