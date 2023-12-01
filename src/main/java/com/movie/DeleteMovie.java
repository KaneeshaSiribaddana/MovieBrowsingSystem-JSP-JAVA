package com.movie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteMovie")
public class DeleteMovie extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        boolean isDeleted = MovieDBUtil.deleteMovie(id);

        if (isDeleted) {
            response.sendRedirect("fetchMovies.jsp");
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Deletion Unsuccessful. Please Try Again Later');");
            response.getWriter().println("window.location.href='fetchMovies.jsp';");
            response.getWriter().println("</script>");
        }
    }
}
