docker build --tag fenio/gradle-awscliv2 .
docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
docker push fenio/gradle-awscliv2