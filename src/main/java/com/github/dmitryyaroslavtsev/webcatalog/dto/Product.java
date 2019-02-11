package com.github.dmitryyaroslavtsev.webcatalog.dto;

import lombok.Data;
import org.springframework.data.annotation.Id;

import java.util.Set;

@Data
public class Product {

    @Id
    private String id;

    private String name;
    private String description;

    private Category category;
    private String subcategory;

    private Set<Colors> colors;

    private Boolean sterility;
    private Integer packagingCount;
    private Integer transportBoxCount;
}
