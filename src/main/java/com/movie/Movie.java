package com.movie;
public class Movie {
    private int id;
    private String name;
    private double rating;
    private int time;
    private double price;
    private String cast;
    private String description;
    private String url;
    private int approval;
    private int user_id;
	public Movie(int id, String name, double rating, int time, double price, String cast, String description,
			String url, int approval, int user_id) {
		super();
		this.id = id;
		this.name = name;
		this.rating = rating;
		this.time = time;
		this.price = price;
		this.cast = cast;
		this.description = description;
		this.url = url;
		this.approval = approval;
		this.user_id = user_id;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public double getRating() {
		return rating;
	}
	public int getTime() {
		return time;
	}
	public double getPrice() {
		return price;
	}
	public String getCast() {
		return cast;
	}
	public String getDescription() {
		return description;
	}
	public String getUrl() {
		return url;
	}
	public int getApproval() {
		return approval;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
}