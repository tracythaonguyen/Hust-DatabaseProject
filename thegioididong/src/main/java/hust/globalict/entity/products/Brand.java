package hust.globalict.entity.products;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "product.brands", catalog = "thegioididong")
public class Brand implements Serializable{
	private static final long serialVersionUID = 1L;

	@Column(name = "brand_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long brand_id;
	
	@Column(name = "brand_name", length = 255, nullable = false, unique = true)
	private String brand_name;
}
