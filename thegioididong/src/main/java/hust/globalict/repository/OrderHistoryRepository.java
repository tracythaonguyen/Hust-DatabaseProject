package hust.globalict.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.OrderHistory;

@Repository
public interface OrderHistoryRepository extends JpaRepository<OrderHistory, Long> {

	@Query(
		    value = "SELECT * FROM sales.view_order_history(:customer_id);",
		    nativeQuery = true
		  )
		  List<OrderHistory> viewOrderDetailById(@Param("customer_id") Long customer_id);
}
