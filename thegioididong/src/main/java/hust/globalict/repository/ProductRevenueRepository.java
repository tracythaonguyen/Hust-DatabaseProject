package hust.globalict.repository;

import hust.globalict.entity.products.ProductRevenue;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRevenueRepository
  extends JpaRepository<ProductRevenue, Long> {
  @Query(value = "SELECT * FROM sales.product_revenue();", nativeQuery = true)
  List<ProductRevenue> viewAll();
}
