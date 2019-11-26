package com.cognizant.authenticationservice.model;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
@Entity
@Table(name="user")
public class User {
public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getContact_number() {
		return contact_number;
	}
	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getAadhar_number() {
		return aadhar_number;
	}
	public void setAadhar_number(String aadhar_number) {
		this.aadhar_number = aadhar_number;
	}
	public String getUsr_id() {
		return usr_id;
	}
	public void setUsr_id(String usr_id) {
		this.usr_id = usr_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
@Id
@Column
private int user_id;
@Column
private String first_name;
@Column
private String last_name;
public User() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "User [user_id=" + user_id + ", first_name=" + first_name + ", last_name=" + last_name + ", age=" + age
			+ ", gender=" + gender + ", contact_number=" + contact_number + ", pan=" + pan + ", aadhar_number="
			+ aadhar_number + ", usr_id=" + usr_id + ", password=" + password + ", roleList=" + roleList + "]";
}
public User(int user_id, String first_name, String last_name, int age, String gender, String contact_number, String pan,
		String aadhar_number, String usr_id, String password, List<Role> roleList) {
	super();
	this.user_id = user_id;
	this.first_name = first_name;
	this.last_name = last_name;
	this.age = age;
	this.gender = gender;
	this.contact_number = contact_number;
	this.pan = pan;
	this.aadhar_number = aadhar_number;
	this.usr_id = usr_id;
	this.password = password;
	this.roleList = roleList;
}
@Column
private int age;
@Column
private String gender;
@Column
private String contact_number;
@Column
private String pan;
@Column
private String aadhar_number;
@Column
private String usr_id;
@Column
private String password;
@ManyToMany
@JoinTable(name="user_role",joinColumns= {@JoinColumn(name="ur_ro_id") },inverseJoinColumns= { @JoinColumn(name="role_ro_id")})
private List<Role> roleList;
}