package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Product;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import com.github.dmitryyaroslavtsev.webcatalog.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/catalog")
public class CatalogController {

    @Autowired
    private CategoryRepo categoryRepo;
    @Autowired
    private ProductRepo productRepo;

    @GetMapping("")
    public String getCatalog(Map<String, Object> model) {

        List<Category> categories = categoryRepo.findAll();
        Map<String, String> countList = new HashMap<>();

        List<String> categoryNames = new ArrayList<>();
        Map<String, List<String>> subcategories = new HashMap<>();

        Map<String, List<Product>> products = new HashMap<>();

        for (Category category : categories) {
            String categoryName = category.getCategoryName();
            categoryNames.add(categoryName);
            subcategories.put(categoryName, category.getSubcategories());
            if (category.getSubcategories() != null) {
                for (String subcategory : category.getSubcategories()) {
                    String count = productRepo.countAllBySubcategory(subcategory).toString();
                    countList.put(subcategory, count);

                    products.put(subcategory, productRepo.findBySubcategory(subcategory));

                }
            }
        }

        model.put("categories", categoryNames);
        model.put("subcategories", subcategories);
        model.put("countList", countList);
        model.put("products", products);

        return "catalog";
    }
}
