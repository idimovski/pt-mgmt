package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;

@SuppressWarnings("serial")
public class Patientreports extends HttpServlet {
private static final Logger log = Logger.getLogger(Patientreports.class.getName());

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
		if(null == req.getSession().getAttribute("userin")){
			resp.sendRedirect("login.jsp");
//			System.out.println("Redirected to login");
		}else{
			if(!(req.getSession().getAttribute("userin").equals(true))){
				resp.sendRedirect("login.jsp");
//				System.out.println("Redirected to login");
			}else{
				
				 RequestDispatcher d = getServletContext().getRequestDispatcher("/preports.jsp");
				 d.forward(req, resp);
				
			}
		}
		
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("do reports called");
		
//		MessageHelper mh = new MessageHelper();
		boolean allRequiredPassed = true;
		
		String pol = req.getParameter("pol");
		
		String oddobden = req.getParameter("dob_1_1");
		String oddobmesec = req.getParameter("dob_1_2");
		String oddobgodina = req.getParameter("dob_1_3");
		
		String FROMdate = oddobgodina+oddobmesec+oddobden;
		
		String dodobden = req.getParameter("dodob_1_1");
		String dodobmesec = req.getParameter("dodob_1_2");
		String dodobgodina = req.getParameter("dodob_1_3");
		
		String TOdate = dodobgodina+dodobmesec+dodobden;

		String nacionalnost = req.getParameter("nacionalnost");
		String vidnappop = req.getParameter("vidnappop");
		
		String stepen = req.getParameter("stepennapoprecenosthidden");
		
		StringTokenizer stepenTokenizer = new StringTokenizer(stepen,",");
		List stepenList1 = new ArrayList();
		while (stepenTokenizer.hasMoreElements()) {
			String st = (String) stepenTokenizer.nextElement();
			stepenList1.add(st);
		}

		String username = (String) req.getSession().getAttribute("username");

		if(!("admin".equals(username)))
			log.info( "report called " +username+ " pol[" + pol  + "] from[" +  FROMdate + "] todate[" + TOdate + "] nacinalnost["+ nacionalnost+ "] vidnapop[" +  vidnappop+ "] stepen[" + stepen+ "]");
		Entity e = new Entity("Patient");
		
		e.setProperty("FROMden", oddobden);
		e.setProperty("FROMmesec", oddobmesec);
		e.setProperty("FROMgodina", oddobgodina);
		e.setProperty("TOden", dodobden);
		e.setProperty("TOmesec", dodobmesec);
		e.setProperty("TOgodina", dodobgodina);
		e.setProperty("nacionalnost", nacionalnost);
		e.setProperty("vidnappop", vidnappop);
		e.setProperty("stepenNaPopList", stepenList1);
		e.setProperty("stepen", stepen);
		
		e.setProperty("pol", pol);
		
		
		req.setAttribute("ptr", e);
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		
		
		Query allptsquesry  = new Query("Patient");//.addSort("ime", SortDirection.ASCENDING);
		
		if(!("all".equals(pol))) allptsquesry.addFilter("pol",FilterOperator.EQUAL,pol.toLowerCase());
		if(!("all".equals(nacionalnost))) allptsquesry.addFilter("nacionalnost",FilterOperator.EQUAL,nacionalnost.toLowerCase());
		if(!("".equals(FROMdate))) allptsquesry.addFilter("dobdate",FilterOperator.GREATER_THAN_OR_EQUAL,FROMdate);
		if(!("".equals(TOdate))) allptsquesry.addFilter("dobdate",FilterOperator.LESS_THAN_OR_EQUAL,TOdate);
		if(!("all".equals(vidnappop))) allptsquesry.addFilter("vidnappop",FilterOperator.EQUAL,vidnappop);
		
		
		
		
		//Query getptbyid = new Query("Patient").addFilter("emb", FilterOperator.EQUAL, emb);
		
		
		
		List<Entity> allpts = (List<Entity>) datastore.prepare(allptsquesry).asList(FetchOptions.Builder.withLimit(5000));
		
		List<Entity> returnList = new ArrayList<>();
		
		
		
//		System.out.println(stepen);
		
		if(!(stepen.equals(""))){
			for (Iterator iterator = allpts.iterator(); iterator.hasNext();) {
				Entity entity = (Entity) iterator.next();
				boolean stepenmatched = false;
				
				if("".equals(stepen))
					stepenmatched = true;
				stepenTokenizer = new StringTokenizer(stepen,",");
				while (stepenTokenizer.hasMoreElements()) {
					String st = (String) stepenTokenizer.nextElement();
					if("all".equals(st)){
						stepenmatched = true;
						break;
					}else{
						List stepenList = (List) entity.getProperty("stepenNaPopList");
						if(null!= stepenList){
							if(stepenList.contains(st)){
								stepenmatched = true;
								break;
							}
						}
						
					}
					
				}
				
				
				if(stepenmatched)
					returnList.add(entity);
				
			}
		}else{
			returnList = allpts;
			
		}
		
		
		req.setAttribute("allpts", returnList);
		
	
		RequestDispatcher d = getServletContext().getRequestDispatcher("/preports.jsp");
		 d.forward(req, resp);
		
		
		
	}
	
}


