package com.github.dmitryyaroslavtsev.webcatalog.dto;

import lombok.Data;

import java.util.Set;

@Data
public class Attributes {

    private String size;
    private String material;
    private String density;
    private Boolean sterility;
    private Set<Colors> colors;
    private Integer packagingCount;
    private Integer transportBoxCount;
    private Integer tax;
}
