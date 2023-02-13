package hust.globalict.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Product;
import hust.globalict.entity.products.ProductDetail;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
	
	@Query(value="CALL product.update_list_price(:id, :price)",nativeQuery=true)
	void updateListPrice(@Param("id") Integer id,@Param("price") Integer price);
	
	@Query(value = "CALL product.delete_product(:id);",nativeQuery = true)
	void deleteProductById(@Param("id") Integer id);
	
}
