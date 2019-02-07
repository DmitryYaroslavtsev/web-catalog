package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//одежда
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "CLOTHES_PRODUCT")
public class ClothesProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
