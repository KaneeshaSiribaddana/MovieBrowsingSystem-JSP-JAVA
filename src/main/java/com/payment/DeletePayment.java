package com.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePayment")
public class DeletePayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int paymentId = Integer.parseInt(request.getParameter("id"));

        // Call the deletePayment method from PaymentDBUtil to delete the payment record
        boolean isSuccess = PaymentDBUtil.deletePayment(paymentId);

        // Send response back to the client
        if (isSuccess) {
        	response.getWriter().println("window.location.href='payments.jsp';");
        } else {
        	 response.setContentType("text/html");
             response.getWriter().println("<script type='text/javascript'>");
             response.getWriter().println("alert('Deletion Unsuccessful. Please Try Again Later');");
             response.getWriter().println("window.location.href='payments.jsp';");
             response.getWriter().println("</script>");
        }
    }
}
