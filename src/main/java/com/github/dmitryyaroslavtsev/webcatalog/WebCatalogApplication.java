package com.github.dmitryyaroslavtsev.webcatalog;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@SpringBootApplication
@EntityScan(basePackageClasses = Category.class)
@EnableMongoRepositories(basePackageClasses = CategoryRepo.class)
public class WebCatalogApplication {

    public static void main(String[] args) {
        SpringApplication.run(WebCatalogApplication.class, args);
    }
}

