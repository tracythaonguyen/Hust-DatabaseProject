package hust.globalict.entity.products;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
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
@Table(name = "product.config", catalog = "thegioididong")
public class Config implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "config_id")
	private long config_id;
	
	@Column(name = "color", length = 255)
	private String color;
	
	@Column(name = "RAM", length = 255)
	private String RAM;
	
	@Column(name = "ROM", length = 255)
	private String ROM;
	
	@Column(name = "extra_charge")
	private int extra_charge;
}
