package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//пеленки
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "NAPKINS_PRODUCT")
public class NapkinsProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
