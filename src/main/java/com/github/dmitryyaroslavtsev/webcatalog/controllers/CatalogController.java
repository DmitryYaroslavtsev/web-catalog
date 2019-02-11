package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/catalog")
public class CatalogController {

    @Autowired
    private CategoryRepo categoryRepo;

    @GetMapping("")
    public String getCatalog(Map<String, Object> model) {

        List<Category> categories = categoryRepo.findAll();

        List<String> categoryNames = new ArrayList<>();
        Map<String, List<String>> subcategories = new HashMap<>();

        for (Category category : categories) {
            String categoryName = category.getCategoryName();
            categoryNames.add(categoryName);
            subcategories.put(categoryName, category.getSubcategories());
        }






        model.put("categories", categoryNames);
        model.put("subcategories", subcategories);


        return "catalog";
    }
}
