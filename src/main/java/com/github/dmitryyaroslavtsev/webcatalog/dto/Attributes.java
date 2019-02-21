package com.github.dmitryyaroslavtsev.webcatalog.dto;

import lombok.Data;

import java.util.Set;

@Data
public class Attributes {

    private Set<String> size;
    private Set<String> material;
    private Set<String> density;
    private Sterility sterility;
    private Set<String> colors;
    private Set<Integer> packagingCount;
}
