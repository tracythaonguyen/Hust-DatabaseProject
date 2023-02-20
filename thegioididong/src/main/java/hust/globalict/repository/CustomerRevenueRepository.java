package hust.globalict.repository;

import hust.globalict.entity.sales.CustomerRevenue;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRevenueRepository
  extends JpaRepository<CustomerRevenue, Long> {
  @Query(value = "SELECT * FROM sales.customer_revenue();", nativeQuery = true)
  List<CustomerRevenue> viewAll();
}
