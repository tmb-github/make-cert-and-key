@echo off
rem https://creativelogic.biz/blog/https-ssl-local-dev-with-windows
rem
rem OUTPUT: myLocalhost2.key
rem

call setEnvironmentVariables

openssl genrsa -out %HOSTFILE%.key 2048

call unsetEnvironmentVariables
