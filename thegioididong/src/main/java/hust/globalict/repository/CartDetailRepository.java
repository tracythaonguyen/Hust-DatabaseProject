package hust.globalict.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.CartDetail;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long>{
	@Query(value = "SELECT * FROM sales.view_cart(:customer_id)",nativeQuery = true)
	List<CartDetail> viewCart(@Param("customer_id") Long customer_id);
}
