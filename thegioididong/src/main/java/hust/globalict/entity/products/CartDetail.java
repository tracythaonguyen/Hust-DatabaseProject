package hust.globalict.entity.products;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Immutable;

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
@Immutable
@Table(name = "sales.view_cart", catalog = "thegioididong")
public class CartDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "product_name")
	private String product_name;
	
	@Column(name = "serial_code", length = 255, nullable = false)
	@Id
	private String serial_code;


	@Column(name = "color", length = 255)
	private String color;

	@Column(name = "ram", length = 255)
	private String ram;

	@Column(name = "rom", length = 255)
	private String rom;

	@Column(name = "total_price")
	private double total_price;
}
