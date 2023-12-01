package com.payment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdatePayment")
public class UpdatePayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String date = request.getParameter("date");

        System.out.println(id+movieId+userId+amount+date);
        boolean isSuccess = PaymentDBUtil.updatePayment(id, movieId, userId, amount,date);

        if (isSuccess) {
        	response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Updation Successful');");
            out.println("window.location.href='payments.jsp';");
            out.println("</script>");
        } else {
        	response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Updation Unsuccessful.Please Try Again Later');");
            out.println("window.location.href='payments.jsp';");
            out.println("</script>");
        }
    }
}
