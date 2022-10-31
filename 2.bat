@echo off
rem https://creativelogic.biz/blog/https-ssl-local-dev-with-windows
rem Make Certificate Authority PEM (Privacy Enhanced Mail) file
rem
rem EDIT REQ.CNF FIRST
rem -config req.cnf
REM
rem OUTPUT: myCA2.key
rem

call setEnvironmentVariables

openssl req -passin pass:%PASSPHRASE% -x509 -new -nodes -key %CAFILE%.key -sha256 -days 3650 -config %CONFIG% -out %CAFILE%.pem

echo.
echo Next, perform step "S1-PART 3" in:
echo https://creativelogic.biz/https-ssl-local-dev-windows/
echo You'll be adding the .pem to Windows and then to Firefox directly
echo.

call unsetEnvironmentVariables
