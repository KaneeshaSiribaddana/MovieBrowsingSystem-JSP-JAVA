package com.payment;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate; // Import LocalDate from java.time package

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertPayment")
public class InsertPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Parse data from the request parameters
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        double amount = Double.parseDouble(request.getParameter("amount"));

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
        // Get today's date
        LocalDate currentDate = LocalDate.now();
        Date date = Date.valueOf(currentDate); 
        Payment payment = new Payment(0,movieId, userId, amount, date);
System.out.println(movieId+userId+amount	);

        boolean isSuccess = PaymentDBUtil.insertPayment(payment);

        if (isSuccess) {
        	response.getWriter().println("<script type='text/javascript'>window.location='index.jsp';</script>");
            response.sendRedirect("index.jsp");
        } else {
        	response.getWriter().println("<script type='text/javascript'>alert('Payment unsuccessful. Please try again.');</script>");
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.include(request, response);
        }
    }
}
