package com.kbbitoladmh.pm.util;

import javax.servlet.http.HttpServletRequest;


public class MessageHelper {
	
	public  void addMessage(HttpServletRequest req, String s){
		
		
		String msg = (String) req.getSession().getAttribute("msg");
		System.out.println(msg);
		if(null !=msg){
			req.getSession().setAttribute("msg", msg + " | " + s);
		}else{
			req.getSession().setAttribute("msg",s);
		}
		
		System.out.println(req.getSession().getAttribute("msg"));
		
		
		
	}


}
