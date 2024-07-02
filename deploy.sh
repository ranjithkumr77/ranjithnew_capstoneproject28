#!/bin/bash
if [[ $GIT_BRANCH == "origin/dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
    sh "docker tag ranjith ranjith7777/dev:latest"
    sh " docker login -u ranjith7777 --password dckr_pat_IBO-I29lL9Bt-Q5OxmdoXxIwwk0"
    sh "docker push ranjith7777/dev:latest"
elif [[ $GIT_BRANCH == "origin/master" ]]; then
    # Build your project
    sh'chmod +x build.sh'
    sh'./build.sh' 
    sh "docker tag ranjith ${PROD_REPO}:latest"
    sh " docker login -u ranjith7777 --password dckr_pat_IBO-I29lL9Bt-Q5OxmdoXxIwwk0"
    sh "docker push ${PROD_REPO}:latest"
fi
docker-compose up -d
