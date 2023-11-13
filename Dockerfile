FROM tomcat:latest
COPY /var/lib/jenkins/workspace/register-app-ci/webapp/target/webapp.war /usr/local/tomcat/webapps
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
