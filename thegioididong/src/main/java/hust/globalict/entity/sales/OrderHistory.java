package hust.globalict.entity.sales;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

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
@Table(name = "sales.view_order_history", catalog = "thegioididong")
public class OrderHistory {
	@Column(name = "order_id")
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private long order_id;

	  @Column(name = "order_status")
	  private String order_status;

	  @Column(name = "order_date")
	  @DateTimeFormat(pattern = "yyyy-mm-dd")
	  private Date order_date;

	  @Column(name = "staff_id", nullable= true	)
	  private Long staff_id;

	  @Column(name = "total_amount")
	  private double total_amount;
}
