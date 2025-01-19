FROM tomcat:latest
COPY target/java-app.war /usr/local/tomcat/webapps/ROOT.war
