package com.github.dmitryyaroslavtsev.webcatalog.dto;

import lombok.Data;

import java.util.List;
import java.util.Set;

@Data
public class Attributes {

    private List<String> size;
    private List<String> material;
    private List<String> density;
    private Sterility sterility;
    private Set<Colors> colors;
    private List<Integer> packagingCount;
}
