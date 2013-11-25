package com.kbbitoladmh.pm.search.icd10;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kbbitoladmh.pm.model.ICD10;

public class SearchICD extends HttpServlet {
	

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//added a comment

		String retStr= "";
		System.out.println("termP : " + req.getParameter("term"));
		String term ="";
		if (null != req.getParameter("term")){
			term = req.getParameter("term");
		}
		
		if (!(term.equalsIgnoreCase(""))){
		
		List<ICD10> datalist = new ArrayList<ICD10>();
		int j = 0;
		try {
			
			
//			FileReader fr = new FileReader("files/ICD10.csv");
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("files/ICD10.csv"), "UTF8"));
			String stringRead = br.readLine();

			
			while (stringRead != null) {
				j++;
				
				StringTokenizer st = new StringTokenizer(stringRead, ",");
				String code = "";
				String subcode = "";
				String desc = "";
				
				if(st.hasMoreTokens()) code = st.nextToken().trim().replaceAll("\"", "");
				if(st.hasMoreTokens()) subcode = st.nextToken().trim().replaceAll("\"", "");
				if(st.hasMoreTokens()) desc = st.nextToken().trim().replaceAll("\"", "");
		
				
				boolean matchfound = false;
				
				String wholeLine = code.toLowerCase() + " " + subcode.toLowerCase() +" " + desc.toLowerCase();
			
				
				if(code.toLowerCase().startsWith((term.toLowerCase())))
					matchfound = true;
				
				if(subcode.toLowerCase().startsWith((term.toLowerCase())))
					matchfound = true;	
				
				if(desc.toLowerCase().contains((term.toLowerCase())))
					matchfound = true;
				
				
				if(wholeLine.contains((term.toLowerCase())))
					matchfound = true;
				
				if(matchfound)
					datalist.add(new ICD10(code, subcode, desc));
				
				
					
				if(datalist.size()>=100){
					System.out.println("found 100 will break");
					break;
				}
					
				
				// read the next line
				stringRead = br.readLine();
			}
			br.close();
		} catch (Exception e) {
			System.out.println("error on row:" + j);
			e.printStackTrace();
		}
		
		retStr = "[";
		
//		[
//		    { label: 'C++', value: 'C++' }, 
//		    { label: 'Java', value: 'Java' }
//		    { label: 'COBOL', value: 'COBOL' }
//		]
		
		  
		int max = datalist.size();
		if (max > 100)
			max =100;
		
		System.out.println(max);
		
		for (int i = 0; i < max; i++) {
			ICD10 icd = datalist.get(i);
			icd.setDesc(icd.getDesc().replaceAll("\"", "").trim());
			retStr +=  "{\"id\":\""+ icd.getCode()+ "-" +icd.getSubCode() +"\", \"value\": \"" + icd.getCode() + " " + icd.getSubCode()+ " " + icd.getDesc() +"\"}";
			if(i+1 < max)
				retStr+=",";
			
		}
		retStr += "]";
		System.out.println(retStr);
		
		
		}
		

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain; charset=utf-8");
		
		PrintWriter pw =  resp.getWriter();
		pw.print(retStr);
		

	}

}
