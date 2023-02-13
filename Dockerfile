FROM openjdk:8-jdk-alpine
ENV DATASOURCE_URL=0\
    DATASOURCE_USER=0\
    DATASOURCE_PASSWORD=0\
    KEY_SET_URI=0\
    ACCESS_TOKEN_URI=0\
    USER_AUTH_URI=0\
    REALM=0\
    AUTH_SERVER_URI=0\
    SECRET=0\
    ENVIRONMENT=0\
    OAUTH_USERNAME=0\
    OAUTH_PASSWORD=2
VOLUME /tmp
EXPOSE 8080
ADD /target/user-api.jar user-api.jar
ADD startup.sh /startup.sh
CMD /startup.sh
