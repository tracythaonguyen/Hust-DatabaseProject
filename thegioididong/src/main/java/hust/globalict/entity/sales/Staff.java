package hust.globalict.entity.sales;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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
@Table(name = "sales.staffs", catalog = "thegioididong")
public class Staff implements Serializable{
	@Column(name = "staff_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long staff_id;
	
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
	
	@Column(name = "active")
	private boolean active;
	
	@Column(name = "manager_id")
	private long manager_id;
	
	@OneToOne(mappedBy = "staff")
    private Order order;
}
