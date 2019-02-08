package dto.products;

import dto.Category;
import dto.Colors;
import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
@Table(name = "PRODUCT")
public class Product {

    @Id
    @GeneratedValue
    private Long id;

    private String name;
    private String description;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    @ElementCollection(targetClass = Colors.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "colors", joinColumns = @JoinColumn(name = "color_id"))
    @Enumerated(EnumType.STRING)
    private Set<Colors> colors;

    private Boolean sterility;
    private Long packagingCount;
    private Long transportBoxCount;
}
