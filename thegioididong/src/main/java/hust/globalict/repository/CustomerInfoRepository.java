package hust.globalict.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.Customer;
import hust.globalict.entity.sales.CustomerInfo;

@Repository
public interface CustomerInfoRepository extends JpaRepository<CustomerInfo, Long>{
	 @Query(value="SELECT * FROM sales.view_customer_info() WHERE account_id =:account_id ;",nativeQuery= true)
	 public CustomerInfo findCustomerByAccountId(@Param("account_id") Long account_id);
	 
	@Query(value="SELECT * FROM sales.view_customer_info() WHERE customer_id=:customer_id ;",nativeQuery= true)
	public CustomerInfo findCustomerById(@Param("customer_id") Long customer_id);
	
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "CALL sales.update_info(:customer_id,:first_name,:last_name, :phone, :email ,:street, :city, :user_name,:pass_word) ;", nativeQuery = true)
	void updateCustomerInfo(@Param("customer_id") Long customer_id, @Param("first_name") String first_name,
			@Param("last_name") String last_name, @Param("phone") String phone, @Param("email") String email,
			@Param("street") String street, @Param("city") String city, @Param("user_name") String user_name,
			@Param("pass_word") String pass_word);
}
