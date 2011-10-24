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
path=%path%;%CD%\utils\bin;C:\RailsInstaller\Git\bin;C:\RailsInstaller\Ruby1.9.2\bin
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 2/5: Installing Ruby and Rails ...
@echo ----------------------------------------------------------------
IF NOT EXIST railsinstaller-2.0.0.exe wget http://rubyforge.org/frs/download.php/75346/railsinstaller-2.0.0.exe 
railsinstaller-2.0.0.exe /silent
@echo+
@echo+

@echo ----------------------------------------------------------------
@ECHO STEP 3/5: Setting up .gemrc ...
@echo ----------------------------------------------------------------
echo install: --no-ri --no-rdoc >> %userprofile%/.gemrc
echo update: --no-ri --no-rdoc >> %userprofile%/.gemrc
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 4/5: Installing Bundled Gems ...
@echo ----------------------------------------------------------------
call bundle install
@echo+
@echo+

@echo ----------------------------------------------------------------
@ECHO STEP 4/5: Installing IISExpress ...
@echo ----------------------------------------------------------------
iisexpress.exe
@echo+
@echo+
