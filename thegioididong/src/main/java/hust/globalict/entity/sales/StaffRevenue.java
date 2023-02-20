package hust.globalict.entity.sales;

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
@Table(name = "sales.staff_revenue", catalog = "thegioididong")
public class StaffRevenue implements Serializable {
  @Column(name = "staff_id")
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long staff_id;

  @Column(name = "staff_name", length = 255, nullable = false)
  private String staff_name;

  @Column(name = "total_revenue")
  private float total_revenue;
}
