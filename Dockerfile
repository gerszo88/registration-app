FROM maven:3.8.7-openjdk-18-slim AS build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN mvn package
#
# Package stage
#
FROM tomcat:latest
COPY --from=build /usr/app/server/target/*.jar  /usr/local/tomcat/common/lib
COPY --from=build /usr/app/webapp/target/*.war /usr/local/tomcat/webapps