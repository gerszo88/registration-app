FROM tomcat:latest
WORKDIR /var/lib/jenkins/workspace/register-app-ci/webapp/target
RUN ls
COPY ./webapp.war /usr/local/tomcat/webapps

#
#RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
#COPY /var/lib/jenkins/workspace/register-app-ci/webapp/target/webapp.war /usr/local/tomcat/webapps

