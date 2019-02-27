package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.github.dmitryyaroslavtsev.webcatalog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

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
        if (!adminService.categoryExists(categoryName)) {
            adminService.createCategory(categoryName, subcategoriesNames);
        } else {
            model.put("error", "Category already exists");
        }
        return "admin";
    }
}
