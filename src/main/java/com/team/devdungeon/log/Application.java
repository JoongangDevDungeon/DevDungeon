package com.team.devdungeon.log;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.team.devdungeon.log")
@EntityScan(basePackages = "com.team.devdungeon.log")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
