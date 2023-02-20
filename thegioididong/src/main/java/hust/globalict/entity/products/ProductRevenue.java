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
@Table(name = "sales.product_revenue", catalog = "thegioididong")
public class ProductRevenue implements Serializable {
  @Column(name = "product_id")
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long product_id;

  @Column(name = "product_name", length = 255, nullable = false)
  private String product_name;

  @Column(name = "total_revenue")
  private float total_revenue;
}
