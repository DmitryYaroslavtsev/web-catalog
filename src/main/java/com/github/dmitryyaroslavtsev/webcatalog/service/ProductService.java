package com.github.dmitryyaroslavtsev.webcatalog.service;

import com.github.dmitryyaroslavtsev.webcatalog.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    @Autowired
    private ProductRepo productRepo;

    public void removeProductsByCategory(String category) {
        productRepo.deleteAllByCategoryCategoryName(category);
    }
}
