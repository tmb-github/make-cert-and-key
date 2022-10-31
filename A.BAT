@echo off
rem Based on: https://creativelogic.biz/blog/https-ssl-local-dev-with-windows
cls
echo.
echo setEnvironmentVariables.bat is assumed to have been edited!

call setEnvironmentVariables

echo.
echo Creating CA KEY file...
echo.
openssl genrsa -des3 -passout pass:%PASSPHRASE% -out %CAFILE%.key 2048
echo.
echo Creating CA PEM file...
echo.
openssl req -passin pass:%PASSPHRASE% -x509 -new -nodes -key %CAFILE%.key -sha256 -days 3650 -config %CONFIG% -out %CAFILE%.pem
echo.
echo Next, register the %CAFILE%.PEM file with Windows and Firefox, then run b.bat.
echo Press any key to continue to instructions.
echo.
pause
cls
echo.
echo In Windows:
echo.
echo * Run Winkey-^>MMC
echo * File -^>  Add/Remove Snap-in... (Ctrl^+M)
echo * Under "Available snap-ins", click "Certificates"
echo * Click [Add] button; a modal dialog window will appear
echo * Select "Computer Account" radio button and click [Next] button
echo * Local Computer should be selected in next window; click [Finish] button
echo * Click [OK] back on "Add or Remove Snap-ins" modal window
echo * Expand "Certificates" under "Console Root" in left pane
echo * Expand "Trusted Root Certificates"
echo * Right-click "Certificates" in folder below
echo * Select "All Tasks" -^> Import...
echo * Click [Next] and then browse to select the PEM file created by this batch file routine
echo * In following prompts, place PEM certificate in Trusted Root Certification Authorities Store
echo.
pause
echo.
cls
echo In Firefox:
echo.
echo * Go to "about:preferences" in URL
echo * Search for "certificates"
echo * Click on [View Certificates]
echo * Click on "Authorities" tab
echo * Click on "Imports"
echo * Import the PEM file, checking all boxes to trust the certificate
echo * Click [OK] and you're done
echo.
echo When finished with this, run b.bat and follow its instructions at the end.
echo.

call unsetEnvironmentVariables