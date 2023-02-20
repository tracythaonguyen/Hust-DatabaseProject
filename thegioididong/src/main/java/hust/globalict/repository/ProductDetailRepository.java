package hust.globalict.repository;

import hust.globalict.entity.products.ProductDetail;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductDetailRepository
  extends JpaRepository<ProductDetail, Long> {
  @Query(
    value = "SELECT * FROM product.view_all_product();",
    nativeQuery = true
  )
  List<ProductDetail> viewAllProduct();

  @Query(
    value = "SELECT * FROM product.view_active_product();",
    nativeQuery = true
  )
  List<ProductDetail> viewActiveProduct();

  @Query(
    value = "SELECT * FROM product.view_product_limit(:num);",
    nativeQuery = true
  )
  List<ProductDetail> viewProductsLimit(@Param("num") Integer num);

  @Query(
    value = "SELECT * FROM product.search_product_by_name(:name);",
    nativeQuery = true
  )
  List<ProductDetail> searchProductByName(@Param("name") String name);

  @Query(
    value = "SELECT * FROM product.search_product_by_brand(:brand)",
    nativeQuery = true
  )
  List<ProductDetail> searchProductByBrand(@Param("brand") String brand);

  @Query(
    value = "SELECT * FROM product.search_product_by_category(:category)",
    nativeQuery = true
  )
  List<ProductDetail> searchProductByCategory(
    @Param("category") String category
  );
}
