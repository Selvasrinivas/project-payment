package com.cognizant.authenticationservice.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class Role {
	@Id
	@Column
	private int ro_id;
	@Column
	private String ro_name;
	@ManyToMany(mappedBy="roleList",fetch=FetchType.EAGER)
	private Set<User> userList;
	@Override
	public String toString() {
		return "role [ro_id=" + ro_id + ", ro_name=" + ro_name + "]";
	}
	public int getRo_id() {
		return ro_id;
	}
	public void setRo_id(int ro_id) {
		this.ro_id = ro_id;
	}
	public String getRo_name() {
		return ro_name;
	}
	public void setRo_name(String ro_name) {
		this.ro_name = ro_name;
	}
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Role(int ro_id, String ro_name) {
		super();
		this.ro_id = ro_id;
		this.ro_name = ro_name;
	}


}
