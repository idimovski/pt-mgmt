<%@page import="java.util.TimeZone"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.Text"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Нов Пациент</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/view.css" media="all">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.css" />
<script type="text/javascript" src="JS/view.js"></script>
<script type="text/javascript" src="JS/calendar.js"></script>

<script type="text/javascript" src="JS/myjs.js"></script>

<script src="JS/jquery-1.10.2.min.js"></script>
<script src="JS/jquery-ui.js"></script>

<style type="text/css">
.ui-autocomplete-input{
width:80%;
}
.ui-autocomplete {
z-index: 100;
max-height: 300px;
max-width: 750px;
overflow-y: auto;
 /* prevent horizontal scrollbar */
overflow-x: auto;

}
.ui-autocomplete-loading {
 background: white url('images/ui-anim_basic_16x16.gif') right center no-repeat;
}

</style>

<script>

</script>
			
</head>
<%
//Security :)
if(null == session.getAttribute("userin")){
	response.sendRedirect("login.jsp");
	//System.out.println("Redirected to login");
}else{
	if(!(session.getAttribute("userin").equals(true))){
		response.sendRedirect("login.jsp");
		//System.out.println("Redirected to login");
	}
}
%>
<%
//INIT

//get entity

Entity e = (Entity) request.getAttribute("pte");
String redenbr= "";String fname = ""; String last  = ""; String pol = "";String dobden = "";String dobmesec = "";String dobgodina = "";

String mesto = "";String emb = "";String nacionalnost = "";String druganacionalnost= "";

String pacientulica= "";String pacientgrad= "";String pacientopshtina= "";String pacientkod= "";String pacientdrzava= "";

String imenatatkoto= "";String imenamajkata= "";String mominskamajka= "";

String roditelulica= "";String roditelgrad= "";String roditelopshtina= "";String roditelkod= "";String roditeldrzava= "";

String baodbroj = "";

String naodden = "";String naodmesec = "";String naodgodina = "";

String vidnappop = ""; String kombiniranVid = ""; String stepenNaPop = "";


String dijagnozi = "";
List dijagnoziHash = new ArrayList();
List dijagnoziIdList = new ArrayList();

String lastupdate = "";

String drugidijagnozi = "";



