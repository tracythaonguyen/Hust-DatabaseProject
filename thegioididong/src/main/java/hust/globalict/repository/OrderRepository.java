package hust.globalict.repository;

import hust.globalict.entity.sales.Order;
import hust.globalict.entity.sales.OrderHistory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
  
}
