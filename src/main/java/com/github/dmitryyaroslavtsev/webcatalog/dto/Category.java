package com.github.dmitryyaroslavtsev.webcatalog.dto;

import lombok.Data;
import org.springframework.data.annotation.Id;

import java.util.List;

@Data
public class Category {

    @Id
    private String id;
    private String categoryName;

    private List<String> subcategories;
}