String merki = "";String podatocizamerki = "";String promeni = "";String zabeleshki = "";
StringTokenizer tokdijagnozi = new StringTokenizer("");
StringTokenizer tokkombiniranVid = new StringTokenizer("");
StringTokenizer tokstepenNaPop = new StringTokenizer("");
ArrayList kombiniranVidList = new ArrayList();
ArrayList stepenNaPopList = new ArrayList();

	if(null != e){
		fname = (String) e.getProperty("ime"); if (null == fname) fname = "";
		last = (String) e.getProperty("prezime"); if (null == last) last = "";
		pol = (String) e.getProperty("pol"); if (null == pol) pol = "";
		
		redenbr = (String) e.getProperty("redenbr"); if (null == redenbr) redenbr = "";
		
		
		dobden = (String) e.getProperty("dobden"); if (null == dobden) dobden = "";
		dobmesec = (String) e.getProperty("dobmesec"); if (null == dobmesec) dobmesec = "";
		dobgodina = (String) e.getProperty("dobgodina"); if (null == dobgodina) dobgodina = "";
		dobgodina = (String) e.getProperty("dobgodina"); if (null == dobgodina) dobgodina = "";
		mesto = (String) e.getProperty("mesto"); if (null == mesto) mesto = "";
		emb = (String) e.getProperty("emb"); if (null == emb) emb = "";
		nacionalnost = (String) e.getProperty("nacionalnost"); if (null == nacionalnost) nacionalnost = "";
		druganacionalnost = (String) e.getProperty("druganacionalnost"); if (null == druganacionalnost) druganacionalnost = "";
		pacientulica = (String) e.getProperty("pacientulica"); if (null == pacientulica) pacientulica = "";
		pacientgrad = (String) e.getProperty("pacientgrad"); if (null == pacientgrad) pacientgrad = "";
		pacientopshtina = (String) e.getProperty("pacientopshtina"); if (null == pacientopshtina) pacientopshtina = "";
		pacientkod = (String) e.getProperty("pacientkod"); if (null == pacientkod) pacientkod = "";
		pacientdrzava = (String) e.getProperty("pacientdrzava"); if (null == pacientdrzava) pacientdrzava = "";
		
		imenatatkoto = (String) e.getProperty("imenatatkoto"); if (null == imenatatkoto) imenatatkoto = "";
		imenamajkata = (String) e.getProperty("imenamajkata"); if (null == imenamajkata) imenamajkata = "";
		mominskamajka = (String) e.getProperty("mominskamajka"); if (null == mominskamajka) mominskamajka = "";
		
		roditelulica = (String) e.getProperty("roditelulica"); if (null == roditelulica) roditelulica = "";
		roditelgrad = (String) e.getProperty("roditelgrad"); if (null == roditelgrad) roditelgrad = "";
		roditelopshtina = (String) e.getProperty("roditelopshtina"); if (null == roditelopshtina) roditelopshtina = "";
		roditelkod = (String) e.getProperty("roditelkod"); if (null == roditelkod) roditelkod = "";
		roditeldrzava = (String) e.getProperty("roditeldrzava"); if (null == roditeldrzava) roditeldrzava = "";
		baodbroj = (String) e.getProperty("baodbroj"); if (null == baodbroj) baodbroj = "";
		
		naodden = (String) e.getProperty("naodden"); if (null == naodden) naodden = "";
		naodmesec = (String) e.getProperty("naodmesec"); if (null == naodmesec) naodmesec = "";
		naodgodina = (String) e.getProperty("naodgodina"); if (null == naodgodina) naodgodina = "";
		vidnappop = (String) e.getProperty("vidnappop"); if (null == vidnappop) vidnappop = "";
		
		kombiniranVid = (String) e.getProperty("kombiniranVid"); if (null == kombiniranVid) kombiniranVid = "";
		stepenNaPop = (String) e.getProperty("stepenNaPop"); if (null == stepenNaPop) stepenNaPop = "";
		
		dijagnozi = ((Text) e.getProperty("dijagnozi")).getValue(); if (null == dijagnozi) dijagnozi = "";
		
		Text drugidijagnoziT = ((Text) e.getProperty("drugidijagnozi")); if (null == drugidijagnozi) drugidijagnozi = "";	if (null != drugidijagnoziT) drugidijagnozi = drugidijagnoziT.getValue();

		merki = ((Text) e.getProperty("merki")).getValue(); if (null == merki) merki = "";
		podatocizamerki = ((Text) e.getProperty("podatocizamerki")).getValue(); if (null == podatocizamerki) podatocizamerki = "";
		promeni = ((Text) e.getProperty("promeni")).getValue(); if (null == promeni) promeni = "";
		zabeleshki = ((Text) e.getProperty("zabeleshki")).getValue(); if (null == zabeleshki) zabeleshki = "";
		
		try{
			lastupdate = (String) e.getProperty("lastupdatedby");
			SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy - HH:mm");
			sdf.setTimeZone(TimeZone.getTimeZone("GMT+1"));
			lastupdate = lastupdate + " - " + sdf.format(((Date) e.getProperty("lastupdateon")));
		}catch(Exception ex){
			lastupdate = "N/A";
		}
		
		if(null != e.getProperty("dijagnoziHash"))	dijagnoziHash = (List) e.getProperty("dijagnoziHash");
		if(null != e.getProperty("dijagnoziIdList"))	dijagnoziIdList = (List)  e.getProperty("dijagnoziIdList");
		
		
		
		
		
		tokdijagnozi = new StringTokenizer(dijagnozi, ",");
		
		tokkombiniranVid = new StringTokenizer(kombiniranVid, ",");
		
		while (tokkombiniranVid.hasMoreTokens())
			kombiniranVidList.add(tokkombiniranVid.nextToken());
		
		tokstepenNaPop = new StringTokenizer(stepenNaPop, ",");
		
		while (tokstepenNaPop.hasMoreTokens())
				stepenNaPopList.add(tokstepenNaPop.nextToken());
		
		
		
		
	}

	


%>
<body>

	<div class="main-out">
		<div class="main">
			<div class="">
				<div class="top">
					<jsp:include page="header.jsp" />

					<p>&nbsp;</p>


					
					<div id="form_container">
					<!-- <img id="top" src="images/top.png" alt=""> -->

						<form id="form_740480" class="appnitro" method="post" action="add">
							<div class="form_description">
								<h2>Пациент   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input id="saveForm" class="button_text"
									type="submit" name="submit" value="  Зачувај   " />	</h2>

							</div>
							<div style="display:none">
