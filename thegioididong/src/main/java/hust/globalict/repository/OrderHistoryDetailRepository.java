package hust.globalict.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.OrderHistory;
import hust.globalict.entity.sales.OrderHistoryDetail;

@Repository
public interface OrderHistoryDetailRepository extends JpaRepository<OrderHistoryDetail, Long>{
	@Query(
		    value = "SELECT * FROM sales.view_detail_order_history(:customer_id,:order_id);",
		    nativeQuery = true
		  )
		  List<OrderHistoryDetail> viewDetailOrderHistory(@Param("customer_id") Long customer_id,@Param("order_id") Long order_id);
}
