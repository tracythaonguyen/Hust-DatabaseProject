package hust.globalict.entity.products;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
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
@Table(name = "product.stocks", catalog = "thegioididong")
public class Stock implements Serializable{
	private static final long serialVersionUID = 1L;

	@Column(name = "product_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long product_id;
	
	@Column(name = "quantity")
	private long quantity;
	
	@OneToOne
    @PrimaryKeyJoinColumn(name="product_id")
    private Product product;
}
