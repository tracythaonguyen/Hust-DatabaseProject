package hust.globalict.entity.sales;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
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
@Table(name = "sales.orders", catalog = "thegioididong")
public class Order implements Serializable{
	@Column(name = "order_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long order_id;
	
	@JoinColumn(name = "customer_id")
	@ManyToOne(cascade = CascadeType.ALL, optional = false)
	private Customer customer;
	
	@Column(name = "order_status")
	private int order_status;
	
	@Column(name = "order_date")
	@DateTimeFormat(pattern="yyyy-mm-dd")
    private Date order_date;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "staff_id", referencedColumnName = "staff_id")
	private Staff staff;
	
	@Column(name = "total_amount")
	private int total_amount;
}
