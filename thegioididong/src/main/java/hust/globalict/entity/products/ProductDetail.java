package hust.globalict.entity.products;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "product.view_all_product", catalog = "thegioididong")
public class ProductDetail implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "product_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long product_id;
	
	@Column(name = "product_name", length = 255, nullable = false)
	private String product_name;
	
	@Column(name = "brand_name", length = 255, nullable = false)
	private String brand_name;
	
	@Column(name = "category_name", length = 255, nullable = false)
	private String category_name;
	
	@Column(name = "model_year", length = 4)
	private String model_year;
	
	@Column(name = "list_price")
	private double list_price;
	
	@Column(name = "avg_rating")
	private double avg_rating;
	
	@Column(name = "total_review")
	private long total_review;
	
	@Column(name = "discontinued")
	private boolean discontinued;
}
