package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//перчатки
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "GLOVES_PRODUCT")
public class GlovesProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
