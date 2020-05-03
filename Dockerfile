FROM tomcat:9.0.34-jdk8-openjdk-slim

WORKDIR /usr/local/tomcat

# ROOT war should be present under webapps but looks like in new versions this is not the case
# Check this  by running, 
#    $ docker run -d -p 8080:8080 tomcat:9.0.34-jdk8-openjdk-slim
#    $ docker exec -it <con-id> bash
#    $ ls webapps/ and ls webapps.dist // Look in both the dirs
# If war ROOT is under webapps then no issues, localhost:8080 will work else you need to do the below steps.
# Usually we need to deploy our war file(like Springboot war) in to webapps folder
# As this is just a test to learn about running Tomcat we will use default ROOT war file
# You can run below commands by going into the above container 
RUN mv ./webapps ./webapps2
RUN mv ./webapps.dist ./webapps

# This does nothing. This is to say that appl is running on 8080
# So expose the same when you are running the application
EXPOSE 8080

CMD ["catalina.sh", "run"]
