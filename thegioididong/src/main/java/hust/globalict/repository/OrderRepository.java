package hust.globalict.repository;

import hust.globalict.entity.sales.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
  @Query(
    value = "SELECT * FROM sales.view_order_history(:customer_id);",
    nativeQuery = true
  )
  public Order findOrderById(@Param("customer_id") Long customer_id);
}
