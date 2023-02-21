package hust.globalict.repository;

import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.ProductDetail;

@Repository
public interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {
	@Query(value = "SELECT * FROM product.view_all_product();", nativeQuery = true)
	List<ProductDetail> viewAllProduct();

	@Query(value = "SELECT * FROM product.view_active_product();", nativeQuery = true)
	List<ProductDetail> viewActiveProduct();

	@Query(value = "SELECT * FROM product.view_top_product(:num);", nativeQuery = true)
	List<ProductDetail> viewProductsLimit(@Param("num") Integer num);

	@Query(value = "SELECT * FROM product.search_product_by_name(:name);", nativeQuery = true)
	List<ProductDetail> searchProductByName(@Param("name") String name);

	@Query(value = "SELECT * FROM product.search_product_by_brand(:brand)", nativeQuery = true)
	List<ProductDetail> searchProductByBrand(@Param("brand") String brand);

	@Query(value = "SELECT * FROM product.view_all_product() WHERE product_id=:product_id", nativeQuery = true)
	ProductDetail searchProductById(@Param("product_id") Long product_id);
	
	@Query(value = "SELECT * FROM product.search_product_by_category(:category)", nativeQuery = true)
	List<ProductDetail> searchProductByCategory(@Param("category") String category);

	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "CALL product.add_product(:product_name, :brand_name, :category_name, :model_year, :list_price);", nativeQuery = true)
	void addProduct(@Param("product_name") String product_name, @Param("brand_name") String brand_name,
			@Param("category_name") String category_name, @Param("model_year") String model_year,
			@Param("list_price") BigDecimal list_price);

	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "CALL product.update_product(:product_id,:product_name, :brand_name, :category_name, :model_year, :list_price);", nativeQuery = true)
	void updateProduct(@Param("product_id") Long product_id,@Param("product_name") String product_name, @Param("brand_name") String brand_name,
			@Param("category_name") String category_name, @Param("model_year") String model_year,
			@Param("list_price") BigDecimal list_price);

}
