FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY . /app
RUN javac hello.java
CMD ["java","hello"]
