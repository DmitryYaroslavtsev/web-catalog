package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//простыни
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "BEDSHEET_PRODUCT")
public class BedsheetProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
