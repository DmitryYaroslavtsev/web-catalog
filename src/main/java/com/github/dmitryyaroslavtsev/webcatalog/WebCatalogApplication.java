package com.github.dmitryyaroslavtsev.webcatalog;

import dto.Category;
import dto.products.BandageProduct;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import repo.BandageProductRepo;
import repo.CategoryRepo;

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
    public CommandLineRunner loadBandageProduct(BandageProductRepo repo) {
        return (args -> {
            BandageProduct product = new BandageProduct();
            product.setName("TestProduct");
            product.setCategory(category);
            repo.save(product);
        });
    }

}

