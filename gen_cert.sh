#!/bin/bash
openssl genrsa -des3 -out /tmp/server.key 2048
openssl req -new -key /tmp/server.key -out /tmp/server.csr
cp /tmp/server.key /tmp/server.key.org
openssl rsa -in /tmp/server.key.org -out /tmp/server.key 
openssl x509 -req -days 365 -in /tmp/server.csr -signkey /tmp/server.key -out /tmp/server.crt
printf "Self Signed SSL Cert generated at /tmp/server.crt\n\n"
sleep 2