<div id="dialog-modal" title="Внимание !!!">
  <p id='dialogtext'>Пациентот со овој реден број веќе постои.</p></div></div>
							<ul>
							
								<li id="li_1"><label class="description" for="element_1">Реден Број</label>
									<div>
										<input id="redenbr" name="redenbr"
											class="element text small" type="text" maxlength="255"
											value='<%=redenbr%>' <%if(redenbr.length()>0){ %>disabled="disabled"<%} %>/>
										<input type="hidden" id="redenbr" name="redenbr"	value='<%=redenbr%>'/>
									</div>
									<p class="guidelines" id="guide_2">
										<small>Реден Број</small>
									</p>
								</li>

								
								<li id="li_2" >
									<label class="description" for="ime">Име и презиме </label>
									<span>
										<input id="ime" name= "ime" class="element text" maxlength="255" size="20" value='<%=fname%>'/>
										<label>Име</label>
									</span>
									<span>
										<input id="prezime" name= "prezime" class="element text" maxlength="255" size="20" value='<%=last%>'/>
										<label>Презиме</label>
									</span> 
									<p class="guidelines" id="guide_2">
										<small>Име</small>
									</p>
								</li>
								
								<li>
								<label class="description" for="pol">Пол</label>
								<select class="element select medium" id="pol" name="pol">
											<option value="m" <%if (pol.equals("m")) {%>selected="selected"<%} %>>Машки</option>
											<option value="z" <%if (pol.equals("z")) {%>selected="selected"<%} %>>Женски</option>
										</select> 
										
								</li>
							
								<li id="li_1" >
									<label class="description" for="dob_1">Датум на раѓање </label>
									<span>
										<input id="dob_1_1" name="dob_1_1" class="element text" size="2" maxlength="2" value="<%=dobden %>" type="text"> /
										<label for="dob_1_1">Ден</label>
									</span>
									<span>
										<input id="dob_1_2" name="dob_1_2" class="element text" size="2" maxlength="2" value="<%=dobmesec %>" type="text"> /
										<label for="dob_1_2">Месец</label>
									</span>
									<span>
								 		<input id="dob_1_3" name="dob_1_3" class="element text" size="4" maxlength="4" value="<%=dobgodina %>" type="text">
										<label for="dob_1_3">Година</label>
									</span>
								
									<span id="calendar_1">
										<img id="cal_img_1" class="datepicker" src="images/calendar.gif" alt="Pick a date.">	
									</span>
									<script type="text/javascript">
										Calendar.setup({
										inputField	 : "dob_1_3",
										baseField    : "dob_1",
										displayArea  : "calendar_1",
										button		 : "cal_img_1",
										ifFormat	 : "%B %e, %Y",
										onSelect	 : selectEuropeDate
										});
									</script>
									<p class="guidelines" id="guide_1"><small>Датум на раѓање </small></p> 
								</li>
								
								<li id="li_21"><label class="description" for="element_21">Место на раѓање</label>
									<div>
										<input id="mesto" name="mesto"
											class="element text medium" type="text" maxlength="255"
											value="<%=mesto %>" />
									</div>
									<p class="guidelines" id="guide_21">
										<small>Место на Раѓање</small>
									</p>
								</li>
									
								<li id="li_21"><label class="description" for="element_21">ЕМБГ</label>
									<div>
										<input id="emb" name="emb"
											class="element text medium" type="text" maxlength="255"
											value="<%=emb%>" />
									</div>
									<p class="guidelines" id="guide_21">
										<small>ЕМБГ</small>
									</p>
								</li>
								
								
								
								
								<li>
								<label class="description" for="nacionalnost">Националност</label>
								<select class="element select medium" id="nacionalnost"
											name="nacionalnost">
											<option value="m" <%if(nacionalnost.equals("m")){ %>selected="selected"<%} %> >Македонец/ка</option>
											<option value="a" <%if(nacionalnost.equals("a")){ %>selected="selected"<%} %>  >Албанец/ка</option>
											<option value="r" <%if(nacionalnost.equals("r")){ %>selected="selected"<%} %> >Ром/ка</option>
											<option value="t"  <%if(nacionalnost.equals("t")){ %>selected="selected"<%} %>>Турчин/ка</option>
											<option value="s" <%if(nacionalnost.equals("s")){ %>selected="selected"<%} %> >Србин/ка</option>
											<option value="v" <%if(nacionalnost.equals("v")){ %>selected="selected"<%} %> >Влав</option>
											<option value="e" <%if(nacionalnost.equals("e")){ %>selected="selected"<%} %> >Египјанин/ка</option>
											<option value="b" <%if(nacionalnost.equals("b")){ %>selected="selected"<%} %> >Бошњак</option>
											<option value="d" <%if(nacionalnost.equals("d")){ %>selected="selected"<%} %> >Друга</option>
											
											
										</select> 
										
								</li>
								
								
								<div id="druganacionalnostdiv">
									<li id="li_21"><label class="description" for="druganacionalnost">Друга Националност</label>
										<div>
											<input id="druganacionalnost" name="druganacionalnost"
												class="element text medium" type="text" maxlength="255"
												value="<%=druganacionalnost %>" />
										</div>
										<p class="guidelines" id="druganacionalnost">
											<small>Друга Националност</small>
										</p>
									</li>
								<li class="section_break"><h3></h3><p></p></li>
								</div>
								
								
								
								
								<li id="li_3"><label class="description" for="element_3">Адреса на пациентот</label>

									<div>
										<input id="pacientulica" name="pacientulica"
											class="element text large" value="<%=pacientulica %>" type="text"> <label
											for="element_3_1">Улица и број</label>
									</div>

									<div class="left">
										<input id="pacientgrad" name="pacientgrad"
											class="element text medium" value="<%=pacientgrad %>" type="text"> <label
											for="element_3_3">Град</label>
									</div>

									<div class="right">
										<input id="pacientopshtina" name="pacientopshtina"
											class="element text medium" value="<%=pacientopshtina %>" type="text"> <label
											for="element_3_4">Општина</label>
									</div>

									<div class="left">
										<input id="pacientkod" name="pacientkod"
											class="element text medium" maxlength="15" value="<%=pacientkod %>"
											type="text"> <label for="element_3_5">Поштенски Код</label>
									</div>

									<div class="right">
										<select class="element select medium" id="pacientdrzava"
											name="pacientdrzava">
											<option value="Macedonia" selected="selected">Македонија</option>
										</select> <label for="element_3_6">Држава</label>
									</div></li>
								<li class="section_break">
									<h3></h3>
									<p></p>
								</li>
								<li id="li_4"><label class="description" for="imenatatkoto">Име на таткото</label>
									<div>
										<input id="imenatatkoto" name="imenatatkoto"
											class="element text large" type="text" maxlength="255"
											value="<%=imenatatkoto %>" />
									</div></li>
								<li id="li_6"><label class="description" for="imenamajkata">Име на мајката</label>
									<div>
										<input id="imenamajkata" name="imenamajkata"
											class="element text large" type="text" maxlength="255"
											value="<%=imenamajkata %>" />
									</div>
								</li>
								<li id="li_6"><label class="description" for="mominskamajka">Моминско име на мајката</label>
									<div>
										<input id="mominskamajka" name="mominskamajka"
											class="element text large" type="text" maxlength="255"
											value="<%=mominskamajka %>" />
									</div>
								</li>
								<li id="li_7"><label class="description" for="roditelulica">Адреса на родителите</label>

									<div>
										<input id="roditelulica" name="roditelulica"
											class="element text large" value="<%=roditelulica %>" type="text"> <label
											for="element_7_1">Улица и број</label>
									</div>

									<div class="left">
										<input id="roditelgrad" name="roditelgrad"
											class="element text medium" value="<%=roditelgrad %>" type="text"> <label
											for="element_7_3">Град</label>
									</div>

									<div class="right">
										<input id="roditelopshtina" name="roditelopshtina"
											class="element text medium" value="<%=roditelopshtina %>" type="text"> <label
											for="element_7_4">Општина</label>
									</div>

									<div class="left">
										<input id="roditelkod" name="roditelkod"
											class="element text medium" maxlength="15" value="<%=roditelkod %>"
											type="text"> <label for="element_7_5">Поштенски Код</label>
									</div>

									<div class="right">
										<select class="element select medium" id="roditeldrzava"
											name="roditeldrzava">
											<option value="Macedonia" selected="selected">Македонија</option>

										</select> <label for="element_7_6">Држава</label>
									</div>
								<li class="section_break"/>
								
								<li id="li_21"><label class="description" for="baodbroj">Број на наодот со кој лицето е распоредено</label>
									<div>
										<input id="baodbroj" name="baodbroj"
											class="element text medium" type="text" maxlength="255"
											value="<%=baodbroj %>" />
									</div>
									<p class="guidelines" id="guide_21">
										<small>ЕМБГ</small>
									</p>
								</li>
								
								<li id="datumnanaodot" >
									<label class="description" for="datumnanaodot">Датум кога е издаден наодот</label>
									<span>
										<input id="naod_1_1" name="naod_1_1" class="element text" size="2" maxlength="2" value="<%=naodden%>" type="text"> /
										<label for="naod1">Ден</label>
									</span>
									<span>
										<input id="naod_1_2" name="naod_1_2" class="element text" size="2" maxlength="2" value="<%=naodmesec%>" type="text"> /
										<label for="naod2">Месец</label>
									</span>
									<span>
								 		<input id="naod_1_3" name="naod_1_3" class="element text" size="4" maxlength="4" value="<%=naodgodina %>" type="text">
										<label for="naod3">Година</label>
									</span>
								
									<span id="calendar_2">
										<img id="cal_img_2" class="datepicker" src="images/calendar.gif" alt="Pick a date.">	
									</span>
									<script type="text/javascript">
										Calendar.setup({
										inputField	 : "naod_1_3",
										baseField    : "naod_1",
										displayArea  : "calendar_2",
										button		 : "cal_img_2",
										ifFormat	 : "%B %e, %Y",
										onSelect	 : selectEuropeDate
										});
									</script>
									<p class="guidelines" id="guide_1"><small>Датум кога е издаден наодот</small></p> 
								</li>
								
								<li id="vidnappopli" >
									<label class="description" for="vidnappop">Вид на попреченост</label>
									<div>
									<select class="element select large" id="vidnappop" name="vidnappop"> 
									<option value="" <%if(vidnappop.equals("")){ %>selected="selected"<%} %>></option>
									<option value="1" <%if(vidnappop.equals("1")){ %>selected="selected"<%} %>>Пречки во психичкиот развој</option>
									<option value="2" <%if(vidnappop.equals("2")){ %>selected="selected"<%} %>>Пречки во физичкиот развој</option>
									<option value="3" <%if(vidnappop.equals("3")){ %>selected="selected"<%} %>>Хронично болно лице</option>
									<option value="4" <%if(vidnappop.equals("4")){ %>selected="selected"<%} %>>Пречки во видот</option>
									<option value="5" <%if(vidnappop.equals("5")){ %>selected="selected"<%} %>>Пречки во слухот</option>
									<option value="6" <%if(vidnappop.equals("6")){ %>selected="selected"<%} %>>Пречки во говорот, гласот и јазикот</option>
									<option value="7" <%if(vidnappop.equals("7")){ %>selected="selected"<%} %>>Аутизам</option>
									<option value="8" <%if(vidnappop.equals("8")){ %>selected="selected"<%} %>>Комбинирани пречки</option>
								
									</select>
									 
								</li>
								
								<!-- Show if vid na pop = 8  -->
								<!-- Show if vid na pop = 8  -->
											
								<div id='kombiniranvid'>								
								<li id="kombiniranvid" >
								<label class="description" for="element_7">Вид на комбинирана психофизичка попреченост </label>
								<span>
								<input id="vsnp_7_1" name="vsnp_7_1" class="element checkbox" type="checkbox" value="1" onchange="setKPValue(this,'vid')" <%if(kombiniranVidList.contains("1")){ %> checked <%}%> />
								<label class="choice" for="vsnp_7_1">Пречки во психичкиот развој</label>
								<input id="vsnp_7_2" name="vsnp_7_2" class="element checkbox" type="checkbox" value="2" onchange="setKPValue(this,'vid')" <%if(kombiniranVidList.contains("2")){ %> checked <%}%> />
								<label class="choice" for="vsnp_7_2">Пречки во физичкиот развој</label>
								<input id="vsnp_7_3" name="vsnp_7_3" class="element checkbox" type="checkbox" value="3" onchange="setKPValue(this,'vid')" <%if(kombiniranVidList.contains("3")){ %> checked <%}%> />
								<label class="choice" for="vsnp_7_3">Хронично болно лице</label>
								<input id="vsnp_7_4" name="vsnp_7_4" class="element checkbox" type="checkbox" value="4" onchange="setKPValue(this,'vid')" <%if(kombiniranVidList.contains("4")){ %> checked <%}%> />
								<label class="choice" for="vsnp_7_4">Пречки во видот</label>
								<input id="vsnp_7_5" name="vsnp_7_5" class="element checkbox" type="checkbox" value="5" onchange="setKPValue(this,'vid')" <%if(kombiniranVidList.contains("5")){ %> checked <%}%> />
								<label class="choice" for="vsnp_7_5">Пречки во слухот</label>
								<input id="vsnp_7_6" name="vsnp_7_6" class="element checkbox" type="checkbox" value="6" onchange="setKPValue(this,'vid')" <%if(kombiniranVidList.contains("6")){ %> checked <%}%> />
								<label class="choice" for="vsnp_7_6">Пречки во говорот, гласот и јазикот</label>
								<input id="vsnp_7_7" name="vsnp_7_7" class="element checkbox" type="checkbox" value="7" onchange="setKPValue(this,'vid')" <%if(kombiniranVidList.contains("7")){ %> checked <%}%> />
								<label class="choice" for="vsnp_7_7">Аутизам</label>
								<!-- <input id="vsnp_7_8" name="vsnp_7_8" class="element checkbox" type="checkbox" value="3" />
								<label class="choice" for="vsnp_7_8">Комбинирани пречки (можат да бидат сите претходни комбинации)</label> -->

								</span> 
								</li>
								</div>
								
								
								
								
								<li id="li_4" >
									<div >
									
									<label class="description" for="element_4">Степен на попреченост</label>
									
									
									<span>
									<input id="spp_1" name="spp_1" class="element checkbox" <% if (stepenNaPopList.contains("1")){ %> checked <% }%>  type="checkbox" value="1"  onchange="setKPValue(this,'stepen')" /><label class="choice" for="spp_1">Лесна мантална ретардација</label>
									<input id="spp_2" name="spp_2" class="element checkbox" <% if (stepenNaPopList.contains("2")){ %> checked <% }%>  type="checkbox" value="2" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_2">Умерена ментална ретардација</label>
									<input id="spp_3" name="spp_3" class="element checkbox" <% if (stepenNaPopList.contains("3")){ %> checked <% }%>  type="checkbox" value="3" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_3">Тешка ментална ретардација</label>
									<input id="spp_4" name="spp_4" class="element checkbox" <% if (stepenNaPopList.contains("4")){ %> checked <% }%>  type="checkbox" value="4" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_4">Длабока ментална ретардација</label>
									<input id="spp_5" name="spp_5" class="element checkbox" <% if (stepenNaPopList.contains("5")){ %> checked <% }%>  type="checkbox" value="5" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_5">Тешка телесна инвалидност</label>
									<input id="spp_6" name="spp_6" class="element checkbox" <% if (stepenNaPopList.contains("6")){ %> checked <% }%>  type="checkbox" value="6" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_6">Потешка телесна инвалидност</label>
									<input id="spp_7" name="spp_7" class="element checkbox" <% if (stepenNaPopList.contains("7")){ %> checked <% }%>  type="checkbox" value="7" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_7">Најтешка телесна инвалидност</label>
									<input id="spp_8" name="spp_8" class="element checkbox" <% if (stepenNaPopList.contains("8")){ %> checked <% }%>  type="checkbox" value="8" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_8">Најтешка форма на хронично заболување</label>
									<input id="spp_9" name="spp_9" class="element checkbox" <% if (stepenNaPopList.contains("9")){ %> checked <% }%>  type="checkbox" value="9" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_9">Слабовидно лице</label>
									<input id="spp_10" name="spp_10" class="element checkbox" <% if (stepenNaPopList.contains("10")){ %> checked <% }%>  type="checkbox" value="10" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_10">Слепо лице</label>
									<input id="spp_11" name="spp_11" class="element checkbox" <% if (stepenNaPopList.contains("11")){ %> checked <% }%>  type="checkbox" value="11" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_11">Практично слепо лице</label>
									<input id="spp_12" name="spp_12" class="element checkbox" <% if (stepenNaPopList.contains("12")){ %> checked <% }%>  type="checkbox" value="12" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_12">Наглуво лице</label>
									<input id="spp_13" name="spp_13" class="element checkbox" <% if (stepenNaPopList.contains("13")){ %> checked <% }%>  type="checkbox" value="13" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_13">Глуво лице - Практично глуво лице</label>
									<input id="spp_14" name="spp_14" class="element checkbox" <% if (stepenNaPopList.contains("14")){ %> checked <% }%>  type="checkbox" value="14" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_14">Глуво лице - Тотално глуво лице</label>
									<input id="spp_15" name="spp_15" class="element checkbox" <% if (stepenNaPopList.contains("15")){ %> checked <% }%>  type="checkbox" value="15" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_15">Лице со потполно отсуство на говор -Алалија</label>
									<input id="spp_16" name="spp_16" class="element checkbox" <% if (stepenNaPopList.contains("16")){ %> checked <% }%>  type="checkbox" value="16" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_16">Лице со патолошки развоен говор</label>
									<input id="spp_17" name="spp_17" class="element checkbox" <% if (stepenNaPopList.contains("17")){ %> checked <% }%>  type="checkbox" value="17" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_17">Лице со тешка назализација- Ринолалија</label>
									<input id="spp_18" name="spp_18" class="element checkbox" <% if (stepenNaPopList.contains("18")){ %> checked <% }%>  type="checkbox" value="18" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_18">Лице со отсуство и тешко оштетување на гласот – Афонија и Дисфонија</label>
									<input id="spp_19" name="spp_19" class="element checkbox" <% if (stepenNaPopList.contains("19")){ %> checked <% }%>  type="checkbox" value="19" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_19">Лице со тешко оштетен говор заради детска парализа</label>
									<input id="spp_20" name="spp_20" class="element checkbox" <% if (stepenNaPopList.contains("20")){ %> checked <% }%>  type="checkbox" value="20" onchange="setKPValue(this,'stepen')"  /><label class="choice" for="spp_20">Лице со оштетен или изгубен порано стекнат говор – Афазија и Дисфазија</label>
							
									
									</span>
									
									</div> 
								</li>
								
								<li class="section_break">
									<h3></h3>
									<p></p>
								</li>
								
									
								<li id="dijagnozaLi"><label class="description" for="dijagnoza">Пребарај Дијагноза</label>
									<div class="ui-widget">
										<input id="dijagnoza" name="dijagnoza" class="" type="text" maxlength="255"	value="" style="width=100%" />
									</div>
									<p class="guidelines" id="guide_21">
										<small>Пребарај Дијагноза</small>
									</p>
								</li>
								
								<li id="linkeddijagnosis"><label class="description" for="vsnp_7_1">Дијагнози</label>
								
								<div id ='linkeddijagnosisdiv'>				
								<%
								
								String dijagnoziIDString = "";
								
								for(int i=0; i< dijagnoziHash.size();i++){
									
									StringTokenizer stdijt = new StringTokenizer((String)dijagnoziHash.get(i),"%%");
									String dijagnozaId= stdijt.nextToken();
									String dijagnozaOpis = stdijt.nextToken();
									dijagnoziIDString = dijagnoziIDString + dijagnozaId + "%%";
									
									
								%>
								<input id='selecteddiagnosis<%=dijagnozaId%>' name='selecteddiagnosis<%=dijagnozaOpis %>' class='element checkbox' type='checkbox' value='1' checked  onchange="removediagnosis('<%=dijagnozaId%>')" /><label id='selecteddiagnosislabel<%=dijagnozaId%>' class='choice' for='selecteddiagnosis<%=dijagnozaOpis %>'><%=dijagnozaOpis%></label>
													
								<%} %>
								</div>
		
								</li>
								
								<li class="section_break">
									<h3></h3>
									<p></p>
								</li>
								
								<li id="li_10"><label class="description" for="element_10">Други Дијагнози</label>
									<div>
										<textarea id="drugidijagnozi" name="drugidijagnozi"
											class="element textarea large"><%=drugidijagnozi%></textarea>
								</div></li>
									
								<li id="li_10"><label class="description" for="element_10">Мерки што треба да се превземат</label>
									<div>
										<textarea id="merki" name="merki"
											class="element textarea large"><%=merki %></textarea>
									</div></li>
								<li id="li_11"><label class="description" for="element_11">Податоци за превземените мерки</label>
									<div>
										<textarea id="podatocizamerki" name="podatocizamerki"
											class="element textarea large"><%=podatocizamerki %></textarea>
									</div></li>
								<li id="li_12"><label class="description" for="element_12">Евентуални промени</label>
									<div>
										<textarea id="promeni" name="promeni"
											class="element textarea large"><%=promeni %></textarea>
									</div></li>
									
								<li id="li_12"><label class="description" for="element_12">Забелешки</label>
									<div>
										<textarea id="zabeleshki" name="zabeleshki"
											class="element textarea large"><%=zabeleshki %></textarea>
									</div></li>
									
								<li id="li_6"><!-- <label class="description" for="poslednapromena">Последна промена:</label> -->
									<div>
										<label id="poslednapromena" name="poslednapromena"
											class="element text large" type="text"  disabled maxlength="255"
											>Последна промена: <%= lastupdate%> </label>
									</div>
								</li>
									
								

								<li class="buttons"><input type="hidden" name="form_id"
									value="740480" /> <input id="saveForm1" class="button_text"
									type="submit" name="submit" value="  Зачувај   " /></li>
									
							</ul>
							<input type="hidden" name="dijagnozihidden" id="dijagnozihidden" value="<%=dijagnoziIDString%>"/>
							<input type="hidden" name="dijagnozDescihidden" id="dijagnozDescihidden" value=""/>
							<input type="hidden" name="kombiniraniprechkihidden" id="kombiniraniprechkihidden" value="<%=kombiniranVid%>"/>
							<input type="hidden" name="stepennapoprecenosthidden" id="stepennapoprecenosthidden" value="<%=stepenNaPop%>"/>
						</form>
						<div id="footer">
							Generated by <a href="http://www.phpform.org">pForm</a>
						</div>
					</div>
					<img id="bottom" src="images/bottom.png" alt="">


					
					
					
					<jsp:include page="footer.jsp" />
				</div>
			</div>
		</div>
