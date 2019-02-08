package repos;

import dto.Product;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Optional;

public interface ProductRepo extends MongoRepository<Product, Long> {
    @Override
    Optional<Product> findById(Long aLong);
}
