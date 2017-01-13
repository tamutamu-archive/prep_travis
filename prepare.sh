#/bin/bash

## For OpenJDK 1.6.0
wget -q https://github.com/tamutamu-gradle-org/prep_travis/raw/master/UTN-DATACorpSGC.crt -O /tmp/UTN-DATACorpSGC.crt
keytool -importcert -alias utndatacorpsgcca -file /tmp/UTN-DATACorpSGC.crt -keystore /etc/ssl/certs/java/cacerts -storepass changeit -trustcacerts -noprompt
