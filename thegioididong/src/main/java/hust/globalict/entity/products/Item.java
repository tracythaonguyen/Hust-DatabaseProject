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

import hust.globalict.entity.sales.Coverage;
import hust.globalict.entity.sales.OrderDetail;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
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
	
	@Column(name = "color", length = 255)
	private String color;
	
	@Column(name = "RAM", length = 255)
	private String RAM;
	
	@Column(name = "ROM", length = 255)
	private String ROM;
	
	@OneToOne(mappedBy = "item")
    private OrderDetail orderdetail;
	
}
