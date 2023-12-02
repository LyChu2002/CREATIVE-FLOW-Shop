package vn.devpro.javaweb26.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_size")
public class Size extends BaseModel{
	@Column(name = "name", length = 10, nullable = false)
	private String name;
	
	@Column(name = "description", length = 200, nullable = true)
	private String description;
	
}
