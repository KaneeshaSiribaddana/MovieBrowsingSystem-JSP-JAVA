package com.user;

import java.sql.Date;

public class User {
private int id;
private String email;
private String name;
private Date birthdate;
private String password;
public User(int id, String email, String name, Date birthdate, String password) {
	super();
	this.id = id;
	this.email = email;
	this.name = name;
	this.birthdate = birthdate;
	this.password = password;
}
public int getId() {
	return id;
}
public String getEmail() {
	return email;
}
public String getName() {
	return name;
}
public Date getBirthdate() {
	return birthdate;
}
public String getPassword() {
	return password;
}
public void setId(int id) {
	this.id = id;
}
public void setEmail(String email) {
	this.email = email;
}
public void setName(String name) {
	this.name = name;
}
public void setBirthdate(Date birthdate) {
	this.birthdate = birthdate;
}
public void setPassword(String password) {
	this.password = password;
}

}
