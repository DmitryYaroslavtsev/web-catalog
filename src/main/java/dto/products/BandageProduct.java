package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

//повязки
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "BANDAGE_PRODUCT")
@Inheritance(strategy= InheritanceType.SINGLE_TABLE)
public class BandageProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;

    public BandageProduct() {
    }
}
