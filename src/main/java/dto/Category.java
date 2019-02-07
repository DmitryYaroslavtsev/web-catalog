package dto;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Data
public class Category {
    @Id
    @GeneratedValue
    private Integer id;
    private String categoryName;
}
