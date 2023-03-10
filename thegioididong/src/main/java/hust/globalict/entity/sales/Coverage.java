package hust.globalict.entity.sales;

import java.io.Serializable;
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
@Table(name = "sales.coverages", catalog = "thegioididong")
public class Coverage implements Serializable{
	@Column(name = "coverage_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long coverage_id;
	
	@Column(name = "serial_code")
	private String serial_code;

	
	@Column(name = "coverages_expired_date")
	@DateTimeFormat(pattern="yyyy-mm-dd")
    private Date coverages_expired_date;
	
}
