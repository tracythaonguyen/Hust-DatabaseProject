package hust.globalict.repository;

import hust.globalict.entity.sales.CartDetail;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
  @Query(
    value = "SELECT * FROM sales.view_cart(:customer_id) ;",
    nativeQuery = true
  )
  List<CartDetail> viewAllProduct(@Param("customer_id") Integer customer_id);
  // @Query(value = "SELECT * FROM product.view_product_limit(:num);",nativeQuery = true)
  // List<ProductDetail> viewProductsLimit(@Param("num") Integer num);
}
