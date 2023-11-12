FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
sh "ls"
COPY /var/lib/jenkins/workspace/register-app-ci/webapp/*.war /usr/local/tomcat/webapps
