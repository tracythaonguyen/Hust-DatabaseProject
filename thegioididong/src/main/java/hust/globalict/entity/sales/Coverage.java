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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import hust.globalict.entity.products.Item;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "sales.coverages", catalog = "thegioididong")
public class Coverage implements Serializable{
	@Column(name = "coverage_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long coverage_id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "serial_code", referencedColumnName = "serial_code")
	private Item item1;
	
	@Column(name = "coverages_expired_date")
	@DateTimeFormat(pattern="yyyy-mm-dd")
    private Date coverages_expired_date;
	
}
