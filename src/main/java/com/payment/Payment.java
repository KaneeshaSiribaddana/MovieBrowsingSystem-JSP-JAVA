package com.payment;

import java.sql.Date;

public class Payment {
    private int id;
    private int movieId;
    private int userId;
    private double amount;
    private Date date;

    // Constructors
    public Payment() {
    }

    public Payment(int id, int movieId, int userId, double amount, Date date) {
        this.id = id;
        this.movieId = movieId;
        this.userId = userId;
        this.amount = amount;
        this.date = date;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    // toString method for debugging and logging
    @Override
    public String toString() {
        return "Payment{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", userId=" + userId +
                ", amount=" + amount +
                ", date='" + date + '\'' +
                '}';
    }
}
