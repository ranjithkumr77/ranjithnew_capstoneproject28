#!/bin/bash
 DEV_REPO = 'ranjith7777/dev'
 PROD_REPO = 'ranjith7777/prod'
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    sh "docker tag ranjith ${DEV_REPO}:latest"
    sh " docker login -u ranjith7777 --password dckr_pat_IBO-I29lL9Bt-Q5OxmdoXxIwwk0"
    sh "docker push ${DEV_REPO}:latest"
elif [[ $GIT_BRANCH == "origin/master" ]]; then
    # Build your project
    sh'chmod +x build.sh'
    sh'./build.sh' 
    sh "docker tag ranjith ${PROD_REPO}:latest"
    sh " docker login -u ranjith7777 --password dckr_pat_IBO-I29lL9Bt-Q5OxmdoXxIwwk0"
    sh "docker push ${PROD_REPO}:latest"
fi
docker-compose up -d
