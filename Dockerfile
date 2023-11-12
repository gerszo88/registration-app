FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
WORKDIR /var/
COPY /var/lib/jenkins/workspace/register-app-ci/webapp/target/webapp.war /usr/local/tomcat/webapps
