package com.movie;

import java.io.IOException;
import javax.servlet.http.Cookie;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddMovies")
public class AddMovies extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("movie");
        double rating = Double.parseDouble(request.getParameter("rating"));
        int time = Integer.parseInt(request.getParameter("time"));
        double price = Double.parseDouble(request.getParameter("price"));
        String cast = request.getParameter("cast");
        String description = request.getParameter("description");
        String url = request.getParameter("url");

        Cookie[] cookies = request.getCookies();
        String idValue = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userId")) {
                    idValue = cookie.getValue();
                    break;
                }
            }
        }

        int userId = 0; 
        try {
            userId = Integer.parseInt(idValue);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
System.out.println(name+rating+time+price+cast+description+url+ userId);
        Movie movie = new Movie(0,name, rating, time, price, cast, description, url, 0, userId);
        boolean isSuccess = MovieDBUtil.insertMovie(movie);

        if (isSuccess) {
            response.sendRedirect("fetchMovies.jsp");
        } else {
        	response.getWriter().println("<script type='text/javascript'>alert('Movie Upload unsuccessful. Please try again.');</script>");
			RequestDispatcher dis = request.getRequestDispatcher("fetchMovies.jsp");
			dis.include(request, response);
        }
    }
}
