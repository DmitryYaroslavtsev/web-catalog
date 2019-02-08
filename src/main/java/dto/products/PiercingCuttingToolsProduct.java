package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

//колюще-режущие инструменты
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "PIERCING_CUTTING_TOOLS_PRODUCT")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class PiercingCuttingToolsProduct extends Product {
}
