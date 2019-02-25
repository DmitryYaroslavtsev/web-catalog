package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

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
            @Valid Category category) {

        if (StringUtils.isEmpty(category.getCategoryName())) {

        }

        categoryRepo.save(category);

        return "admin";
    }
}
