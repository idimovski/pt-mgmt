package com.kbbitoladmh.pm;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
public class PatientManagementServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html");
		resp.getWriter().println("<html><body><h1>Bubi go sakame najmbogu na svet !!!!!!! <3 <3 <3 <3 <3</h1>"
				+ "<p> <img src='/Patient Management/bilobil.jpg'/></body></html>");
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		/*Entity patient = new Entity("Patient");
		patient.setProperty("FirstName", "Ivanco");
		patient.setProperty("LastName", "Dimovski");
		patient.setProperty("EMB", "0211985410020");
		patient.setProperty("Address", "Ivanco");
		
		datastore.put(patient);
		
		Key k  = patient.getKey();
		System.out.println(k.getId());*/
		
		
		
	}
}