<script type="text/javascript"> 

$("#saveForm1").click(function() {	
	onSaveForm();
});

$("#saveForm").click(function() {	
	onSaveForm();
});

function onSaveForm(){
	var completeStr = "";
	var str = $( "#dijagnozihidden" ).val();
	var all =  str.split("%%");
	
	for ( var i = 0; i < all.length; i++ ){
		if(all[i].length > 0){
			//alert(all[i] + $("#selecteddiagnosislabel" + all[i]).text());
			completeStr = completeStr + all[i] + "||" + $("#selecteddiagnosislabel" + all[i]).text() + "%%" ;
		}
		
	}
	
	$( "#dijagnozDescihidden" ).val(completeStr);
}


function removediagnosis(did){
	//alert("#selecteddiagnosis"+ did);
	var str = $( "#dijagnozihidden" ).val();
	 
	
	 
	var inputbox  = $( "#selecteddiagnosis"+ did );
	var inputlabel  = $( "#selecteddiagnosislabel"+ did );
	 
	 
	//alert(inputlabel.text());
	
	var texttoremove = did + "%%";
	str = str.replace(texttoremove,"");
	
	$( "#dijagnozihidden" ).val(str);
	 
	inputbox.remove();
	inputlabel.remove();
};

function setKPValue(value,type){
	
	var hidden = null;
	var string = null;
	
	if(type == 'vid'){
		hidden = $( "#kombiniraniprechkihidden" );
	}
	if(type == 'stepen'){
		hidden = $( "#stepennapoprecenosthidden" );
	}
	
	 var str = hidden.val();  
	if(value.checked){  
		  str = str + "," + value.value;
		  hidden.val(str);	
	}else{  
		str = str.replace("," + value.value,"");
		//alert(str)
		hidden.val(str);
	}
	
};

