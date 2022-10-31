@echo off
REM This file sets environment variables needed in the A.BAT and B.BAT routines
REM It also writes configurations to a configuration file,
REM by default named config.cnf below (change if desired)
REM
REM A.BAT and B.BAT both call this batch file.
REM
REM Default names are provided for the first variables; edit as appropriate.
REM
REM NB: These routines that the CMD window issuing them must be run in Admin mode!
REM

REM Customize the following as desired:

set PASSPHRASE=foobar
set HOSTFILE=localhost
set CN=localhost
set IP=127.0.0.1
set COUNTRY=US
set STATE=KS
set LOCALITY=Utopia
set ORGANIZATION=Example, Inc.
set ORGANIZATIONALUNIT=Development
set EMAIL=developer@example.com

REM The following are based on the HOSTFILE definition:

set CAFILE=%HOSTFILE%CA
set CONFIG=%HOSTFILE%.cnf
set EXTFILE=%HOSTFILE%.ext

REM Write configurations to the config file:

echo [req]> %CONFIG%
echo distinguished_name = req_distinguished_name>> %CONFIG%
echo x509_extensions = v3_req>> %CONFIG%
echo prompt = no>> %CONFIG%
echo [req_distinguished_name]>> %CONFIG%
echo C = %COUNTRY%>> %CONFIG%
echo ST = %STATE%>> %CONFIG%
echo L = %LOCALITY%>> %CONFIG%
echo O = %ORGANIZATION%>> %CONFIG%
echo OU = %ORGANIZATIONALUNIT%>> %CONFIG%
echo CN = %CN%>> %CONFIG%
echo emailAddress = %EMAIL%>> %CONFIG%
echo [v3_req]>> %CONFIG%
echo basicConstraints=CA:TRUE,pathlen:0>> %CONFIG%
echo subjectKeyIdentifier = hash>> %CONFIG%
echo authorityKeyIdentifier = keyid,issuer>> %CONFIG%
echo subjectAltName = @alt_names>> %CONFIG%
echo [alt_names]>> %CONFIG%
echo DNS.1 = %CN%>> %CONFIG%
echo DNS.2 = %IP%>> %CONFIG%