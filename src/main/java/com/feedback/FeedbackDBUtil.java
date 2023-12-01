package com.feedback;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDBUtil {
    public static boolean insertFeedback(Feedback feedback) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement preparedStatement = null;

        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO feedbacks (first_name, last_name, email, message) VALUES (?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, feedback.getFirstName());
            preparedStatement.setString(2, feedback.getLastName());
            preparedStatement.setString(3, feedback.getEmail());
            preparedStatement.setString(4, feedback.getMessage());

            int rowsAffected = preparedStatement.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }
    public static boolean updateFeedback(Feedback feedback) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement preparedStatement = null;

        try {
            con = DBConnect.getConnection();
            String sql = "UPDATE feedbacks SET first_name=?, last_name=?, email=?, message=? WHERE id=?";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, feedback.getFirstName());
            preparedStatement.setString(2, feedback.getLastName());
            preparedStatement.setString(3, feedback.getEmail());
            preparedStatement.setString(4, feedback.getMessage());
            preparedStatement.setInt(5, feedback.getId());

            int rowsAffected = preparedStatement.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }

    public static boolean deleteFeedback(int feedbackId) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement preparedStatement = null;

        try {
            con = DBConnect.getConnection();
            String sql = "DELETE FROM feedbacks WHERE id=?";
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, feedbackId);

            int rowsAffected = preparedStatement.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSuccess;
    }

    public static List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        Connection con = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            con = DBConnect.getConnection();
            String sql = "SELECT * FROM feedbacks";
            preparedStatement = con.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String email = resultSet.getString("email");
                String message = resultSet.getString("message");
System.out.println(firstName);
                Feedback feedback = new Feedback(id, firstName, lastName, email, message);
                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return feedbackList;
    }
}
