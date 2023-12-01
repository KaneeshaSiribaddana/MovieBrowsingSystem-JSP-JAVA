package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String birthdate=request.getParameter("birthdate");
		
		boolean isTrue;
		
		isTrue=UserDBUtil.updateUser(id, email, name, birthdate);
		
		if(isTrue) {
			  RequestDispatcher dis = request.getRequestDispatcher("fetchUsers.jsp");
              dis.forward(request, response);
          } else {
          	response.setContentType("text/html");
              PrintWriter out = response.getWriter();
              out.println("<script type='text/javascript'>");
              out.println("alert('Updation Unsuccessful.Please Try Again Later');");
              out.println("window.location.href='fetchUsers.jsp';");
              out.println("</script>");
          }
	}

}
