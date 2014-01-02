package com.kbbitoladmh.pm.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.StringTokenizer;

public class Test {
	
	public static void main(String[] args) {
		
	
		
		
	try {
			
			
//			FileReader fr = new FileReader("files/ICD10.csv");
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("C:/Development/JAVA/PatientManagement/WS/PatientManagement/war/files/ICD10toupdate_3.csv"), "UTF8"));
			String stringRead = br.readLine();
			
			PrintWriter writer = new PrintWriter("C:/Development/JAVA/PatientManagement/WS/PatientManagement/war/files/ICD10toupdate_updated.csv", "UTF-8");
			
			
			
			long j = 0;
			
			while (stringRead != null) {
				
				j++;
				
				StringTokenizer st = new StringTokenizer(stringRead, ",");
				String code = "";
				String subcode = "";
				String desc = ""; String desc1 = ""; String desc2 = ""; String desc3 = "";
				
				if(st.hasMoreTokens()) code = st.nextToken().trim().replaceAll("\"", "");
				if(st.hasMoreTokens()) subcode = st.nextToken().trim().replaceAll("\"", "");
				if(st.hasMoreTokens()) desc = st.nextToken().trim().replaceAll("\"", "");
				if(st.hasMoreTokens()) desc1 = st.nextToken().trim().replaceAll("\"", "");
				if(st.hasMoreTokens()) desc2 = st.nextToken().trim().replaceAll("\"", "");
				if(st.hasMoreTokens()) desc3 = st.nextToken().trim().replaceAll("\"", "");
		
				
				String del=  "%|";
				
				writer.println(j + del + code + del + subcode + del + desc +" "+ desc1 +" "+ desc2 + " " + desc3);
				

					
				
				// read the next line
				stringRead = br.readLine();
			}
			br.close();
			
			writer.close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		
	}

}
