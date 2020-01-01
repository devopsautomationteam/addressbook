FROM tomcat:8
MAINTAINER devopsautomationteam
ADD target/addressbook-2.0.war /usr/local/tomcat/webapps/target/addressbook-2.0.war
EXPOSE 8080
ENTRYPOINT ["catalina.sh","run"]
