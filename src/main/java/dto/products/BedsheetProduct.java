package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

//простыни
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "BEDSHEET_PRODUCT")
@Inheritance(strategy= InheritanceType.SINGLE_TABLE)
public class BedsheetProduct extends Product {
}
