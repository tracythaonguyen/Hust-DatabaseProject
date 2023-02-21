package hust.globalict.entity.sales;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
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
@Table(name = "product.cart", catalog = "thegioididong")
public class Cart implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "cart_id")
	private String cart_id;
	
	@Column(name = "customer_id")
	private String customer_id;
	
	@Column(name = "serial_code")
	private String serial_code;
}
