package com.github.dmitryyaroslavtsev.webcatalog.service;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Attributes;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Product;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Sterility;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import com.github.dmitryyaroslavtsev.webcatalog.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.stream.Collectors;

@Service
public class ProductService {

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    CategoryRepo categoryRepo;

    public void removeProductsByCategory(String category) {
        productRepo.deleteAllByCategoryCategoryName(category);
    }

    public void saveProduct(
            String name,
            String category,
            String subcategory,
            String description,
            String size,
            String material,
            String density,
            String colors,
            String packagingCount,
            boolean sterility) {

        Category categoryForProduct = categoryRepo.findByCategoryName(category);


        Attributes attributes = Attributes.builder()
                .size(new HashSet<String>() {{
                    this.addAll(Arrays.asList(size.split(",")));
                }})
                .material(new HashSet<String>() {{
                    this.addAll(Arrays.asList(material.split(",")));
                }})
                .density(new HashSet<String>() {{
                    this.addAll(Arrays.asList(density.split(",")));
                }})
                .colors(new HashSet<String>() {{
                    this.addAll(Arrays.asList(colors.split(",")));
                }})
                .packagingCount(new HashSet<Integer>() {{
                    this.addAll(
                            Arrays.stream(packagingCount
                                    .split(","))
                                    .map(Integer::parseInt)
                                    .collect(Collectors.toList())
                    );
                }})
                .sterility(sterility ? Sterility.Да : Sterility.Нет)
                .build();

        productRepo.save(
                Product.builder()
                        .name(name)
                        .category(categoryForProduct)
                        .subcategory(subcategory)
                        .description(description)
                        .attributes(attributes)
                        .build()
        );
    }
}
