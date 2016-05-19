#!/bin/bash
KEY="k5DFbc0idYlpZTcCxEDZRshSyWcpCjqB"
#source ../setup/setenv.sh
echo "############################################################################################"
echo Using org and environment configured in /setup/setenv.sh, $org and $env
echo This call requires a valid API key. You can use any API key for any app in your organization.
echo "############################################################################################"


#curl http://$org-$env.$api_domain/access-entity?"apikey="$KEY -i
curl http://raja0903-test.apigee.net/v2/programs?"apikey="$KEY
#curl http://raja0903-test.apigee.net/v2/programs
# curl -X GET -H "Content-type:application/json" \
# https://api.enterprise.apigee.com/v1/o/raja0903/environments/test/apis/programs/revisions/2/deployments \
# -u raja@osscube.com:Raja0903

