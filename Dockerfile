FROM openjdk:17-jdk-slim

MAINTAINER Rafał Laskowski <rafal.laskowski@outlook.com>

# Install curl and unzip
RUN apt-get update && \
    apt-get install -y curl unzip

# Install Gradle
ARG GRADLE_VERSION=7.2
ARG GRADLE_HOME=/opt/gradle
RUN curl -fsSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip && \
    unzip gradle.zip -d /opt && \
    rm gradle.zip && \
    ln -s /opt/gradle-${GRADLE_VERSION} ${GRADLE_HOME} && \
    ln -s ${GRADLE_HOME}/bin/gradle /usr/local/bin/gradle

ENV GRADLE_HOME=${GRADLE_HOME}
ENV GRADLE_OPTS="-Xmx1024m"
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# Install AWS CLI v2
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Install JQ
RUN apt-get update \
    && apt-get install -y jq \
    && apt-get clean
