package hust.globalict.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Brand;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Long>{
	@Query(value = "SELECT * FROM product.brands",nativeQuery = true)
	List<Brand> listAll();
}
