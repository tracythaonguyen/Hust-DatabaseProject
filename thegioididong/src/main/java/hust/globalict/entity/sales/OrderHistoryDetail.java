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
@Table(name = "sales.view_detail_order_history", catalog = "thegioididong")
public class OrderHistoryDetail implements Serializable {
	
	@Column(name = "product_name", length = 255, nullable = false)
	private String product_name;
	
	@Id
	@Column(name = "serial_code")
	private String serial_code;
	
	@Column(name = "color", length = 255)
	private String color;
	
	@Column(name = "ram", length = 255)
	private String ram;
	
	@Column(name = "rom", length = 255)
	private String rom;
	
	@Column(name = "list_price")
	private double list_price;
	
	@Column(name = "extra_charge")
	private double extra_charge;
}
