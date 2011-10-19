@echo off
@echo+
@echo --------------------------------------------------------------------------------
@echo Part 1 Installation
@echo --------------------------------------------------------------------------------
@echo+
@echo Press Ctrl+C to exit or
pause ...


@echo ----------------------------------------------------------------
@ECHO STEP 1/4: Updating User Path ...
@echo ----------------------------------------------------------------
path=%path%;%CD%\utils\bin;%CD%\utils\Git1.7.6\bin;%CD%\utils\Ruby1.9.2\bin
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 2/4: Installing Ruby and Rails ...
@echo ----------------------------------------------------------------
IF NOT EXIST rubyinstaller-1.9.2-p290.exe wget http://rubyforge.org/frs/download.php/75346/railsinstaller-2.0.0.exe railsinstaller-2.0.0.exe
railsinstaller-2.0.0.exe /silent
@echo+
@echo+

@echo ----------------------------------------------------------------
@ECHO STEP 3/4: Setting up .gemrc ...
@echo ----------------------------------------------------------------
echo install: --no-ri --no-rdoc >> %userprofile%/.gemrc
echo update: --no-ri --no-rdoc >> %userprofile%/.gemrc
@echo+
@echo+


@echo ----------------------------------------------------------------
@ECHO STEP 4/4: Installing Bundled Gems ...
@echo ----------------------------------------------------------------
call bundle install
@echo+
@echo+
