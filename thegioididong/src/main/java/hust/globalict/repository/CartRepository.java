package hust.globalict.repository;

import hust.globalict.entity.products.ProductDetail;
import hust.globalict.entity.sales.Cart;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
  @Query(value = "SELECT * FROM product.view_all_product ;", nativeQuery = true)
  List<ProductDetail> viewAllProduct();
}
