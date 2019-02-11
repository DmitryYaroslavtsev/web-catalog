package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/catalog")
public class CatalogController {

    @Autowired
    private CategoryRepo categoryRepo;

    @GetMapping("")
    public String getCatalog(Map<String, Object> model) {

        List<Category> category = categoryRepo.findByCategoryName("Одежда");
        String clothes = category.get(0).getCategoryName();
        model.put("result", clothes);


        return "catalog";
    }
}
