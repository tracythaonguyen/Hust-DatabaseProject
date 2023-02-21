package hust.globalict.repository;

import hust.globalict.entity.products.Stock;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {
  @Query(value = "SELECT * FROM product.view_stock();", nativeQuery = true)
  List<Stock> viewAll();
}
