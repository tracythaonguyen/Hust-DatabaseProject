package hust.globalict.entity.products;


import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import hust.globalict.entity.sales.Cart;
import hust.globalict.entity.sales.OrderDetail;
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
@Table(name = "product.items", catalog = "thegioididong")
public class Item implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "serial_code")
	private String serial_code;
	
	@JoinColumn(name = "product_id")
	@ManyToOne(cascade = CascadeType.ALL, optional = false)
	private Product product;
	
	@Column(name = "MFG")
	@DateTimeFormat(pattern="yyyy-mm-dd")
    private Date MFG;
	
	@JoinColumn(name = "config_id")
	@ManyToOne(cascade = CascadeType.ALL, optional = false)
	private Config config;
	
	@OneToOne(mappedBy = "item")
    private OrderDetail orderdetail;
	
}
