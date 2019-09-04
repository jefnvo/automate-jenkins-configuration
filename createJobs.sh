#!/bin/sh
export CLIENT_NAME=trinus
export REPO_NAME=${CLIENT_NAME}_config_apis

#globais para certa empresa
export BRANCH_NAME='hml'
export LINK_REPO=https://bitbucket.org/cedrolab/${BRANCH_NAME}/src/master/

git clone https://bitbucket.org/cedrolab/${REPO_NAME}
work_dir=$(pwd)

cd ${work_dir}/${REPO_NAME}
for directory in */${BRANCH_NAME}/ ; 
do
    let "var++"
    export SCRIPT_PATH=`echo ${directory}Jenkinsfile`
    envsubst < ${work_dir}/mylocalconfig.xml > ${work_dir}/teste_mylocalconfig_${var}_file.xml
done




curl -X POST 'http://user:token@jenkins_server:8080/credentials/store/system/domain/_/createCredentials' \
--data-urlencode 'json={
  "": "0",
  "credentials": {
    "scope": "GLOBAL",
    "id": "identification",
    "username": "manu",
    "password": "bar",
    "description": "linda",
    "$class": "com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl"
  }
}'


curl -X POST 'https://jenkins.local/job/TEAM-FOLDER/credentials/store/folder/domain/_/createCredentials' \
 -F secret=@/Users/maksym/secret \
 -F 'json={"": "4", "credentials": {"file": "secret", "id": "test", 
"description": "HELLO-curl", "stapler-class": 
"org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl", 
"$class": 
"org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl"}}'

