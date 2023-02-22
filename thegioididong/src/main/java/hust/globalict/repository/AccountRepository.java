package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sys.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long>{
	 @Query(value="SELECT * FROM sys.accounts a WHERE a.user_name = :user_name AND a.password= :password ;",nativeQuery= true)
	 public Account findByUsername(@Param("user_name") String user_name,@Param("password") String password);
	 
	 @Query(value="SELECT * FROM sys.accounts a WHERE a.account_id= :account_id ;",nativeQuery= true)
	 public Account findAccountById(@Param("account_id") Long account_id);
	 
	 @Query(value="SELECT role_id FROM sys.accounts a WHERE a.user _name = :user_name ;",nativeQuery= true)
	 public int getRole(@Param("user_name") String user_name);
	 
	 @Query(value="CALL sales.new_customer(:first_name ,:last_name , :phone , :email ,:street ,:city , :user_name, :pass_word);",nativeQuery= true)
	 public int newCustomer(@Param("first_name") String first_name,@Param("last_name") String last_name,@Param("phone") String phone,@Param("email") String email,@Param("street") String street,@Param("city") String city,@Param("user_name") String user_name,@Param("pass_word") String pass_word);
	 
}
