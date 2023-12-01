package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteFeedback")
public class DeleteFeedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int feedbackId = Integer.parseInt(request.getParameter("id"));

        boolean isSuccess = FeedbackDBUtil.deleteFeedback(feedbackId);

        if (isSuccess) {

        	response.setContentType("text/html");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Deletion Successful);");
            response.getWriter().println("window.location.href='fetchFeedbacks.jsp';");
            response.getWriter().println("</script>");
        } else {
        	response.setContentType("text/html");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Deletion Unsuccessful. Please Try Again Later');");
            response.getWriter().println("window.location.href='fetchFeedbacks.jsp';");
            response.getWriter().println("</script>");
        }
    }
}
