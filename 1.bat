@echo off
rem https://creativelogic.biz/blog/https-ssl-local-dev-with-windows
rem Step 1: Make a Certificate Authority key:
rem You'll need to enter a pass phrase twice:
rem
rem OUTPUT: myCA2.key
rem

call setEnvironmentVariables

openssl genrsa -des3 -passout pass:%PASSPHRASE% -out %CAFILE%.key 2048

call unsetEnvironmentVariables