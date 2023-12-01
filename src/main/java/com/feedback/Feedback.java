package com.feedback;

public class Feedback {
	private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String message;
	public Feedback(int id, String firstName, String lastName, String email, String message) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.message = message;
	}
	public int getId() {
		return id;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getEmail() {
		return email;
	}
	public String getMessage() {
		return message;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMessage(String message) {
		this.message = message;
	}

    

    
}
