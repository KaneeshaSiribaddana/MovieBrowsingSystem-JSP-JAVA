package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        boolean isDeleted = UserDBUtil.deleteUser(id);

        if (isDeleted) {
            response.sendRedirect("fetchUsers.jsp");
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Deletion Unsuccessful. Please Try Again Later');");
            response.getWriter().println("window.location.href='fetchUsers.jsp';");
            response.getWriter().println("</script>");
        }
    }
}
