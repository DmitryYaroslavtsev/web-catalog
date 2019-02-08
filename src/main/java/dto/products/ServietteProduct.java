package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

//салфетки
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "SERVIETTE_PRODUCT")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class ServietteProduct extends Product {
}
