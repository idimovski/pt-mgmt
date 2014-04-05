package com.kbbitoladmh.pm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Text;

@SuppressWarnings("serial")
public class GetCSVReport_cvs extends HttpServlet {
private static final Logger log = Logger.getLogger(GetCSVReport_cvs.class.getName());

	
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
				
				 
				
				List<Entity> returnList = 	(List<Entity>) req.getSession().getAttribute("reportResults");
				boolean isFirstRow = true;
				
				StringBuffer sb = new StringBuffer();
				for (Iterator iterator = returnList.iterator(); iterator.hasNext();) {
					
					
					Entity e = (Entity) iterator.next();
					
					
					String fname = (String) e.getProperty("ime"); if (null == fname) fname = "";
					String last = (String) e.getProperty("prezime"); if (null == last) last = "";
					String pol = (String) e.getProperty("pol"); if (null == pol) pol = "";

					String redenbr = (String) e.getProperty("redenbr"); if (null == redenbr) redenbr = "";


					String dobden = (String) e.getProperty("dobden"); if (null == dobden) dobden = "";
					String dobmesec = (String) e.getProperty("dobmesec"); if (null == dobmesec) dobmesec = "";
					String dobgodina = (String) e.getProperty("dobgodina"); if (null == dobgodina) dobgodina = "";
					
					String dob = dobden + "/" + dobmesec + "/" +dobgodina;
					
					String mesto = (String) e.getProperty("mesto"); if (null == mesto) mesto = "";
					String emb = (String) e.getProperty("emb"); if (null == emb) emb = "";
					String nacionalnost = (String) e.getProperty("nacionalnost"); if (null == nacionalnost) nacionalnost = "";
					String druganacionalnost = (String) e.getProperty("druganacionalnost"); if (null == druganacionalnost) druganacionalnost = "";
					
					String pacientulica = (String) e.getProperty("pacientulica"); if (null == pacientulica) pacientulica = "";
					String pacientgrad = (String) e.getProperty("pacientgrad"); if (null == pacientgrad) pacientgrad = "";
					String pacientopshtina = (String) e.getProperty("pacientopshtina"); if (null == pacientopshtina) pacientopshtina = "";
					String pacientkod = (String) e.getProperty("pacientkod"); if (null == pacientkod) pacientkod = "";
					String pacientdrzava = (String) e.getProperty("pacientdrzava"); if (null == pacientdrzava) pacientdrzava = "";

					String imenatatkoto = (String) e.getProperty("imenatatkoto"); if (null == imenatatkoto) imenatatkoto = "";
					String imenamajkata = (String) e.getProperty("imenamajkata"); if (null == imenamajkata) imenamajkata = "";
					String mominskamajka = (String) e.getProperty("mominskamajka"); if (null == mominskamajka) mominskamajka = "";

					String roditelulica = (String) e.getProperty("roditelulica"); if (null == roditelulica) roditelulica = "";
					String roditelgrad = (String) e.getProperty("roditelgrad"); if (null == roditelgrad) roditelgrad = "";
					String roditelopshtina = (String) e.getProperty("roditelopshtina"); if (null == roditelopshtina) roditelopshtina = "";
					String roditelkod = (String) e.getProperty("roditelkod"); if (null == roditelkod) roditelkod = "";
					String roditeldrzava = (String) e.getProperty("roditeldrzava"); if (null == roditeldrzava) roditeldrzava = "";
					
					String baodbroj = (String) e.getProperty("baodbroj"); if (null == baodbroj) baodbroj = "";

					String naodden = (String) e.getProperty("naodden"); if (null == naodden) naodden = "";
					String naodmesec = (String) e.getProperty("naodmesec"); if (null == naodmesec) naodmesec = "";
					String naodgodina = (String) e.getProperty("naodgodina"); if (null == naodgodina) naodgodina = "";
					
					String naoddate = naodden+"/"+naodmesec + "/" + naodgodina;
					
					String vidnappop = (String) e.getProperty("vidnappop"); if (null == vidnappop) vidnappop = "";

					String kombiniranVid = (String) e.getProperty("kombiniranVid"); if (null == kombiniranVid) kombiniranVid = "";
					String stepenNaPop = (String) e.getProperty("stepenNaPop"); if (null == stepenNaPop) stepenNaPop = "";

					String drugidijagnoziT =""; if(null != e.getProperty("drugidijagnozi"))	drugidijagnoziT = ((Text) e.getProperty("drugidijagnozi")).getValue(); 	

					String merki = "";  if(null!=e.getProperty("merki")) merki = ((Text) e.getProperty("merki")).getValue(); 
					String podatocizamerki = ""; if(null!=e.getProperty("podatocizamerki")) podatocizamerki = ((Text) e.getProperty("podatocizamerki")).getValue();
					String promeni =""; if(null != e.getProperty("promeni")) promeni = ((Text) e.getProperty("promeni")).getValue(); 
					
					String zabeleshki = ""; if (null != zabeleshki) zabeleshki= ((Text) e.getProperty("zabeleshki")).getValue(); 
					
					
					
					if(isFirstRow){
						sb.append("redenbr" +
								","+"fname"  +
								","+"last"  +
								","+"pol"  +
								","+"dob" +
								","+"nacionalnost" +
								","+"druganacionalnost" +
								","+"imenatatkoto" +
								","+"imenamajkata"+
								","+"mominskamajka"+
								","+"baodbroj"+
								","+"naoddate"+
								"\n");
						
						isFirstRow = false;
					}
					
					
					sb.append(redenbr +
							","+fname  +
							","+last  +
							","+pol  +
							","+dob +
							","+nacionalnost +
							","+druganacionalnost +
							","+imenatatkoto +
							","+imenamajkata+
							","+mominskamajka+
							","+baodbroj+
							","+naoddate+
//							","+drugidijagnoziT+
//							","+merki+
//							","+podatocizamerki+
//							","+promeni+
//							","+zabeleshki+
							"\n");
					
					
				}
				
				
//				System.out.println(sb.toString());
				
				resp.setCharacterEncoding("UTF-8");
				
				resp.setContentType("application/vnd.ms-excel;charset=UTF-8");
				resp.setHeader("Content-Disposition", "attachment; filename=report.csv");
				
				resp.setContentLength(sb.toString().length());
				ServletOutputStream out = resp.getOutputStream();
				out.write(sb.toString().getBytes("UTF-8"));
				
				
				
			}
		}
		
		
		
		
	}
	
	
}




