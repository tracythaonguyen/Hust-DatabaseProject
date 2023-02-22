package hust.globalict.repository;

import hust.globalict.entity.sales.Order;
import hust.globalict.entity.sales.OrderHistory;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "CALL sales.cancel_order(:customer_id, :order_id);", nativeQuery = true)
	void cancelOrder(@Param("customer_id") Long customer_id, @Param("order_id") Long order_id);
}
