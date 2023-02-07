package hust.globalict.entity.sys;

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
@Table(name = "sys.roles", catalog = "thegioididong")
public class Role  implements Serializable{
	@Column(name = "role_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int role_id;
	
	@Column(name = "role_name", length = 255, nullable = false)
	private String role_name;
	
}
