package dto;

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

    private Set<Colors> colors;

    private Boolean sterility;
    private Long packagingCount;
    private Long transportBoxCount;
}
