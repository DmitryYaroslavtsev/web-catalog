package com.github.dmitryyaroslavtsev.webcatalog.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.dmitryyaroslavtsev.webcatalog.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/catalog")
public class CatalogController {

    @Autowired
    private CatalogService catalogService;


    @GetMapping("")
    public String getCatalog(Map<String, Object> model) throws JsonProcessingException {

        model.putAll(catalogService.getCatalog());
        return "catalog";
    }
}
