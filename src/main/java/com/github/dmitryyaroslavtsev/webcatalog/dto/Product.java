package com.github.dmitryyaroslavtsev.webcatalog.dto;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class Product {

    @Id
    private String id;

    private String name;
    private String description;

    private Category category;
    private String subcategory;

    private Attributes attributes;
}
