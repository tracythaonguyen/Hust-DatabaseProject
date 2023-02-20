package hust.globalict.repository;

import hust.globalict.entity.products.ProductTotal;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductTotalRepository
  extends JpaRepository<ProductTotal, Long> {
  @Query(
    value = "SELECT * FROM sales.product_total_sold();",
    nativeQuery = true
  )
  List<ProductTotal> viewAll();
}
