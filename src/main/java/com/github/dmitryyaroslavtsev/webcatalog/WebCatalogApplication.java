package com.github.dmitryyaroslavtsev.webcatalog;

import dto.Category;
import dto.Colors;
import dto.products.Product;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import repos.CategoryRepo;
import repos.ProductRepo;

import java.util.HashSet;
import java.util.Set;

@SpringBootApplication
@EntityScan(basePackageClasses = Category.class)
@EnableJpaRepositories(basePackageClasses = CategoryRepo.class)
public class WebCatalogApplication {

    public static void main(String[] args) {
        SpringApplication.run(WebCatalogApplication.class, args);
    }

    private Category category = new Category();

    @Bean
    public CommandLineRunner loadCategory(CategoryRepo categoryRepo) {
        category.setCategoryName("test1");
        return (args ->
                categoryRepo.save(category));
    }

    @Bean
    public CommandLineRunner loadBandageProduct(ProductRepo repo) {
        return (args -> {
            Product product = new Product();
            Set<Colors> colors = new HashSet<>();
            colors.add(Colors.WHITE);
            colors.add(Colors.GREEN);
            product.setName("TestProduct");
            product.setCategory(category);
            product.setColors(colors);
            repo.save(product);
        });
    }
}

