<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>{{ index . "projectName"}}</artifactId>
        <groupId>com.example</groupId>
        <version>0.0.1-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>{{ index . "serviceName"}}-client</artifactId>

    <properties>
        <maven.compiler.source>8</maven.compiler.source>
        <maven.compiler.target>8</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>{{ index . "javaPackage" }}</groupId>
            <artifactId>{{ index . "module" }}-{{ index . "package" }}</artifactId>
            <version>v0.0.1</version>
        </dependency>
        <dependency>
            <groupId>{{ index . "javaPackage" }}</groupId>
            <artifactId>{{ index . "module" }}-{{ index . "package" }}</artifactId>
            <version>v0.0.1</version>
            <scope>compile</scope>
        </dependency>
    </dependencies>

</project>