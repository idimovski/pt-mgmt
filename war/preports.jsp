<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.Text"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Извештаи</title>
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

Entity e = (Entity) request.getAttribute("ptr");
String pol = "";String FROMden = "01";String FROMmesec = "01";String FROMgodina = "1900";
String TOden = "01";String TOmesec = "01";String TOgodina = "2020";

String nacionalnost = "";

String vidnappop = ""; String stepenNaPop = "";
List stepenNaPopList = new ArrayList();

	if(null != e){
		
		pol = (String) e.getProperty("pol"); if (null == pol) pol = "";
		
		
		
		FROMden = (String) e.getProperty("FROMden"); if (null == FROMden) FROMden = "";
		FROMmesec = (String) e.getProperty("FROMmesec"); if (null == FROMmesec) FROMgodina = "";
		FROMgodina = (String) e.getProperty("FROMgodina"); if (null == FROMgodina) FROMgodina = "";
		
		TOmesec = (String) e.getProperty("TOmesec"); if (null == TOmesec) TOmesec = "";
		TOden = (String) e.getProperty("TOden"); if (null == TOden) TOden = "";
		TOgodina = (String) e.getProperty("TOgodina"); if (null == TOgodina) TOgodina = "";
		
		nacionalnost = (String) e.getProperty("nacionalnost"); if (null == nacionalnost) nacionalnost = "";
	
		vidnappop = (String) e.getProperty("vidnappop"); if (null == vidnappop) vidnappop = "";
		
		
		stepenNaPop = (String) e.getProperty("stepen"); if (null == stepenNaPop) stepenNaPop = "";
		
		
		stepenNaPopList = (List) e.getProperty("stepenNaPopList"); if (null == stepenNaPopList) stepenNaPopList = new ArrayList();
		
		
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

						<form id="form_740480" class="appnitro" method="post" action="reports">
							<div class="form_description">
								<h2>Извештаи  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input id="saveForm" class="button_text" type="submit" name="submit" value="  Изврши   " /></h2>

							</div>
							
							
							<ul>
					
					<br/>
						<br/>
					<%
					if(null!=request.getAttribute("allpts")){
						List<Entity> allpts = (List) request.getAttribute("allpts");
						
						%><label class="description" for="element_1">Пациенти (<%=allpts.size() %>):</label>
					
						
						<table border="1" style="border-width: 0" width="100%">
						<tr>
						<td>#</td>
						<td>Реден Број</td>
						<td>ЕМБ</td>
						<td>Име</td>
						<td>Презиме</td>
						</tr>
						<%
								
						boolean firstrow = true;
						int i = 0;
						for (Iterator iterator = allpts.iterator(); iterator.hasNext();) {
							Entity entity = (Entity) iterator.next();
							i++;
							%>
							<tr>
							<td><%=i%></td>
							<td width="100px">
							<span style="width=100%">
								<label class="description" for="element_1"><a href="details?ptid=<%=entity.getProperty("redenbr")%>"><%=entity.getProperty("redenbr") %></a></label>
							</span>
							</td>
							<td width="100px">
							<span style="width=100%">
								<label class="description" for="element_1"><a href="details?ptid=<%=entity.getProperty("redenbr")%>"><%=entity.getProperty("emb") %></a></label>
							</span>
							</td>
							<td>
							<span>
								<label class="description" for="element_1"><%=entity.getProperty("ime") %></label>
							</span>
							</td>
							<td>
							<span>
								
								<!-- <input id="element_1_2" name= "element_1_2" class="element text" maxlength="255" size="14" value='<%=entity.getProperty("last") %>' disabled/> -->
								<label class="description" for="element_1"><%=entity.getProperty("prezime") %></label>
								
							</span> 
							</li>
							</td>
							
							<td><a href="details?ptid=<%=entity.getProperty("redenbr")%>">Детали</a></td>
							</tr>
							
							<%
							firstrow = false;
						}
					}
					%>
					</table>
					</ul>
							<ul>
							
							<li class="section_break">
									<h3></h3>
									<p></p>
								</li>
								
								
								

<!-- Datum OD -->					<li id="li_1" >
									<label class="description" for="dob_1">Датум на раѓање Од: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; До:</label>
									 
									<span>
										<input id="dob_1_1" name="dob_1_1" class="element text" size="2" maxlength="2" value="<%=FROMden %>" type="text"> /
										<label for="dob_1_1">Ден</label>
									</span>
									<span>
										<input id="dob_1_2" name="dob_1_2" class="element text" size="2" maxlength="2" value="<%=FROMmesec%>" type="text"> /
										<label for="dob_1_2">Месец</label>
									</span>
									<span>
								 		<input id="dob_1_3" name="dob_1_3" class="element text" size="4" maxlength="4" value="<%=FROMgodina %>" type="text">
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
								
<!-- Datum OD -->				
									
								
									<span>
									
										<input id="dodob_1_1" name="dodob_1_1" class="element text" size="2" maxlength="2" value="<%=TOden %>" type="text"> /
										<label for="dodob_1_1">Ден</label>
									</span>
									<span>
										<input id="dodob_1_2" name="dodob_1_2" class="element text" size="2" maxlength="2" value="<%=TOmesec%>" type="text"> /
										<label for="dodob_1_2">Месец</label>
									</span>
									<span>
								 		<input id="dodob_1_3" name="dodob_1_3" class="element text" size="4" maxlength="4" value="<%=TOgodina %>" type="text">
										<label for="dodob_1_3">Година</label>
									</span>
								
									<span id="calendar_2">
										<img id="cal_img_2" class="datepicker" src="images/calendar.gif" alt="Pick a date.">	
									</span>
									<script type="text/javascript">
										Calendar.setup({
										inputField	 : "dodob_1_3",
										baseField    : "dodob_1",
										displayArea  : "calendar_2",
										button		 : "cal_img_2",
										ifFormat	 : "%B %e, %Y",
										onSelect	 : selectEuropeDate
										});
									</script>
								</li>
								
<!-- Nacionalnost -->			<li>
								<span style="width:50%">
								<label class="description" for="nacionalnost">Националност:</label>
								<select class="element select medium" id="nacionalnost"
											name="nacionalnost">
											<option value="all" <%if(nacionalnost.equals("all")){ %>selected="selected"<%} %> ><b>Сите</b></option>
											<option value="m" <%if(nacionalnost.equals("m")){ %>selected="selected"<%} %> >Македонец/ка</option>
											<option value="a" <%if(nacionalnost.equals("a")){ %>selected="selected"<%} %>  >Албанец/ка</option>
											<option value="r" <%if(nacionalnost.equals("r")){ %>selected="selected"<%} %> >Ром/ка</option>
											<option value="t" <%if(nacionalnost.equals("t")){ %>selected="selected"<%} %>>Турчин/ка</option>
											<option value="s" <%if(nacionalnost.equals("s")){ %>selected="selected"<%} %> >Србин/ка</option>
											<option value="v" <%if(nacionalnost.equals("v")){ %>selected="selected"<%} %> >Влав</option>
											<option value="e" <%if(nacionalnost.equals("e")){ %>selected="selected"<%} %> >Египјанин/ка</option>
											<option value="b" <%if(nacionalnost.equals("b")){ %>selected="selected"<%} %> >Бошњак</option>
											<option value="d" <%if(nacionalnost.equals("d")){ %>selected="selected"<%} %> >Друга</option>
											
											
										</select> 
										
<!-- POL -->					</span>
								<span style="width:200px">
								<label class="description" for="pol">Пол:</label>
								<select class="element select medium" id="pol" name="pol">
											<option value="all" <%if (pol.equals("a")) {%>selected="selected"<%} %>>Сите</option>
											<option value="m" <%if (pol.equals("m")) {%>selected="selected"<%} %>>Машки</option>
											<option value="z" <%if (pol.equals("z")) {%>selected="selected"<%} %>>Женски</option>
										</select> 
								</span>	
								</li>
							
										
								
																
<!-- Vid na poprechenost -->	<li id="vidnappopli" >
									<label class="description" for="vidnappop">Вид на попреченост:</label>
									<select class="element select large" id="vidnappop" name="vidnappop"> 
									<option value="all" <%if(vidnappop.equals("all")){ %>selected="selected"<%} %>>Сите</option>
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
								
								<li id="li_4" >
									<div >
									
									<label class="description" for="element_4">Степен на попреченост:</label>
									
									
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
								
								<input type="hidden" name="stepennapoprecenosthidden" id="stepennapoprecenosthidden" value="<%=stepenNaPop%>"/>
								
															
							

								<li class="buttons"><input type="hidden" name="form_id"
									value="740480" /> <input id="saveForm" class="button_text"
									type="submit" name="submit" value="  Изврши   " /></li>
									
							</ul>
							
							
								
							
						</form>
						<div id="footer">
							Generated by <a href="http://www.phpform.org">pForm</a>
						</div>
					</div>
					<img id="bottom" src="images/bottom.png" alt="">

<div style="display:none">
<div id="dialog-modal" title="Внимание !!!">
  <p>Пациентот со овој матичен број веќе постои.</p></div></div>
					
					
					
					<jsp:include page="footer.jsp" />
				</div>
			</div>
		</div>
<script type="text/javascript">

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


$('#emb').change(function(){
	
	var emb =$('#emb').val(); 
	
	var jqxhr = $.ajax( "/validate?emb=" +emb )
	  .done(function(data,textStatus, jqXHR ) {
	    if(data == 'found'){
	    	$( "#dialog-modal" ).dialog({
	    	    height: 140,
	    	    modal: true
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
