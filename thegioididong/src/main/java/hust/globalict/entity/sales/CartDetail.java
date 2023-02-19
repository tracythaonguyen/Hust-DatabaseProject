package hust.globalict.entity.sales;

import hust.globalict.entity.sales.Cart;
import hust.globalict.entity.sales.OrderDetail;
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
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name = "product.view_cart", catalog = "thegioididong")
public class CartDetail implements Serializable {
  private static final long serialVersionUID = 1L;

  @Column(name = "product_name", length = 255, nullable = false)
  private String product_name;

  @Id
  @Column(name = "serial_code")
  private String serial_code;

  @Column(name = "color", length = 255)
  private String color;

  @Column(name = "RAM", length = 255)
  private String RAM;

  @Column(name = "ROM", length = 255)
  private String ROM;

  @Column(name = "list_price")
  private double list_price;

  @Column(name = "extra_charge")
  private int extra_charge;
}
