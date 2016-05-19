#!/bin/bash

source setenv.sh

echo This script deploys all BeachBody API proxies under ./beachbodyproxy to your organization on the Apigee API Platform.

echo Be sure to populate values in setenv.sh in this directory before running this script.

echo Using $username in $org.

echo "Enter your password for the Apigee Enterprise organization $org, followed by [ENTER]:"

read -s password

echo Verifying credentials...

# echo "https://api.enterprise.apigee.com/v1/organizations/$org -u $username:$password"

response=`curl -s -o /dev/null -I -w "%{http_code}" https://v2.api.enterprise.apigee.com/v1/organizations/$org -u $username:$password`

# echo $response;
# exit

if [ $response -eq 401 ]
then
  echo "Authentication failed!"
  echo "Please re-run the script using the right username/password."
  exit
elif [ $response -eq 403 ]
then
  echo Organization $org is invalid!
  echo Please re-run the script using the right org.
  exit
else
  echo "Verfied! Proceeding with deployment."
fi;

echo Deploying all BeachBody API to $env using $username and $org

#echo Creating caches

#curl -X POST -H "Content-type:text/xml" -d @../beachbodyproxy/outbound-oauth/oauth-token-cache.xml https://api.enterprise.apigee.com/v1/o/$org/environments/$env/caches -u $username:$password

#curl -X POST -H "Content-type:text/xml" -d @../beachbodyproxy/pagination/paginationCache.xml https://api.enterprise.apigee.com/v1/o/$org/environments/$env/caches -u $username:$password

# cd ../programs/

# for proxydir in *; do
#     if [ -d "${proxydir}" ]; then
#         ../tools/deploy.py -n $proxydir -u $username:$password -o $org -e $env -p / -d $proxydir -h $url
#     fi
# done

# cd ../trainers/

# for proxydir in *; do
#     if [ -d "${proxydir}" ]; then
#         ../tools/deploy.py -n $proxydir -u $username:$password -o $org -e $env -p / -d $proxydir -h $url
#     fi
# done

../tools/deploy.py -n programs -u $username:$password -o $org -h $url -e $env -p / -d ../programs -h $url
../tools/deploy.py -n trainers -u $username:$password -o $org -h $url -e $env -p / -d ../trainers -h $url


#cd ../setup/

echo "Deployment complete. BeachBody API proxies are deployed to the $env environment in the organization $org"

echo "Login to enterprise.apigee.com to view and interact with the BeachBody API proxies"

# echo "To invoke the BeachBody API, run invoke.sh found in each directory in this distribution."

#./provisioning_for_oauth.sh apikey,oauth-authcode,oauth-client-credentials,oauth-verify-accesstoken,oauth-login-app
