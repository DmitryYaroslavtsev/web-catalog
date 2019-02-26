package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CategoryRepo categoryRepo;

    @GetMapping("")
    public String getAdmin() {
        return "admin";
    }

    @PostMapping("")
    public String addCategory(
            @RequestParam String categoryName,
            @RequestParam String subcategoriesNames,
            Map<String, Object> model
    ) {

        if (!categoryRepo.findByCategoryName(categoryName).isPresent()) {


            Category category = new Category();

            category.setCategoryName(categoryName);
            if (!StringUtils.isEmpty(subcategoriesNames)) {
                category.setSubcategories(Arrays.asList(subcategoriesNames.split(" ")));
            }
            categoryRepo.save(category);
        } else {
            model.put("error", "Test");
        }
        return "admin";
    }
}
