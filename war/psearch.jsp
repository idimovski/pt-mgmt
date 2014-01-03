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


<title>Нов Пациент</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<link rel="stylesheet" type="text/css" href="css/view.css" media="all">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="JS/view.js"></script>

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

%>
<body>
	<div class="main-out">
		<div class="main">
			<div class="page">
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
									<input id="redenbr" name= "redenbr" class="element text" maxlength="255" size="15" value=""/>
								</span>
								<span>
									<label class="description" for="emb">ЕМБ</label>
									<input id="emb" name= "emb" class="element text" maxlength="255" size="15" value=""/>
								</span>
								<span>
									<label class="description" for="ime">Име</label>
									<input id="ime" name= "ime" class="element text" maxlength="255" size="15" value=""/>
								</span>
								<span>
									<label class="description" for="prezime">Презиме</label>
									<input id="prezime" name= "prezime" class="element text" maxlength="255" size="15" value=""/>
								</span>
								</li>
							</ul>
							
							<li class="buttons"><input type="hidden" name="form_id"
									value="740480" /> <input id="saveForm" class="button_text"
									type="submit" name="submit" value="  Барај   " /></li>
					
					
					<ul>
					
					<br/>
						<br/>
					<%
					if(null!=request.getAttribute("allpts")){
						List<Entity> allpts = (List) request.getAttribute("allpts");
						
						%><label class="description" for="element_1">Пациенти:</label>
					
						
						<li>
						
					
						</li>
						
						<table border="0" width="100%">
						<tr>
						<td>Реден Број</td>
						<td>ЕМБ</td>
						<td>Име</td>
						<td>Презиме</td>
						</tr>
						<%
								
						boolean firstrow = true;
						for (Iterator iterator = allpts.iterator(); iterator.hasNext();) {
							Entity entity = (Entity) iterator.next();
							%>
							<li id="li_1" >
							<tr>
							<td width="100px">
							<span style="width=100%">
								
<!-- 								<input  id="element_1_1" name= "element_1_1" class="element text" maxlength="255" size="8" value='<%=entity.getProperty("redenbr") %>' disabled/> -->
								<label class="description" for="element_1"><a href="details?ptid=<%=entity.getProperty("emb")%>"><%=entity.getProperty("redenbr") %></a></label>
							</span>
							</td>
							<td width="100px">
							<span style="width=100%">
								
<!-- 								<input  id="element_1_1" name= "element_1_1" class="element text" maxlength="255" size="8" value='<%=entity.getProperty("first") %>' disabled/> -->
								<label class="description" for="element_1"><a href="details?ptid=<%=entity.getProperty("emb")%>"><%=entity.getProperty("emb") %></a></label>
							</span>
							</td>
							<td>
							<span>
								
								
<!-- 								<input  id="element_1_1" name= "element_1_1" class="element text" maxlength="255" size="8" value='<%=entity.getProperty("first") %>' disabled/> -->
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
							
							<td><a href="details?ptid=<%=entity.getProperty("emb")%>">Детали</a></td>
							</tr>
							
							<%
							firstrow = false;
						}
					}
					%>
					</table>
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
