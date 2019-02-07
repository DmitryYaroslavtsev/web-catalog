package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//перевязка
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "DRESSINGS_PRODUCT")
public class DressingsProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
