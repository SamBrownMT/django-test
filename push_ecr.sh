#!/bin/bash
set -e
pack build mysite --builder 'heroku/builder:24' -t 'mysite/api' --platform 'linux/amd64'
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 261219435789.dkr.ecr.eu-west-2.amazonaws.com
docker tag mysite/api:latest 261219435789.dkr.ecr.eu-west-2.amazonaws.com/mysite/api:latest
docker push 261219435789.dkr.ecr.eu-west-2.amazonaws.com/mysite/api:latest