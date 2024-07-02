#!/bin/bash
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "$GIT_BRANCH"
if [[ $GIT_BRANCH == "dev" ]]; then
    # Build your project
    sh 'chmod +x build.sh'
    sh './build.sh'
     docker tag ranjith ranjith7777/dev:latest
     docker login -u ranjith7777 --password dckr_pat_IBO-I29lL9Bt-Q5OxmdoXxIwwk0
     docker push ranjith7777/dev:latest
elif [[ $GIT_BRANCH == "master" ]]; then
    # Build your project
    sh'chmod +x build.sh'
    sh'./build.sh' 
    docker tag ranjith ranjith7777/prod:latest
    docker login -u ranjith7777 --password dckr_pat_IBO-I29lL9Bt-Q5OxmdoXxIwwk0
    docker push ranjith7777/prod:latest
fi
docker-compose up -d
