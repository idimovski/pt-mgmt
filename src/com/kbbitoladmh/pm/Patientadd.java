package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
import com.google.appengine.api.datastore.Text;
import com.google.appengine.api.datastore.Transaction;
import com.kbbitoladmh.pm.util.MessageHelper;

@SuppressWarnings("serial")
public class Patientadd extends HttpServlet {
	private static final Logger log = Logger.getLogger(Patientadd.class.getName());

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		req.getSession().removeAttribute("userin");
		
		
//		req.getSession().setAttribute("msg", "Please Log in");
		
		if(null == req.getSession().getAttribute("userin")){
			resp.sendRedirect("login.jsp");
//			System.out.println("Redirected to login");
		}else{
			if(!(req.getSession().getAttribute("userin").equals(true))){
				resp.sendRedirect("login.jsp");
//				System.out.println("Redirected to login");
			}else{
				
				 RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
				 d.forward(req, resp);
				
			}
		}
		
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("do post called");
		MessageHelper mh = new MessageHelper();
		boolean allRequiredPassed = true;
		
		String redenbr = req.getParameter("redenbr");
		String first = req.getParameter("ime");
		String last = req.getParameter("prezime");
		String pol = req.getParameter("pol");
		
		String dobden = req.getParameter("dob_1_1");
		String dobmesec = req.getParameter("dob_1_2");
		String dobgodina = req.getParameter("dob_1_3");
		
		String mesto = req.getParameter("mesto");
		String emb = req.getParameter("emb");
		String nacionalnost = req.getParameter("nacionalnost");
		String druganacionalnost= req.getParameter("druganacionalnost");
		
		String pacientulica= req.getParameter("pacientulica");
		String pacientgrad= req.getParameter("pacientgrad");
		String pacientopshtina= req.getParameter("pacientopshtina");
		String pacientkod= req.getParameter("pacientkod");
		String pacientdrzava= req.getParameter("pacientdrzava");
	
		String imenatatkoto= req.getParameter("imenatatkoto");
		String imenamajkata= req.getParameter("imenamajkata");
		String mominskamajka= req.getParameter("mominskamajka");
		
		String roditelulica= req.getParameter("roditelulica");
		String roditelgrad= req.getParameter("roditelgrad");
		String roditelopshtina= req.getParameter("roditelopshtina");
		String roditelkod= req.getParameter("roditelkod");
		String roditeldrzava= req.getParameter("roditeldrzava");
		
		String baodbroj = req.getParameter("baodbroj");
		
		String naodden = req.getParameter("naod_1_1");
		String naodmesec = req.getParameter("naod_1_2");
		String naodgodina = req.getParameter("naod_1_3");
		
		String vidnappop = req.getParameter("vidnappop");


		Text dijagnozi = new Text(req.getParameter("dijagnozDescihidden"));
//		System.out.println(dijagnozi.getValue());
		
		String kombiniranvid = req.getParameter("kombiniraniprechkihidden");
		String stepennapop = req.getParameter("stepennapoprecenosthidden");
		
		
		
		Text merki = new Text(req.getParameter("merki"));
		Text podatocizamerki = new Text(req.getParameter("podatocizamerki"));
		Text promeni = new Text(req.getParameter("promeni"));
		Text zabeleshki = new Text(req.getParameter("zabeleshki"));

		String username = (String) req.getSession().getAttribute("username");
		
		log.info( "add/edit called  "+ username +" redenbr[" + redenbr  + "]");

		
		try{
		
			Entity patient = createPatientEntity(first, last, pol, dobden, dobmesec, dobgodina, mesto, emb, nacionalnost, druganacionalnost, 
					pacientulica, pacientgrad, pacientopshtina, pacientkod, pacientdrzava, imenatatkoto, imenamajkata, mominskamajka, roditelulica, roditelgrad, roditelopshtina, 
					roditelkod, roditeldrzava, baodbroj, naodden, naodmesec, naodgodina, vidnappop, dijagnozi, merki, podatocizamerki, zabeleshki, redenbr,promeni, kombiniranvid, stepennapop, username);
				
			
			req.setAttribute("pte", patient);
			
			if(redenbr.length()==0){
				mh.addErrorMessage(req, "Потребен е Реден Број ! ");allRequiredPassed = false;
			}
			if(last.length()==0){
				mh.addErrorMessage(req, "Потребно е Име ! ");allRequiredPassed = false;
			}
			if(first.length()==0){
				mh.addErrorMessage(req, "Потребно е Презиме ! ");allRequiredPassed = false;
			}
				
			
			 if(allRequiredPassed == false){
				 RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
				 d.forward(req, resp);
			   return;   
			 }		
			 
		
			
			
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			
			Transaction tr = datastore.beginTransaction();
			
			datastore.put(tr,patient);
			
			tr.commit();
			
			
			
			mh.addGooDMessage(req, "Пациентот со реден број "+redenbr+" беше успешно зачуван !");allRequiredPassed = false;
//			throw new Exception();
		 }catch(Exception e){
			 mh.addErrorMessage(req, "Грешка при зачувување на пациентот !");allRequiredPassed = false;
		 }
	
		 

		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
		 
