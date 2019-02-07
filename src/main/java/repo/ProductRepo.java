package repo;

import dto.products.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepo extends JpaRepository<Product, Long> {

    List<Product> findById();

    List<Product> findByNameIgnoreCase();

    List<Product> findByCategory();

    List<Product> findByDescriptionIgnoreCase();
}
