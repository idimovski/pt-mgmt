package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		req.getSession().removeAttribute("userin");
		
		
//		req.getSession().setAttribute("msg", "Please Log in");
		
		if(null == req.getSession().getAttribute("userin")){
			resp.sendRedirect("login.jsp");
			System.out.println("Redirected to login");
		}else{
			if(!(req.getSession().getAttribute("userin").equals(true))){
				resp.sendRedirect("login.jsp");
				System.out.println("Redirected to login");
			}else{
				
				 RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
				 d.forward(req, resp);
				
			}
		}
		
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("do post called");
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
		System.out.println(dijagnozi.getValue());
		
		String kombiniranvid = req.getParameter("kombiniraniprechkihidden");
		String stepennapop = req.getParameter("stepennapoprecenosthidden");
		
		
		
		String merki = req.getParameter("merki");
		String podatocizamerki = req.getParameter("podatocizamerki");
		String promeni = req.getParameter("promeni");
		String zabeleshki = req.getParameter("zabeleshki");

		
		Entity patient = createPatientEntity(first, last, pol, dobden, dobmesec, dobgodina, mesto, emb, nacionalnost, druganacionalnost, 
				pacientulica, pacientgrad, pacientopshtina, pacientkod, pacientdrzava, imenatatkoto, imenamajkata, mominskamajka, roditelulica, roditelgrad, roditelopshtina, 
				roditelkod, roditeldrzava, baodbroj, naodden, naodmesec, naodgodina, vidnappop, dijagnozi, merki, podatocizamerki, zabeleshki, redenbr,promeni, kombiniranvid, stepennapop);
			
		
		req.setAttribute("pte", patient);

		
		if(emb.length()==0){
			mh.addMessage(req, "emb is required");allRequiredPassed = false;
		}
		if(last.length()==0){
			mh.addMessage(req, "firstname is required");allRequiredPassed = false;
		}
		if(first.length()==0){
			mh.addMessage(req, "lastname is required");allRequiredPassed = false;
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
		
//		add all
		
//		List<Entity> l = new ArrayList<>();
//		for (int i = 1; i < 100000; i++) {
//			Entity patient1 = new Entity("Patient", i);
//			patient.setProperty("first", first);
//			patient.setProperty("last", last);
//			patient.setProperty("emb", emb);
//			patient.setProperty("ptaddress1", ptaddress1);
//			patient.setProperty("naod", naod);
//			l.add(patient1);
//			
//		}
//		System.out.println("put start");
//		datastore.put(l);
//		System.out.println("put end");
		
		
		
//		delete all
//		Query getpatient = new Query("Patient");
//		List<Entity> allPs = datastore.prepare(getpatient).asList(FetchOptions.Builder.withLimit(100000));
//		System.out.println(allPs.size());
//	
//		List<Key> listKeys = new ArrayList<>();
//		for (Iterator iterator = allPs.iterator(); iterator.hasNext();) {
//			Entity entity = (Entity) iterator.next();
//			
//			
//			System.out.println("deleted " + entity.getKey());;
//			listKeys.add(entity.getKey());
//			
//		}
//		datastore.delete(listKeys);
//		datastore.getCurrentTransaction().commit();
		
		
		//req.getSession().setAttribute("msg", "Pt stored successfuly with key" + patient.getKey());

		
		RequestDispatcher d = getServletContext().getRequestDispatcher("/padd.jsp");
		 
		 d.forward(req, resp);
		
		
		
	}


	private Entity createPatientEntity(String first, String last, String pol, String dobden, String dobmesec, String dobgodina, String mesto, String emb, String nacionalnost, String druganacionalnost, 
			String pacientulica, String pacientgrad, String pacientopshtina, String pacientkod, String pacientdrzava, String imenatatkoto, String imenamajkata, String mominskamajka, String roditelulica, 
			String roditelgrad, String roditelopshtina, String roditelkod, String roditeldrzava, String baodbroj, String naodden, String naodmesec, String naodgodina, String vidnappop, Text dijagnozi, 
			String merki, String podatocizamerki, String zabeleshki, String redenbr, String promeni, String kombiniranVid, String stepenNaPop) {
		
		Entity patient = new Entity("Patient",emb);
		
		patient.setProperty("redenbr", redenbr);
		patient.setProperty("ime", first);
		patient.setProperty("imeCL", first.toLowerCase());
		patient.setProperty("prezime", last);
		patient.setProperty("prezimeCL", last.toLowerCase());
		patient.setProperty("pol", pol);
		
		patient.setProperty("dobden", dobden);
		patient.setProperty("dobmesec", dobmesec);
		patient.setProperty("dobgodina", dobgodina);
		
		if((null!=dobgodina) && (null!=dobmesec) && (null!=dobden) )
			patient.setProperty("dobdate", dobgodina+dobmesec+dobden);
		

		patient.setProperty("mesto", mesto);
		patient.setProperty("emb", emb);
		patient.setProperty("nacionalnost", nacionalnost);
		patient.setProperty("druganacionalnost", druganacionalnost);
		
		patient.setProperty("pacientulica", pacientulica);
		patient.setProperty("pacientgrad", pacientgrad);
		patient.setProperty("pacientopshtina", pacientopshtina);
		patient.setProperty("pacientkod", pacientkod);
		patient.setProperty("pacientdrzava", pacientdrzava);
		
		patient.setProperty("imenatatkoto", imenatatkoto);
		patient.setProperty("imenamajkata", imenamajkata);
		patient.setProperty("mominskamajka", mominskamajka);
		
		patient.setProperty("roditelulica", roditelulica);
		patient.setProperty("roditelgrad", roditelgrad);
		patient.setProperty("roditelopshtina", roditelopshtina);
		patient.setProperty("roditelkod", roditelkod);
		patient.setProperty("roditeldrzava", roditeldrzava);
		
		patient.setProperty("baodbroj", baodbroj);
		patient.setProperty("naodden", naodden);
		patient.setProperty("naodmesec", naodmesec);
		patient.setProperty("naodgodina", naodgodina);
		
		if((null!=naodden) && (null!=naodmesec) && (null!=naodgodina) )
			patient.setProperty("naoddate", naodgodina+naodmesec+naodden);
		
		patient.setProperty("vidnappop", vidnappop);
		patient.setProperty("kombiniranVid", kombiniranVid);
		
		patient.setProperty("stepenNaPop", stepenNaPop);
		
		
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
		
		
		return patient;
		
	}
	
}


