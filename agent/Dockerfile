FROM docker:stable
ENV SWARM_CLIENT_VERSION="3.9"

RUN adduser -G root -D jenkins && \
    apk --update --no-cache add gettext openjdk8-jre python py-pip git openssh ca-certificates openssl && \
    wget -O swarm-client.jar -q https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar -P /home/jenkins/
COPY jenkins-slave /usr/local/bin/jenkins-slave
RUN chmod +x /usr/local/bin/jenkins-slave
ENTRYPOINT ["jenkins-slave"]