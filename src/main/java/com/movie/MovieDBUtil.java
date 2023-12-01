package com.movie;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MovieDBUtil {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet results = null;

    public static List<Movie> getAllMovies() {
        List<Movie> movieList = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "SELECT * FROM movie";
            results = stmt.executeQuery(sql);

            while (results.next()) {
                int id = results.getInt("id");
                String name = results.getString("name");
                double rating = results.getDouble("rating");
                int time = results.getInt("time");
                double price = results.getDouble("price");
                String cast = results.getString("cast");
                String description = results.getString("description");
                String url = results.getString("url");
                int approval = results.getInt("approval");
                int user_id = results.getInt("user_id");

                Movie movie = new Movie(id, name, rating, time, price, cast, description, url,approval,user_id);
                movieList.add(movie);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movieList;
    }

    public static boolean updateMovie(int id, String name, double rating, int time, double price, String cast, String description, String url) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // Update movie data in the database
            String sql = "UPDATE movie SET name='" + name + "', rating=" + rating + ", time=" + time +
                    ", price=" + price + ", cast='" + cast + "', description='" + description + "', url='" + url +
                    "' WHERE id=" + id;

            int rowsAffected = stmt.executeUpdate(sql);

            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static boolean deleteMovie(int id) {
        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // Delete movie data from the database
            String sql = "DELETE FROM movie WHERE id=" + id;

            int rowsAffected = stmt.executeUpdate(sql);

            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    public static Movie getMovie(int id) {
        Movie movie = null;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // Retrieve movie data from the database based on the provided ID
            String sql = "SELECT * FROM movie WHERE id=" + id;
            results = stmt.executeQuery(sql);

            if (results.next()) {
                String name = results.getString("name");
                double rating = results.getDouble("rating");
                int time = results.getInt("time");
                double price = results.getDouble("price");
                String cast = results.getString("cast");
                String description = results.getString("description");
                String url = results.getString("url");
                int approval = results.getInt("approval");
                int user_id = results.getInt("user_id");
System.out.println(url);
                movie = new Movie(id, name, rating, time, price, cast, description, url,approval,user_id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return movie;
    }

    public static boolean insertMovie(Movie movie) {
        boolean isSuccess = false;
        Connection con = null;
        Statement stmt = null;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // Insert movie data into the database
            String sql = "INSERT INTO movie (name, rating, time, price, cast, description, url, approval, user_id) VALUES ('"
                    + movie.getName() + "', " + movie.getRating() + ", " + movie.getTime() + ", " + movie.getPrice()
                    + ", '" + movie.getCast() + "', '" + movie.getDescription() + "', '" + movie.getUrl() + "', 0, " + movie.getUser_id() + ")";

            int rowsAffected = stmt.executeUpdate(sql);

            isSuccess = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
