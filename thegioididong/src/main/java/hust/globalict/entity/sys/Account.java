package hust.globalict.entity.sys;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import hust.globalict.entity.sales.Customer;
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
@Table(name = "sys.accounts", catalog = "thegioididong")
public class Account implements Serializable{
	@Column(name = "account_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long account_id ;
	
	@Column(name = "user_name", length = 255, nullable = false,unique= true)
	private String user_name;
	
	@Column(name = "password", length = 255, nullable = false)
	private String password;
	
	@JoinColumn(name = "role_id")
	@ManyToOne(cascade = CascadeType.ALL, optional = false)
	private Role role;
	
	@OneToOne(mappedBy = "account")
    private Customer customer;
}
