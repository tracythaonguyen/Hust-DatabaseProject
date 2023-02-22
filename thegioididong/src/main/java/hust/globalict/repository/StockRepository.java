package hust.globalict.repository;

import hust.globalict.entity.products.Stock;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {
  @Query(value = "SELECT * FROM product.view_stock();", nativeQuery = true)
  List<Stock> viewAll();

  @Query(
    value = "SELECT * FROM product.view_stock() WHERE product_id=:product_id",
    nativeQuery = true
  )
  Stock searchProductById(@Param("product_id") Long product_id);

  @Transactional
  @Modifying(clearAutomatically = true)
  @Query(
    value = "CALL product.update_stock(:product_id, :quantity);",
    nativeQuery = true
  )
  void updateProduct(
    @Param("product_id") Long product_id,
    @Param("quantity") Long quantity
  );
}
