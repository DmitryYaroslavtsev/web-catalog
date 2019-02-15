package com.github.dmitryyaroslavtsev.webcatalog.dto;

import lombok.Data;
import org.springframework.data.annotation.Id;

import java.util.Set;

@Data
public class Attributes {

    @Id
    private String id;
    private String size;
    private String material;
    private String density;
    private Boolean sterility;
    private Set<Colors> colors;
    private Integer packagingCount;
    private Integer transportBoxCount;
    private Integer tax;
}
