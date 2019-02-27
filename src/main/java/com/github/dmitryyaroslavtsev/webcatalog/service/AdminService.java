package com.github.dmitryyaroslavtsev.webcatalog.service;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;

@Service
public class AdminService {
    @Autowired
    CategoryRepo categoryRepo;

    public void createCategory(String categoryName, String subcategoriesNames) {
        Category category = new Category();
        category.setCategoryName(categoryName);
        if (!StringUtils.isEmpty(subcategoriesNames)) {
            category.setSubcategories(Arrays.asList(subcategoriesNames.split(" ")));
        }
        categoryRepo.save(category);
    }

    public boolean categoryExists(String categoryName) {
        return categoryRepo.findByCategoryName(categoryName).isPresent();
    }

    public boolean removeCategory(String categoryName) {
        Long t = categoryRepo.deleteByCategoryName(categoryName);
        return t.equals(1L);
    }
}
