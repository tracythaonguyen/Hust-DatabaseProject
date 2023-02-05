package hust.globalict.entity.sales;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import hust.globalict.entity.sys.Account;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "sales.customers", catalog = "thegioididong")
public class Customer implements Serializable{
	@Column(name = "customer_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long customer_id;
	
	@Column(name = "first_name", length = 255, nullable = false)
	private String first_name;
	
	@Column(name = "last_name", length = 255, nullable = false)
	private String last_name;
	
	@Column(name = "phone", length = 255, nullable = false,unique= true)
	private String phone;
	
	@Column(name = "email", length = 255, nullable = false,unique= true)
	private String email;
	
	@Column(name = "street", length = 255, nullable = false)
	private String street;
	
	@Column(name = "cỉty", length = 255, nullable = false)
	private String city;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "account_id", referencedColumnName = "account_id")
	private Account account;
	
}
