package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		try {
			List<User> userDetails=UserDBUtil.validate(email, password);
			request.setAttribute("userDetails", userDetails);
			
			 if (userDetails != null && !userDetails.isEmpty()) {
				    User user = userDetails.get(0);
				    int userIdInt = user.getId();
				    
				    String userId = String.valueOf(userIdInt);
				    
				    Cookie cookie = new Cookie("userId", userId);
				    cookie.setMaxAge(60 * 60); 
				    response.addCookie(cookie);
				    
			        response.getWriter().println("Cookie has been set!");
	                RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
	                dis.forward(request, response);
	            } else {
	            	response.setContentType("text/html");
	                PrintWriter out = response.getWriter();
	                out.println("<script type='text/javascript'>");
	                out.println("alert('Invalid email or password. Please try again.');");
	                out.println("window.location.href='signinsignup.jsp';");
	                out.println("</script>");
	            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
