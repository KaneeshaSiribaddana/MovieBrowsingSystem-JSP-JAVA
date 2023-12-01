package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertFeedback")
public class InsertFeedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Feedback feedback = new Feedback(0,firstName, lastName, email, message);

        boolean isSuccess = FeedbackDBUtil.insertFeedback(feedback);

        if (isSuccess) {
            response.sendRedirect("index.jsp"); // Redirect to a success page
        } else {
        	response.getWriter().println("<script type='text/javascript'>alert('Sending Feedback unsuccessful. Please try again.');</script>");
            response.sendRedirect("index.jsp"); // Redirect to an error page
        }
    }
}
