package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//резиновые изделия
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "RUBBER_PRODUCT")
public class RubberProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
