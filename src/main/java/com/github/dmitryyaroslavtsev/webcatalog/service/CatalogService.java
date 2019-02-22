package com.github.dmitryyaroslavtsev.webcatalog.service;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Product;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import com.github.dmitryyaroslavtsev.webcatalog.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CatalogService {


    @Autowired
    private CategoryRepo categoryRepo;

    @Autowired
    private ProductRepo productRepo;


    public Map<String, Object> getCatalog() {
        Map<String, Object> catalogMap = new HashMap<>();

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

        catalogMap.put("categories", categoryNames);
        catalogMap.put("subcategories", subcategories);
        catalogMap.put("countList", countList);
        catalogMap.put("products", products);

        return catalogMap;
    }
}
