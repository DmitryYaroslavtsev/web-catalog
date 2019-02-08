package repo;

import dto.products.BandageProduct;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BandageProductRepo extends JpaRepository<BandageProduct, Long> {
}
