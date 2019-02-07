package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//полотенца
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "TOWELS_PRODUCT")
public class TowelsProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
