package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
		
	@Query(value = "CALL product.delete_product(:product_id);",nativeQuery = true)
	void deleteProductById(@Param("product_id") Long product_id);
	
	@Query(value = "CALL product.discontinue_product(:product_id);",nativeQuery = true)
	void discontinueProductById(@Param("product_id") Long product_id);

}
