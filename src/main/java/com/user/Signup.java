package com.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String birthdate=request.getParameter("birthdate");
		String password=request.getParameter("password");
		
		boolean isTrue;
		
		isTrue=UserDBUtil.insertUser(email, name, birthdate, password);
		
		if(isTrue==true) {
			response.getWriter().println("<script type='text/javascript'>alert('Registration Successful. Please Login.');</script>");
			RequestDispatcher dis = request.getRequestDispatcher("signinsignup.jsp");
			dis.include(request, response);
		}else {
			response.getWriter().println("<script type='text/javascript'>alert('Registration unsuccessful. Please try again.');</script>");
			RequestDispatcher dis = request.getRequestDispatcher("signinsignup.jsp");
			dis.include(request, response);
		}
	}

}
