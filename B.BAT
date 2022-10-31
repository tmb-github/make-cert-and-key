@echo off
rem Based on: https://creativelogic.biz/blog/https-ssl-local-dev-with-windows
cls
echo.
echo setEnvironmentVariables.bat is assumed to have been edited!

call setEnvironmentVariables

echo.
echo Creating localhost KEY file
openssl genrsa -out %HOSTFILE%.key 2048
echo.

echo.
echo Creating localhost CSR file
openssl req -new -key %HOSTFILE%.key -out %HOSTFILE%.csr -config %CONFIG%
echo.

echo.
echo Writing EXTFILE for last routine...
echo.
echo authorityKeyIdentifier=keyid,issuer> %EXTFILE%
echo basicConstraints=CA:FALSE>> %EXTFILE%
echo keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment>> %EXTFILE%
echo subjectAltName = @alt_names>> %EXTFILE%
echo.>> %EXTFILE%
echo [alt_names]>> %EXTFILE%
echo DNS.1 = %CN%>> %EXTFILE%
echo DNS.2 = %IP%>> %EXTFILE%

echo.
echo Writing localhost CRT file
echo.
openssl x509 -req -passin pass:%PASSPHRASE% -in %HOSTFILE%.csr -CA %CAFILE%.pem -CAkey %CAFILE%.key -CAcreateserial -out %HOSTFILE%.crt -days 3650 -sha256 -extfile %EXTFILE%
echo.

echo.
echo Next, edit Windows HOST and HTTPD-VHOSTS.CONF and copy files to Xampp/Apache.
echo Press any key to continue to instructions.
echo.
pause
cls
echo.
echo * Edit C:\Windows\System32\drivers\etc\hosts to include the localhost name specified in the PEM
echo * Edit C:\xampp\apache\conf\extra\httpd-vhosts.conf to include the localhost name specified in the PEM
echo * Copy the .KEY file created by this routine to C:\xampp\apache\conf\ssl.key
echo * Copy the .CRT file created by this routine to C:\xampp\apache\conf\ssl.crt
echo * Restart Xampp/Apache and you're done.

call unsetEnvironmentVariables
