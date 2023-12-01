package com.movie;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateMovie")
public class UpdateMovie extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParameter = request.getParameter("id");
        String name = request.getParameter("name");
        String ratingParameter = request.getParameter("rating");
        String timeParameter = request.getParameter("time");
        String priceParameter = request.getParameter("price");
        String cast = request.getParameter("cast");
        String description = request.getParameter("description");
        String url = request.getParameter("url");

        // Perform null and empty checks before parsing
        if (idParameter != null && !idParameter.isEmpty() &&
            ratingParameter != null && !ratingParameter.isEmpty() &&
            timeParameter != null && !timeParameter.isEmpty() &&
            priceParameter != null && !priceParameter.isEmpty()) {

            int id = Integer.parseInt(idParameter);
            double rating = Double.parseDouble(ratingParameter);
            int time = Integer.parseInt(timeParameter);
            double price = Double.parseDouble(priceParameter);

            System.out.println(id + name + rating + time + price + cast + description + url);
            boolean isUpdated;

            isUpdated = MovieDBUtil.updateMovie(id, name, rating, time, price, cast, description, url);

            if (isUpdated) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("fetchMovies.jsp");
                dispatcher.forward(request, response);
            } else {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script type='text/javascript'>");
                out.println("alert('Updation Unsuccessful. Please Try Again Later');");
                out.println("window.location.href='fetchMovies.jsp';");
                out.println("</script>");
            }
        } else {
            // Handle the case where one or more parameters are null or empty
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid input. Please fill out all fields.');");
            out.println("window.location.href='updateMovieForm.jsp';"); // Adjust the redirection URL accordingly
            out.println("</script>");
        }
    }

}
