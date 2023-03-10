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
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name = "sales.customers", catalog = "thegioididong")
public class Customer implements Serializable{
	@Column(name = "customer_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long customer_id;
	
	@Column(name = "first_name", length = 255)
	private String first_name;
	
	@Column(name = "last_name", length = 255)
	private String last_name;
	
	@Column(name = "phone", length = 255)
	private String phone;
	
	@Column(name = "email", length = 255)
	private String email;
	
	@Column(name = "street", length = 255)
	private String street;
	
	@Column(name = "city", length = 255)
	private String city;
	
	@Column(name = "account_id")
	private long account_id;

	
}
