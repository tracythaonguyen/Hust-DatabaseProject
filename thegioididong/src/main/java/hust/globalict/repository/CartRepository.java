package hust.globalict.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long>{
	@Transactional
	  @Modifying(clearAutomatically = true)
	  @Query(
	    value = "CALL sales.add_to_cart(:customer_id,:serial_code)",
	    nativeQuery = true
	  )
	  void addToCart(@Param("customer_id") Long customer_id,@Param("serial_code") String serial_code);
	
	@Transactional
	  @Modifying(clearAutomatically = true)
	  @Query(
	    value = "CALL sales.remove_from_cart(:customer_id,:serial_code)",
	    nativeQuery = true
	  )
	  void deleteFromCart(@Param("customer_id") Long customer_id,@Param("serial_code") String serial_code);
	
	@Transactional
	  @Modifying(clearAutomatically = true)
	  @Query(
	    value = "CALL sales.make_order_online(:customer_id)",
	    nativeQuery = true
	  )
	  void makeOrder(@Param("customer_id") Long customer_id);
}
