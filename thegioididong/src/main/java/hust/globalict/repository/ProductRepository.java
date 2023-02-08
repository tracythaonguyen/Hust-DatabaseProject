package hust.globalict.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
	@Query(value = "SELECT * FROM product.view_all_product ;",nativeQuery = true)
	List<ProductDetail> viewAllProduct();
	
	@Query(value = "CALL product.view_product_limit(:num);",nativeQuery = true)
	List<Product> viewProductsLimit(@Param("num") Integer num);
	
	@Query(value="CALL product.search_product_by_name(:name)",nativeQuery=true)
	List<Product> searchProductByName(@Param("name") String name);
	
	@Query(value="CALL product.search_product_by_brand(:brand)",nativeQuery=true)
	List<Product> searchProductByBrand(@Param("brand") String brand);
	
	@Query(value="CALL product.search_product_by_category(:category)",nativeQuery=true)
	List<Product> searchProductByCategory(@Param("category") String category);
	
	@Query(value="CALL product.update_list_price(:id, :price)",nativeQuery=true)
	void updateListPrice(@Param("id") Integer id,@Param("price") Integer price);
	
	@Query(value = "CALL product.delete_product(:id);",nativeQuery = true)
	void deleteProductById(@Param("id") Integer id);
	
	
	
		
	
	
	
}
