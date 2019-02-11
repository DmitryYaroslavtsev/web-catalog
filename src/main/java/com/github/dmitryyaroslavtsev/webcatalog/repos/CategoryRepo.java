package com.github.dmitryyaroslavtsev.webcatalog.repos;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CategoryRepo extends MongoRepository<Category, String> {
    Optional<Category> findByCategoryName(String categoryName);
}
