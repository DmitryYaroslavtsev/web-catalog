package com.github.dmitryyaroslavtsev.webcatalog.repos;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Product;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepo extends MongoRepository<Product, String> {
    @Override
    Optional<Product> findById(String id);

    Optional<Product> findByCategory(String category);

    Integer countAllByCategory(String category);

    Integer countAllBySubcategory(String subcategory);

    List<Product> findBySubcategory(String subcategory);
}
