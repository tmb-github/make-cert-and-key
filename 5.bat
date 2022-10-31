@echo off
rem https://creativelogic.biz/blog/https-ssl-local-dev-with-windows

call setEnvironmentVariables

echo authorityKeyIdentifier=keyid,issuer > %EXTFILE%
echo basicConstraints=CA:FALSE >> %EXTFILE%
echo keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment >> %EXTFILE%
echo subjectAltName = @alt_names >> %EXTFILE%
echo.>> %EXTFILE%
echo [alt_names] >> %EXTFILE%
echo DNS.1 = %CN% >> %EXTFILE%

openssl x509 -req -passin pass:%PASSPHRASE% -in %HOSTFILE%.csr -CA %CAFILE%.pem -CAkey %CAFILE%.key -CAcreateserial -out %HOSTFILE%.crt -days 3650 -sha256 -extfile %EXTFILE%

call unsetEnvironmentVariables