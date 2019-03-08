package com.github.dmitryyaroslavtsev.webcatalog.service;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class AdminService {

    private final CategoryRepo categoryRepo;

    @Autowired
    public AdminService(CategoryRepo categoryRepo) {
        this.categoryRepo = categoryRepo;
    }

    public void createCategory(String categoryName, String subcategoriesNames) {
        Category category = new Category();
        category.setCategoryName(categoryName);
        if (!StringUtils.isEmpty(subcategoriesNames)) {
            category.setSubcategories(Arrays.asList(subcategoriesNames.split(",")));
        } else {
            category.setSubcategories(Collections.emptyList());
        }
        categoryRepo.save(category);
    }

    public boolean categoryExists(String categoryName) {
        return categoryRepo.findByCategoryName(categoryName) != null;
    }

    public boolean removeCategory(String categoryName) {
        return categoryRepo.deleteByCategoryName(categoryName).equals(1L);
    }

    public boolean updateCategory(String categoryOldName, String categoryNewName, String subcategoriesNames) {

        Category categoryForUpdate = categoryRepo.findByCategoryName(categoryOldName);

        if (categoryForUpdate == null) {
            return false;
        }

        if (!categoryNewName.equals(categoryOldName)) {
            categoryForUpdate.setCategoryName(categoryNewName);
        }

        List<String> newSubcategories;
        if (!StringUtils.isEmpty(subcategoriesNames)) {

            List<String> oldSubcategories = categoryForUpdate.getSubcategories();

            newSubcategories = Arrays.asList(subcategoriesNames.split(","));

            if (!CollectionUtils.isEqualCollection(oldSubcategories, newSubcategories)) {
                categoryForUpdate.setSubcategories(newSubcategories);
            }
        } else {
            categoryForUpdate.setSubcategories(Collections.emptyList());
        }
        categoryRepo.save(categoryForUpdate);
        return true;
    }
}
