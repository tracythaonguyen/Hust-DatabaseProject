package hust.globalict.entity.products;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Immutable;
import org.hibernate.annotations.Type;

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
public class ProductDetail implements Serializable {
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

  @Column(name = "list_price",precision = 10, scale = 2)
  private java.math.BigDecimal list_price;

  @Column(name = "avg_rating")
  private Double avg_rating;

  @Column(name = "total_review")
  private Long total_review;

  @Column(name = "discontinued")
  private boolean discontinued;
}
