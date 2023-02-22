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
	
	
	@Column(name = "product_id")
	private Long product_id;
	
	
	@Column(name = "MFG")
	@DateTimeFormat(pattern="yyyy-mm-dd")
    private Date MFG;
	
	@Column(name = "config_id")
	private Long config_id;
	
	
	@Column(name = "availability")
	private Boolean availability;
	
}