$(function() {
    function log( message ) {
      $( "<div>" ).text( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
    }
 
    $( "#dijagnoza" ).autocomplete({
      source: "searchicd",
      minLength: 1,
      select: function( event, ui ) {
        log( ui.item ? "Selected: " + ui.item.value + " aka " + ui.item.id : "Nothing selected, input was " + this.value );
        /*alert(ui.item ? "Selected: " + ui.item.value + " aka " + ui.item.id : "Nothing selected, input was " + this.value );*/
        $( "#linkeddijagnosisdiv" ).append("<input id='selecteddiagnosis"+ui.item.id+"' name='selecteddiagnosis"+ui.item.id+"' class='element checkbox' type='checkbox' value='1' checked  onchange=\"removediagnosis(\'"+ui.item.id + "\');\" /><label id='selecteddiagnosislabel"+ui.item.id+"' class='choice' for='selecteddiagnosis"+ui.item.id+"'>"+ui.item.value +"</label>");
        
        //$( "#linkeddijagnosisdiv" ).append("<option value="+ui.item.id+"' name='selecteddiagnosis"+ui.item.id+">"+ui.item.value +"</option>");
        
        var str = $( "#dijagnozihidden" ).val();
        /*str = str + ui.item.id + "|" +ui.item.value + "%%";*/
        str = str + ui.item.id + "%%";
        
        $( "#dijagnozihidden" ).val(str);
        $( "#dijagnoza" ).val("");
        
        
        
        
        
        
        return false;
        
      }
    });
  });
  
  
  
//kombiniraniprechkihidden

if( $('#vidnappop').val() != '8' ){
	$('#kombiniranvid').hide();
}
$('#vidnappop').change(function() {
	
	if( $('#vidnappop').val() == '8' ){
		$('#kombiniranvid').show();	
		
	}else{
		$('#kombiniranvid').hide();
		$( "#kombiniraniprechkihidden" ).val("");
	}
});

if( $('#nacionalnost').val() != 'd' ){
	$('#druganacionalnostdiv').hide();
}
$('#nacionalnost').change(function() {
	
	if( $('#nacionalnost').val() == 'd' ){
		$('#druganacionalnostdiv').show();	
		
	}else{
		$('#druganacionalnostdiv').hide();
	}
});


$('#redenbr').change(function(){
	
	var id =$('#redenbr').val(); 
	
	var jqxhr = $.ajax( "/validate?redenbr=" +id )
	  .done(function(data,textStatus, jqXHR ) {
	    if(data == 'found'){
	    	$('#dialogtext').text("Пациентот со реден број " + id + " веќе постои.");
	    	$( "#dialog-modal" ).dialog({
	    	    height: 140,
	    	    width:350,
	    	    modal: true,
	    	    buttons: {
	    	        "Детали за Пациентот": function() {
	    	        	openPart(id);
	    	        },
	    	        "Нов Пациент": function() {
	    	        	openPart('');
	    	        }
	    	    	
	    	      }
	    	  });

	    	
	    }
	  })
	  .fail(function() {
	    //alert( "error" );
	  })
	  .always(function() {
	    //alert( "complete" );
	  });
	
});



</script>
</body>
</html>
