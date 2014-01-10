package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.Query;

@SuppressWarnings("serial")
public class Deleteall extends HttpServlet {

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		delete all
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		

		Query getpatient = new Query("Patient");
		List<Entity> allPs = datastore.prepare(getpatient).asList(FetchOptions.Builder.withLimit(100000));
//		System.out.println(allPs.size());
	
		List<Key> listKeys = new ArrayList<>();
		for (Iterator iterator = allPs.iterator(); iterator.hasNext();) {
			Entity entity = (Entity) iterator.next();
			
			
//			System.out.println("deleted " + entity.getKey());;
			listKeys.add(entity.getKey());
			
		}
		datastore.delete(listKeys);
		
		
		
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		
	}
	
}


