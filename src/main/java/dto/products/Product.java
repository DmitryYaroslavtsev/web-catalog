package dto.products;

import dto.Category;
import dto.Colors;
import lombok.Data;

import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

@Data
@MappedSuperclass
public abstract class Product {

    public Product() {
    }

    @Id
    @GeneratedValue
    private Long id;

    private String name;
    private String description;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "color_id")
    private Colors colors;
    private Boolean sterility;
    private Long packagingCount;
    private Long transportBoxCount;
}
