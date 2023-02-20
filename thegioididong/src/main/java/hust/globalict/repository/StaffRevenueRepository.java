package hust.globalict.repository;

import hust.globalict.entity.sales.StaffRevenue;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface StaffRevenueRepository
  extends JpaRepository<StaffRevenue, Long> {
  @Query(value = "SELECT * FROM sales.staff_revenue();", nativeQuery = true)
  List<StaffRevenue> viewAll();
}
