package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Logout extends HttpServlet {
	private static final Logger log = Logger.getLogger(Logout.class.getName());


	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = (String) req.getSession().getAttribute("username");
		if(!("admin".equals(username)))
			log.info( "logout called  "+ username);
		
		req.getSession().removeAttribute("userin");
		req.getSession().removeAttribute("User");
		req.getSession().removeAttribute("username");
		
	
		
		
		req.getSession().setAttribute("msg", "Се одјавивте!");
		
		
		req.getSession().invalidate();
		
		resp.sendRedirect("login.jsp");
	}
	
}
