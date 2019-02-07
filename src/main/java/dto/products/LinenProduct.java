package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//комплекты белья
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "LINEN_PRODUCT")
public class LinenProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
