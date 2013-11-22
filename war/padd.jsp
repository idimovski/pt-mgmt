<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
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
	System.out.println("Redirected to login");
}else{
	if(!(session.getAttribute("userin").equals(true))){
		response.sendRedirect("login.jsp");
		System.out.println("Redirected to login");
	}
}
%>
<%
//INIT

//get entity

Entity e = (Entity) request.getAttribute("pte");
String fname = "";
String last  = "";
String emb  = "";

	if(null != e){
		fname = (String) e.getProperty("first"); if (null == fname) fname = "";
		last = (String) e.getProperty("last"); if (null == last) last = "";
		emb = (String) e.getProperty("emb"); if (null == emb) emb = "";
	}



%>
<body>

	<div class="main-out">
		<div class="main">
			<div class="page">
				<div class="top">
					<jsp:include page="header.jsp" />

					<p>&nbsp;</p>


					
					<div id="form_container">
					<!-- <img id="top" src="images/top.png" alt=""> -->

						<form id="form_740480" class="appnitro" method="post" action="add">
							<div class="form_description">
								<h2>Нов Пациент</h2>

							</div>
							<ul>
								<li id="li_1"><label class="description" for="element_1">Реден Број</label>
									<div>
										<input id="element_1" name="first"
											class="element text small" type="text" maxlength="255"
											value='<%=fname%>' />
									</div>
									<p class="guidelines" id="guide_2">
										<small>Име</small>
									</p>
								</li>

								
								<li id="li_2" >
									<label class="description" for="element_2">Име и презиме </label>
									<span>
										<input id="element_2_1" name= "element_2_1" class="element text" maxlength="255" size="20" value='<%=fname%>'/>
										<label>Име</label>
									</span>
									<span>
										<input id="element_2_2" name= "element_2_2" class="element text" maxlength="255" size="20" value='<%=last%>'/>
										<label>Презиме</label>
									</span> 
									<p class="guidelines" id="guide_2">
										<small>Име</small>
									</p>
								</li>
								
								<li>
								<label class="description" for="pol">Пол</label>
								<select class="element select medium" id="pol"
											name="pol">
											<option value="m" selected="selected">Машки</option>
											<option value="z" >Женски</option>
										</select> 
										
								</li>
							
								<li id="li_1" >
									<label class="description" for="dob_1">Датум на раѓање </label>
									<span>
										<input id="dob_1_1" name="dob_1_1" class="element text" size="2" maxlength="2" value="" type="text"> /
										<label for="dob_1_1">Ден</label>
									</span>
									<span>
										<input id="dob_1_2" name="dob_1_2" class="element text" size="2" maxlength="2" value="" type="text"> /
										<label for="dob_1_2">Месец</label>
									</span>
									<span>
								 		<input id="dob_1_3" name="dob_1_3" class="element text" size="4" maxlength="4" value="" type="text">
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
										<input id="element_21" name="mesto"
											class="element text medium" type="text" maxlength="255"
											value="" />
									</div>
									<p class="guidelines" id="guide_21">
										<small>Место на Раѓање</small>
									</p>
								</li>
									
								<li id="li_21"><label class="description" for="element_21">ЕМБГ</label>
									<div>
										<input id="element_21" name="emb"
											class="element text medium" type="text" maxlength="255"
											value="<%=emb%>" />
									</div>
									<p class="guidelines" id="guide_21">
										<small>ЕМБГ</small>
									</p>
								</li>
								<li id="li_3"><label class="description" for="element_3">Адреса на пациентот</label>

									<div>
										<input id="element_3_1" name="element_3_1"
											class="element text large" value="" type="text"> <label
											for="element_3_1">Улица и број</label>
									</div>

									<div class="left">
										<input id="element_3_3" name="element_3_3"
											class="element text medium" value="" type="text"> <label
											for="element_3_3">Град</label>
									</div>

									<div class="right">
										<input id="element_3_4" name="element_3_4"
											class="element text medium" value="" type="text"> <label
											for="element_3_4">Општина</label>
									</div>

									<div class="left">
										<input id="element_3_5" name="element_3_5"
											class="element text medium" maxlength="15" value=""
											type="text"> <label for="element_3_5">Поштенски Код</label>
									</div>

									<div class="right">
										<select class="element select medium" id="element_3_6"
											name="element_3_6">
											<option value="Macedonia" selected="selected">Македонија</option>
										</select> <label for="element_3_6">Држава</label>
									</div></li>
								<li class="section_break">
									<h3></h3>
									<p></p>
								</li>
								<li id="li_4"><label class="description" for="element_4">Име на таткото</label>
									<div>
										<input id="element_4" name="element_4"
											class="element text large" type="text" maxlength="255"
											value="" />
									</div></li>
								<li id="li_6"><label class="description" for="element_6">Име на мајката</label>
									<div>
										<input id="element_6" name="element_6"
											class="element text large" type="text" maxlength="255"
											value="" />
									</div>
								</li>
								<li id="li_6"><label class="description" for="element_6">Моминско име на мајката</label>
									<div>
										<input id="element_6" name="element_6"
											class="element text large" type="text" maxlength="255"
											value="" />
									</div>
								</li>
								<li id="li_7"><label class="description" for="element_7">Адреса на родителите</label>

									<div>
										<input id="element_7_1" name="element_7_1"
											class="element text large" value="" type="text"> <label
											for="element_7_1">Улица и број</label>
									</div>

									<div class="left">
										<input id="element_7_3" name="element_7_3"
											class="element text medium" value="" type="text"> <label
											for="element_7_3">Град</label>
									</div>

									<div class="right">
										<input id="element_7_4" name="element_7_4"
											class="element text medium" value="" type="text"> <label
											for="element_7_4">Општина</label>
									</div>

									<div class="left">
										<input id="element_7_5" name="element_7_5"
											class="element text medium" maxlength="15" value=""
											type="text"> <label for="element_7_5">Поштенски Код</label>
									</div>

									<div class="right">
										<select class="element select medium" id="element_7_6"
											name="element_7_6">
											<option value="Macedonia" selected="selected">Македонија</option>

										</select> <label for="element_7_6">Држава</label>
									</div>
								<li class="section_break"/>
								
								<li id="li_21"><label class="description" for="element_21">Број на наодот со кој лицето е распоредено</label>
									<div>
										<input id="element_21" name="emb"
											class="element text medium" type="text" maxlength="255"
											value="" />
									</div>
									<p class="guidelines" id="guide_21">
										<small>ЕМБГ</small>
									</p>
								</li>
								
								<li id="datumnanaodot" >
									<label class="description" for="datumnanaodot">Датум кога е издаден наодот</label>
									<span>
										<input id="naod_1_1" name="naod_1_1" class="element text" size="2" maxlength="2" value="" type="text"> /
										<label for="naod1">Ден</label>
									</span>
									<span>
										<input id="naod_1_2" name="naod_1_2" class="element text" size="2" maxlength="2" value="" type="text"> /
										<label for="naod2">Месец</label>
									</span>
									<span>
								 		<input id="naod_1_3" name="naod_1_3" class="element text" size="4" maxlength="4" value="" type="text">
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
									<label class="description" for="vidnappop">Вид на попреченост:</label>
									<div>
									<select class="element select large" id="vidnappop" name="element_4"> 
									<option value="" selected="selected"></option>
									<option value="1" >Пречки во психичкиот развој</option>
									<option value="2" >Пречки во физичкиот развој</option>
									<option value="3" >Хронично болно лице</option>
									<option value="4" >Пречки во видот</option>
									<option value="5" >Пречки во слухот</option>
									<option value="6" >Пречки во говорот, гласот и јазикот</option>
									<option value="7" >Аутизам</option>
									<option value="8" >Комбинирани пречки (можат да бидат сите претходни комбинации)</option>
								
									</select>
									 
								</li>
								
								<!-- Show if vid na pop = 8  -->
											
								<div id='kombiniranvid'>								
								<li id="kombiniranvid" >
								<label class="description" for="element_7">Вид на комбинирана психофизичка попреченост: </label>
								<span>
								<input id="vsnp_7_1" name="vsnp_7_1" class="element checkbox" type="checkbox" value="1" />
								<label class="choice" for="vsnp_7_1">Пречки во психичкиот развој</label>
								<input id="vsnp_7_2" name="vsnp_7_2" class="element checkbox" type="checkbox" value="2" />
								<label class="choice" for="vsnp_7_2">Пречки во физичкиот развој</label>
								<input id="vsnp_7_3" name="vsnp_7_3" class="element checkbox" type="checkbox" value="3" />
								<label class="choice" for="vsnp_7_3">Хронично болно лице</label>
								<input id="vsnp_7_4" name="vsnp_7_4" class="element checkbox" type="checkbox" value="4" />
								<label class="choice" for="vsnp_7_4">Пречки во видот</label>
								<input id="vsnp_7_5" name="vsnp_7_5" class="element checkbox" type="checkbox" value="5" />
								<label class="choice" for="vsnp_7_5">Пречки во слухот</label>
								<input id="vsnp_7_6" name="vsnp_7_6" class="element checkbox" type="checkbox" value="6" />
								<label class="choice" for="vsnp_7_6">Пречки во говорот, гласот и јазикот</label>
								<input id="vsnp_7_7" name="vsnp_7_7" class="element checkbox" type="checkbox" value="7" />
								<label class="choice" for="vsnp_7_7">Аутизам</label>
								<!-- <input id="vsnp_7_8" name="vsnp_7_8" class="element checkbox" type="checkbox" value="3" />
								<label class="choice" for="vsnp_7_8">Комбинирани пречки (можат да бидат сите претходни комбинации)</label> -->

								</span> 
								</li>
								</div>
								
								
								
								
								<li id="li_4" >
									<div >
									
									<label class="description" for="element_4">Степен на попреченост:</label>
									
									<span>
									<input id="spp_1" name="spp_1" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_1">Лесна мантална ретардација</label>
									<input id="spp_2" name="spp_2" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_2">Умерена ментална ретардација</label>
									<input id="spp_3" name="spp_3" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_3">Тешка ментална ретардација</label>
									<input id="spp_4" name="spp_4" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_4">Длабока ментална ретардација</label>
									<input id="spp_5" name="spp_5" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_5">Тешка телесна инвалидност</label>
									<input id="spp_6" name="spp_6" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_6">Потешка телесна инвалидност</label>
									<input id="spp_7" name="spp_7" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_7">Најтешка телесна инвалидност</label>
									<input id="spp_8" name="spp_8" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_8">Најтешка форма на хронично заболување</label>
									<input id="spp_9" name="spp_9" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_9">Слабовидно лице</label>
									<input id="spp_10" name="spp_10" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_10">Слепо лице</label>
									<input id="spp_11" name="spp_11" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_11">Практично слепо лице</label>
									<input id="spp_12" name="spp_12" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_12">Наглуво лице</label>
									<input id="spp_13" name="spp_13" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_13">Глуво лице - Практично глуво лице</label>
									<input id="spp_14" name="spp_14" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_14">Глуво лице - Тотално глуво лице</label>
									<input id="spp_15" name="spp_15" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_15">Лице со потполно отсуство на говор -Алалија</label>
									<input id="spp_16" name="spp_16" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_16">Лице со патолошки развоен говор</label>
									<input id="spp_17" name="spp_17" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_17">Лице со тешка назализација- Ринолалија</label>
									<input id="spp_18" name="spp_18" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_18">Лице со отсуство и тешко оштетување на гласот – Афонија и Дисфонија</label>
									<input id="spp_19" name="spp_19" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_19">Лице со тешко оштетен говор заради детска парализа</label>
									<input id="spp_20" name="spp_20" class="element checkbox" type="checkbox" value="1" /><label class="choice" for="spp_20">Лице со оштетен или изгубен порано стекнат говор – Афазија и Дисфазија</label>
							
									
									</span>
									
									</div> 
								</li>
								
								<li class="section_break">
									<h3></h3>
									<p></p>
								</li>
								
									
								<li id="dijagnozaLi"><label class="description" for="dijagnoza">Пребарај Дијагноза</label>
									<div class="ui-widget">
										<input id="dijagnoza" name="mesto" class="" type="text" maxlength="255"	value="" style="width=100%" />
									</div>
									<p class="guidelines" id="guide_21">
										<small>Пребарај Дијагноза</small>
									</p>
								</li>
								
								<li id="linkeddijagnosis"><label class="description" for="vsnp_7_1">Дијагнози:</label>
								
								<div id ='linkeddijagnosisdiv'>
								<!-- <input id="linkeddijagnosis" name="spp_1" class="element checkbox" type="checkbox" value="1" disabled /><label class="choice" for="linkeddijagnosis">Лесна мантална ретардација</label> -->
								</div>
		
								</li>
								
								<li class="section_break">
									<h3></h3>
									<p></p>
								</li>
							
								<!-- <li id="li_10">
									<div>
									<label class="description" for="element_10">Дијагноза</label>
										<textarea id="element_10" name="element_10"
											class="element textarea large">TBD</textarea>
									</div></li> -->
									
								<li id="li_10"><label class="description" for="element_10">Мерки што треба да се превземат</label>
									<div>
										<textarea id="element_10" name="element_10"
											class="element textarea large"></textarea>
									</div></li>
								<li id="li_11"><label class="description" for="element_11">Податоци за превземените мерки</label>
									<div>
										<textarea id="element_11" name="element_11"
											class="element textarea large"></textarea>
									</div></li>
								<li id="li_12"><label class="description" for="element_12">Евентуални промени</label>
									<div>
										<textarea id="element_12" name="element_12"
											class="element textarea large"></textarea>
									</div></li>
									
								<li id="li_12"><label class="description" for="element_12">Забелешки</label>
									<div>
										<textarea id="element_12" name="element_12"
											class="element textarea large"></textarea>
									</div></li>

								<li class="buttons"><input type="hidden" name="form_id"
									value="740480" /> <input id="saveForm" class="button_text"
									type="submit" name="submit" value="  Зачувај   " /></li>
									
							</ul>
						</form>
						<div id="footer">
							Generated by <a href="http://www.phpform.org">pForm</a>
						</div>
					</div>
					<img id="bottom" src="images/bottom.png" alt="">


					<div class="bottom">
						<ul>
							<li style="border-left: medium none;"><a href="index.html">Home</a></li>
							<li><a href="#">About&nbsp;Us</a></li>
							<li><a href="#">What's&nbsp;New</a></li>
							<li><a href="#">Services</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Resources</a></li>
							<li><a href="#">Links</a></li>
						</ul>
						<!--DO NOT Remove The Footer Links-->
						<p>
							&copy; Copyright 2010. Designed by <a target="_blank"
								href="http://www.htmltemplates.net">htmltemplates.net</a>
						</p>
						<!--Designed by-->
						<a href="http://www.htmltemplates.net"> <img
							src="images/footnote.gif" class="copyright" alt="html templates">
						</a>
					</div>
					<!--In partnership with-->
					<a href="http://www.casinotemplates.net"> <img
						src="images/footnote.gif" class="copyright"
						alt="casinotemplates.net">
					</a>
					<!--DO NOT Remove The Footer Links-->
				</div>
			</div>
		</div>
<script type="text/javascript">
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
        $( "#linkeddijagnosisdiv" ).append("<input id='"+ui.item.id+"' name='selecteddiagnosis' class='element checkbox' type='checkbox' value='1' disabled checked /><label class='choice' for='linkeddijagnosis'>"+ui.item.value +"</label>");
        
        $( "#dijagnoza" ).val("");
        return false;
        
      }
    });
  });
  
  

$('#kombiniranvid').hide();
$('#vidnappop').change(function() {
	
	if( $('#vidnappop').val() == '8' ){
		$('#kombiniranvid').show();	
		
	}else{
		$('#kombiniranvid').hide();
	}
});
</script>
</body>
</html>
