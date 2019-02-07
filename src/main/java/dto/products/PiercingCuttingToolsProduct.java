package dto.products;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

//колюще-режущие инструменты
@EqualsAndHashCode(callSuper = true)
@Entity
@Data
@Table(name = "PIERCING_CUTTING_TOOLS_PRODUCT")
public class PiercingCuttingToolsProduct extends Product {
    @Id
    @GeneratedValue
    private Long id;
}
