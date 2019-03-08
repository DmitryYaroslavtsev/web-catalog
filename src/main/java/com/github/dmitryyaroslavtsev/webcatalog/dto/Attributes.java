package com.github.dmitryyaroslavtsev.webcatalog.dto;

import lombok.Builder;
import lombok.Data;

import java.util.Set;

@Data
@Builder
public class Attributes {

    private Set<String> size;
    private Set<String> material;
    private Set<String> density;
    private Sterility sterility;
    private Set<String> colors;
    private Set<Integer> packagingCount;
}
