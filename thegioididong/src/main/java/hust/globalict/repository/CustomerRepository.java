package hust.globalict.repository;

import java.math.BigDecimal;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
	@Query(value = "SELECT * FROM sales.get_customer_by_account_id(:account_id) ;", nativeQuery = true)
	public Customer findCustomerByAccountId(@Param("account_id") Long id);
	
	
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "CALL sales.rate_product(:customer_id,:product_id,:score);",nativeQuery = true)
	void rateProduct(@Param("customer_id") Long customer_id,@Param("product_id") Long product_id,@Param("score") BigDecimal score);
}