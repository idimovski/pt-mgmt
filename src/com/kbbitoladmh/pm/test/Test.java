package com.kbbitoladmh.pm.test;

public class Test {
	
	public static void main(String[] args) {
		
		String term = "ал";
		
		String db = "НИВО НА АЛКОХОЛ ВО КРВТА ОД 20-39 МГ/100 МЛ";
		
		
		if(db.toUpperCase().contains(term.toUpperCase())){
			System.out.println("sodrzi");
			
		}else{
			System.out.println("nesodrzi");
			
		}
		
	}

}
