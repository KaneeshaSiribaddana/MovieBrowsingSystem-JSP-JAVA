package com.feedback;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateFeedback")
public class UpdateFeedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int feedbackId = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Feedback feedback = new Feedback(feedbackId, firstName, lastName, email, message);

        boolean isSuccess = FeedbackDBUtil.updateFeedback(feedback);

        if (isSuccess) {
        	response.sendRedirect("fetchfeedbacks.jsp"); 
        } else {
        	response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Updation Unsuccessful. Please Try Again Later');");
            out.println("window.location.href='fetchFeedbacks.jsp';");
            out.println("</script>");
        }
    }
}
