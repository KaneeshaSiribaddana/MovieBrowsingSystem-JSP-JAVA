package com.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {
private static Connection con=null;
private static Statement stmt=null;
private static ResultSet results=null;
	
	public static List<User> validate(String email,String password){
		ArrayList<User> user=new ArrayList<>();
		
		
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			
			String sql="SELECT * FROM user WHERE email='"+email+"'AND password='"+password+"'";
			results=stmt.executeQuery(sql);
			
			if(results.next()) {
				int id=results.getInt(1);
				String resultemail=results.getString(2);
				String name=results.getString(3);
				Date birthdate=results.getDate(4);
				String resultpassword=results.getString(5);
				
				User u= new User(id,resultemail,name,birthdate,resultpassword);
				user.add(u);
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public static boolean insertUser(String email, String name, String birthdate, String password) {
	    boolean isSuccess = false;

	    try {
	        con = DBConnect.getConnection();
	        // Check if the email is already registered
	        PreparedStatement checkEmailStatement = con.prepareStatement("SELECT * FROM user WHERE email = ?");
	        checkEmailStatement.setString(1, email);
	        ResultSet resultSet = checkEmailStatement.executeQuery();

	        if (!resultSet.next()) {
	            // Email is not registered, perform insertion
	            String sql = "INSERT INTO user VALUES(0, ?, ?, ?, ?)";
	            PreparedStatement preparedStatement = con.prepareStatement(sql);
	            preparedStatement.setString(1, email);
	            preparedStatement.setString(2, name);
	            preparedStatement.setString(3, birthdate);
	            preparedStatement.setString(4, password);

	            int result = preparedStatement.executeUpdate();
	            if (result > 0) {
	                isSuccess = true;
	            } else {
	                isSuccess = false;
	            }
	            preparedStatement.close();
	        } else {
	            // Email is already registered
	            isSuccess = false;
	        }
	        checkEmailStatement.close();
	        resultSet.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

	public static List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM user";
            results = stmt.executeQuery(sql);

            while (results.next()) {
                int id = results.getInt("id");
                String email = results.getString("email");
                String name = results.getString("name");
                Date birthdate = results.getDate("birthdate");
                String password = results.getString("password");

                User user = new User(id, email, name, birthdate, password);
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
	public static boolean updateUser(String id, String email, String name, String birthdate) {
        boolean isSuccess = false;

        try {
        	con=DBConnect.getConnection();
        	stmt=con.createStatement();
            // Update user data in the database
            String sql = "UPDATE user SET email='"+email+"', name='"+name+"', birthdate='"+birthdate+"' WHERE id='"+id+"'";

            int rowsAffected = stmt.executeUpdate(sql);

            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } 

        return isSuccess;
    }
	public static boolean deleteUser(String id) {
	    boolean isSuccess = false;

	    try {
	        con = DBConnect.getConnection();
	        stmt = con.createStatement();

	        // Delete user data from the database
	        String sql = "DELETE FROM user WHERE id='" + id + "'";

	        int rowsAffected = stmt.executeUpdate(sql);

	        isSuccess = rowsAffected > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}
	
}
