package com.kbbitoladmh.pm.admin;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class AdminHelper {
	
	public static void main(String[] args) {
		
		createUser();
		
		
		
	}
	
	public static void createUser(){
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		
		Entity user = new Entity("Users","admin");

		user.setProperty("username", "admin");
		user.setProperty("password", "adminp");
		
		
		datastore.put(user);

		
	}

}
