#!/bin/bash
# set hostname in lower case
export HOSTNAME=${HOSTNAME,,}
echo "hostname is: $HOSTNAME"
helmfile apply
echo "access keycloak: http://$HOSTNAME/cityos-auth/ and add user in citydashboard realm"
echo "dev user: admin/yourpassword"
echo "access cityos: http://$HOSTNAME/landing/"