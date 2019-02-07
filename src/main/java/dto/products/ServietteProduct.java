package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//салфетки
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "SERVIETTE_PRODUCT")
public class ServietteProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
