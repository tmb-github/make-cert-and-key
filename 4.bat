@echo off
rem https://creativelogic.biz/blog/https-ssl-local-dev-with-windows
REM
REM Output: myLocalhost2.csr
REM

call setEnvironmentVariables

openssl req -new -key %HOSTFILE%.key -out %HOSTFILE%.csr -config %CONFIG%

call unsetEnvironmentVariables