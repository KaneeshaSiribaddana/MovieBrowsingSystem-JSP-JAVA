package com.payment;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PaymentDBUtil {

    public static List<Payment> getAllPayments() {
        List<Payment> paymentList = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet results = null;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM payments";
            results = stmt.executeQuery(sql);

            while (results.next()) {
                int id = results.getInt("id");
                int movieId = results.getInt("movieId");
                int userId = results.getInt("userId");
                double amount = results.getDouble("amount");
                Date date = results.getDate("date");

                Payment payment = new Payment(id, movieId, userId, amount, date);
                paymentList.add(payment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (results != null) results.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return paymentList;
    }

    public static boolean insertPayment(Payment payment) {
        boolean isSuccess = false;
        Connection con = null;
        Statement stmt = null;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
System.out.println(payment.getMovieId()+ payment.getUserId()+payment.getAmount() );
            // Insert payment data into the database
            String sql = "INSERT INTO payments (movieId, userId, amount, date) VALUES (" +
                    payment.getMovieId() + ", " + payment.getUserId() + ", " +
                    payment.getAmount() + ", '" + payment.getDate() + "')";

            int rowsAffected = stmt.executeUpdate(sql);

            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }
    public static boolean updatePayment(int id,int movieId,int userId, double amount,String date) {
        boolean isSuccess = false;
        Connection con = null;
        Statement stmt = null;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // Update payment amount in the database
            String sql = "UPDATE payments SET amount=" + amount + ",movieId=" + movieId + ",userId=" + userId + ",date='" + date + "' WHERE id=" + id;

            int rowsAffected = stmt.executeUpdate(sql);

            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }

    public static boolean deletePayment(int id) {
        boolean isSuccess = false;
        Connection con = null;
        Statement stmt = null;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // Delete payment record from the database
            String sql = "DELETE FROM payments WHERE id=" + id;

            int rowsAffected = stmt.executeUpdate(sql);

            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }
}
