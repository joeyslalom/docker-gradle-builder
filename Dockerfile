FROM ubuntu

# install java + gradle
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk gradle && \
    rm -rf /var/lib/apt/lists/*

# add build + validate scripts
COPY bash/build-gradle.sh /usr/local/bin/build
COPY bash/build-gradlew.sh /usr/local/bin/buildw
COPY bash/validate-gradle.sh /usr/local/bin/validate
COPY bash/validate-gradlew.sh /usr/local/bin/validatew
RUN chmod +x /usr/local/bin/*

# run an empty build to load this image with all the dependency jars so they won't need to be re-downloaded
COPY empty-project/ /root/empty-project
RUN cd /root/empty-project && ./gradlew build