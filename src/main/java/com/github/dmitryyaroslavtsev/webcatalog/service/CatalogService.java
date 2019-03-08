package com.github.dmitryyaroslavtsev.webcatalog.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Product;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import com.github.dmitryyaroslavtsev.webcatalog.repos.ProductRepo;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CatalogService {


    private final CategoryRepo categoryRepo;

    private final ProductRepo productRepo;

    private ObjectMapper mapper = new ObjectMapper();

    @Autowired
    public CatalogService(CategoryRepo categoryRepo, ProductRepo productRepo) {
        this.categoryRepo = categoryRepo;
        this.productRepo = productRepo;
    }


    public Map<String, Object> getCatalog() throws JsonProcessingException {

        String subcategoriesAsJson;

        Map<String, Object> catalogMap = new HashMap<>();

        List<Category> categories = categoryRepo.findAll();
        Map<String, String> countList = new HashMap<>();

        List<String> categoryNames = new ArrayList<>();
        Map<String, List<String>> subcategories = new HashMap<>();

        Map<String, List<Product>> products = new HashMap<>();

        for (Category category : categories) {
            String categoryName = category.getCategoryName();
            categoryNames.add(categoryName);
            if (!CollectionUtils.isEmpty(category.getSubcategories())) {
                subcategories.put(categoryName, category.getSubcategories());
                for (String subcategory : category.getSubcategories()) {
                    String count = productRepo.countAllBySubcategory(subcategory).toString();
                    countList.put(subcategory, count);

                    products.put(subcategory, productRepo.findBySubcategory(subcategory));

                }
            }
        }

        subcategoriesAsJson = mapper.writeValueAsString(subcategories);
        catalogMap.put("categories", categoryNames);
        catalogMap.put("subcategories", subcategories);
        catalogMap.put("countList", countList);
        catalogMap.put("products", products);
        catalogMap.put("subcategoriesAsJson", subcategoriesAsJson);

        return catalogMap;
    }
}
