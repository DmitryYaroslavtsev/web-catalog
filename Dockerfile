FROM openjdk:8-jre-alpine
RUN mkdir /app
RUN mkdir /app/conf
COPY target/web-catalog-0.0.1-SNAPSHOT.jar /app/app.jar
CMD ["/usr/bin/java", "-jar", "/app/app.jar", "--spring.config.location=file:conf/"]