package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//клеенка
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "OILCLOTH_PRODUCT")
public class OilclothProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
