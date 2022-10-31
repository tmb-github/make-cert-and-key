# make-cert-and-key

* This makes all of the server certificate files necessary to run SSL HTTPS on localhost on Windows.
* It assumes OPENSSL is installed and is on the PATH
* It provides instructions for installing the correct file to Windows (for Chrome) and Firefox (!!!)
* It creates the correct Same Alternative Name (SAN) entry that Chrome requires
* It includes instructions for installing the files in a XAMPP installation
* It creates everything needed for SSL on XAMPP/Apache localhost as well as node-based localhost (e.g. Next.JS)

## FIRST

Edit the settings in setEnvironmentVariables.batch

## SECOND

Either run the batch files 1-5 individually, or just A and B.

A combines 1 & 2
B combines 3, 4, and 5

## NOTE

This routine was written with a XAMPP/Apache localhost server in mind, so there are instructions specific to editing that configuration. But the files generated may be used with any localhost server (e.g., Next.JS).
