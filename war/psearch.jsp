<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>

<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Пребарување</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link href="css/pagingStyles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/view1.css">
<link href="css/style.css" rel="stylesheet" type="text/css">


<script src="JS/jquery-1.10.2.min.js"></script>
<script src="JS/jquery-ui.js"></script>
<script src="JS/myjs.js"></script>

<script src="JS/quickpager.jquery.js"></script>
<script src="JS/jquery.quick.pagination.min.js"></script>


<script type="text/javascript" src="JS/view.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	// $("ul.pagination1").quickPagination();
	
	$("ul.pagination1").quickPagination({pagerLocation:"both",pageSize:'10'});
	//$("ul.pagination2").quickPager({pagerLocation:"both"});
	
});




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


Entity e = (Entity) request.getAttribute("p");
String redenbr= "";String first = ""; String last  = "";String emb= "";

if(null != e){
	first = (String) e.getProperty("ime"); if (null == first) first = "";
	last = (String) e.getProperty("prezime"); if (null == last) last = "";
	redenbr = (String) e.getProperty("redenbr"); if (null == last) redenbr = "";
	emb = (String) e.getProperty("emb"); if (null == emb) emb = "";
	
}

%>
<%
//INIT

%>
<body>
	<div class="main-out">
		<div class="main">
			<div class="">
				<div class="top">
					<jsp:include page="header.jsp" />

					<p>&nbsp;</p>


					
					<div id="form_container">

						<form id="form_740480" class="appnitro" method="post" action="search">
							<div class="form_description">
								<h2>Пребарај пациент</h2>

							</div>
						
							<ul>
								<li style="width:100%">
								<span>
									<label class="description" for="redenbr">Реден Број</label>
									<input id="redenbr" name= "redenbr" class="element text" maxlength="255" size="15" value="<%=redenbr%>"/>
								</span>
								<span>
									<label class="description" for="emb">ЕМБ</label>
									<input id="emb" name= "emb" class="element text" maxlength="255" size="15" value="<%=emb%>"/>
								</span>
								<span>
									<label class="description" for="ime">Име</label>
									<input id="ime" name= "ime" class="element text" maxlength="255" size="15" value="<%=first%>"/>
								</span>
								<span>
									<label class="description" for="prezime">Презиме</label>
									<input id="prezime" name= "prezime" class="element text" maxlength="255" size="15" value="<%=last%>"/>
								</span>
								</li>
							</ul>
							
							<li class="buttons"><input type="hidden" name="form_id"
									value="740480" /> <input id="saveForm" class="button_text"
									type="submit" name="submit" value="  Барај   " /></li>
					
						
					
				
					
					
					
					
					<br/>
						<br/>
						
					<!--<table border="0" width="100%">
							<tr>
							<td>Реден Број</td>
							<td>ЕМБ</td>
							<td>Име</td>
							<td>Презиме</td>
							</tr>
						</table>
						-->
					<!-- <label class="description" for="element_1">Пациенти:</label> -->
					<ul class="pagination1">
					<%
					if(null!=request.getAttribute("allpts")){
						List<Entity> allpts = (List) request.getAttribute("allpts");
						
						%><%
						
						
						boolean firstrow = true;
						for (Iterator iterator = allpts.iterator(); iterator.hasNext();) {
							Entity entity = (Entity) iterator.next();
							%>
							
						
							<% if(firstrow) {%>	
						<!-- 	<li>
							<table width = '100%' border="0">
							  <tr>
							    <td width="20%"><label  class="description">Реден Број</label></td>
							    <td width="30%"><label  class="description">Име</label></td>
							    <td width="30%"><label  class="description">Презиме</label></td>
							    <td width="5%" align="right"></td>
							  </tr>
							</table>

							</li> -->
							<%} %>
							
							<li onclick='openPart(<%=entity.getProperty("redenbr")%>)'>
							<table width = '100%' border="0" style="cursor: pointer;">
							  <tr style="cursor: pointer;">
							    <td width="20%"><label  class="description" style="cursor: pointer;"><%=entity.getProperty("redenbr") %></label></td>
							    <td width="30%"><label  class="description" style="cursor: pointer;"><%=entity.getProperty("ime") %></label></td>
							    <td width="30%"><label  class="description" style="cursor: pointer;"><%=entity.getProperty("prezime") %></label></td>
							    <td width="5%" align="right" style="cursor: pointer;"><a href="details?ptid=<%=entity.getProperty("redenbr")%>"><font style="font-weight:bold" size='2' face="arial" color="black">Детали</font></a></td>
							  </tr>
							</table>

							</li>
							
							
							<%
							firstrow = false;
						}
						
					}
					%>
					</ul>
				
				
					
					
					</form>
						<div id="footer">
							Generated by <a href="http://www.phpform.org">pForm</a>
						</div>
					</div>
					<img id="bottom" src="images/bottom.png" alt="">

					<div class="bottom">
						<jsp:include page="footer.jsp" />
				</div>
			</div>
		</div>
		
			
</body>
</html>
