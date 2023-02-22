package hust.globalict.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.Customer;
import hust.globalict.entity.sys.Account;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
	@Query(value = "SELECT * FROM sales.get_customer_by_account_id(:account_id) ;", nativeQuery = true)
	public Customer findCustomerByAccountId(@Param("account_id") Long id);

}