		 d.forward(req, resp);
		
		
		
	}


	private Entity createPatientEntity(String first, String last, String pol, String dobden, String dobmesec, String dobgodina, String mesto, String emb, String nacionalnost, String druganacionalnost, 
			String pacientulica, String pacientgrad, String pacientopshtina, String pacientkod, String pacientdrzava, String imenatatkoto, String imenamajkata, String mominskamajka, String roditelulica, 
			String roditelgrad, String roditelopshtina, String roditelkod, String roditeldrzava, String baodbroj, String naodden, String naodmesec, String naodgodina, String vidnappop, Text dijagnozi, 
			Text merki, Text podatocizamerki, Text zabeleshki, String redenbr, Text promeni, String kombiniranVid, String stepenNaPop, String username) {
		
		Entity patient = null;
		if ("".equals(redenbr)){
			patient = new Entity("Patient");
		}else{
			patient = new Entity("Patient",redenbr);
		}
		
		patient.setProperty("redenbr", redenbr);
		patient.setProperty("ime", first.trim());
		patient.setProperty("imeCL", first.trim().toLowerCase());
		patient.setProperty("prezime", last.trim());
		patient.setProperty("prezimeCL", last.trim().toLowerCase());
		patient.setProperty("pol", pol);
		
		patient.setProperty("dobden", dobden);
		patient.setProperty("dobmesec", dobmesec);
		patient.setProperty("dobgodina", dobgodina);
		
		if((null!=dobgodina) && (null!=dobmesec) && (null!=dobden) )
			patient.setProperty("dobdate", dobgodina+dobmesec+dobden);
		

		patient.setProperty("mesto", mesto.trim());
		patient.setProperty("emb", emb.trim());
		patient.setProperty("nacionalnost", nacionalnost);
		patient.setProperty("druganacionalnost", druganacionalnost);
		
		patient.setProperty("pacientulica", pacientulica.trim());
		patient.setProperty("pacientgrad", pacientgrad.trim());
		patient.setProperty("pacientopshtina", pacientopshtina.trim());
		patient.setProperty("pacientkod", pacientkod.trim());
		patient.setProperty("pacientdrzava", pacientdrzava);
		
		patient.setProperty("imenatatkoto", imenatatkoto.trim());
		patient.setProperty("imenamajkata", imenamajkata.trim());
		patient.setProperty("mominskamajka", mominskamajka.trim());
		
		patient.setProperty("roditelulica", roditelulica.trim());
		patient.setProperty("roditelgrad", roditelgrad.trim());
		patient.setProperty("roditelopshtina", roditelopshtina.trim());
		patient.setProperty("roditelkod", roditelkod.trim());
		patient.setProperty("roditeldrzava", roditeldrzava);
		
		patient.setProperty("baodbroj", baodbroj.trim());
		patient.setProperty("naodden", naodden);
		patient.setProperty("naodmesec", naodmesec);
		patient.setProperty("naodgodina", naodgodina);
		
		if((null!=naodden) && (null!=naodmesec) && (null!=naodgodina) )
			patient.setProperty("naoddate", naodgodina+naodmesec+naodden);
		
		patient.setProperty("vidnappop", vidnappop);
		patient.setProperty("kombiniranVid", kombiniranVid);
		
		List<String> kombvidtoklist = new ArrayList();
		StringTokenizer kombvidtok = new StringTokenizer(kombiniranVid,",");
		while (kombvidtok.hasMoreElements()) {
			String object = (String) kombvidtok.nextElement();
			kombvidtoklist.add(object);
		}
		patient.setProperty("kombiniranVidList", kombvidtoklist);
		
		patient.setProperty("stepenNaPop", stepenNaPop);
		List<String> stepenlist = new ArrayList();
		StringTokenizer stepentok = new StringTokenizer(stepenNaPop,",");
		while (stepentok.hasMoreElements()) {
			String object = (String) stepentok.nextElement();
			stepenlist.add(object);
		}
		patient.setProperty("stepenNaPopList", stepenlist);
		
		
		List<String> dijagnoziHash = new ArrayList();
		List  listdijagnozi = new ArrayList<>();
		
		StringTokenizer dijagnoziTok  = new StringTokenizer(dijagnozi.getValue(), "%%");  
		
		while (dijagnoziTok.hasMoreElements()) {
			StringTokenizer secodntok = new StringTokenizer((String)dijagnoziTok.nextElement(), "||");
			
			String id = (String) secodntok.nextElement();
			String desc = (String) secodntok.nextElement();
			listdijagnozi.add(id);
			
			dijagnoziHash.add(id + "%%" + desc);
			
		}
		
		patient.setProperty("dijagnozi", dijagnozi);
		patient.setProperty("dijagnoziIdList", listdijagnozi);
		patient.setProperty("dijagnoziHash", dijagnoziHash);
		patient.setProperty("merki", merki);
		patient.setProperty("podatocizamerki", podatocizamerki);
		patient.setProperty("promeni", promeni);
		patient.setProperty("zabeleshki", zabeleshki);
		patient.setProperty("lastupdatedby", username);
		patient.setProperty("lastupdateon", new Date());
		
		
		return patient;
		
	}
	
}


