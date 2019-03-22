package com.github.dmitryyaroslavtsev.webcatalog.service;

import com.github.dmitryyaroslavtsev.webcatalog.dto.Attributes;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Category;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Product;
import com.github.dmitryyaroslavtsev.webcatalog.dto.Sterility;
import com.github.dmitryyaroslavtsev.webcatalog.repos.CategoryRepo;
import com.github.dmitryyaroslavtsev.webcatalog.repos.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.HashSet;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final ProductRepo productRepo;

    private final CategoryRepo categoryRepo;

    @Autowired
    public ProductService(ProductRepo productRepo, CategoryRepo categoryRepo) {
        this.productRepo = productRepo;
        this.categoryRepo = categoryRepo;
    }

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


        Attributes attributes = createAttributes(
                size,
                material,
                density,
                colors,
                packagingCount,
                sterility
        );

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

    public Product findById(String id) {
        if (productRepo.findById(id).isPresent()) {
            return productRepo.findById(id).get();
        } else {
            return null;
        }
    }

    public void updateProduct(
            Product product,
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

        product.setName(name);
        product.setDescription(description);
        product.setCategory(categoryForProduct);
        product.setSubcategory(subcategory);

        product.setAttributes(
                createAttributes(
                        size,
                        material,
                        density,
                        colors,
                        packagingCount,
                        sterility
                )
        );
        productRepo.save(product);
    }

    private Attributes createAttributes(
            String size,
            String material,
            String density,
            String colors,
            String packagingCount,
            boolean sterility) {
        return Attributes.builder()
                .size(
                        StringUtils.isEmpty(size) ? null :
                                new HashSet<String>() {{
                                    this.addAll(Arrays.asList(size.split(",")));
                                }})
                .material(
                        StringUtils.isEmpty(material) ? null :
                                new HashSet<String>() {{
                                    this.addAll(Arrays.asList(material.split(",")));
                                }})
                .density(
                        StringUtils.isEmpty(density) ? null :
                                new HashSet<String>() {{
                                    this.addAll(Arrays.asList(density.split(",")));
                                }})
                .colors(
                        StringUtils.isEmpty(colors) ? null :
                                new HashSet<String>() {{
                                    this.addAll(Arrays.asList(colors.split(",")));
                                }})
                .packagingCount(
                        StringUtils.isEmpty(packagingCount) ? null :
                                new HashSet<Integer>() {{
                                    this.addAll(
                                            Arrays.stream(packagingCount
                                                    .split(","))
                                                    .map(Integer::parseInt)
                                                    .collect(Collectors.toList())
                                    );
                                }})
                .sterility(sterility ? Sterility.Да : Sterility.Нет)
                .build();
    }
}
