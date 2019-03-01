package com.github.dmitryyaroslavtsev.webcatalog.repos;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepo extends MongoRepository<Category, String> {
    Category findByCategoryName(String categoryName);

    Long deleteByCategoryName(String categoryName);
}
