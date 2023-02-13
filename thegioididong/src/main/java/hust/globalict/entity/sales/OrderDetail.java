package hust.globalict.entity.sales;

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

import hust.globalict.entity.products.Item;
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
@Table(name = "sales.orders_details", catalog = "thegioididong")
public class OrderDetail implements Serializable{
	@Column(name = "order_detail_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long order_detail_id;
	
	@JoinColumn(name = "order_id")
	@ManyToOne(cascade = CascadeType.ALL, optional = false)
	private Order order;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "serial_code", referencedColumnName = "serial_code")
	private Item item;
	
	@OneToOne(mappedBy = "item1")
    private Coverage coverage;
	
	@Column(name = "discount")
	private float discount;
}
