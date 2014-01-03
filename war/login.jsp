<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Одд за Ментално Здравје - Клиничка Болница Битола </title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css">


</head>
<body>
	<div class="main-out">
		<div class="main">
			<div class="page">
				<div class="top">

<jsp:include page="header.jsp" />
				</div>
				<div class="content">
					<div class="content-left">
						<div class="row1">
							<div class="img">
								<img src="images/img1.jpg" alt="" height="101" width="157">
							</div>
							<div class="welcome">
								<h1 class="title">
									Одд. за Ментално Здравје - <span>Клиничка Болница Битола</span>
								</h1>
								<p>
									<strong></strong><br>

									<%
										if (null == session.getAttribute("userin")) {
									%>
								
								<form action="login" method="post">
									<table>
										<tr>
											<td>Име:</td>
											<td><input name="username" type="text" value="admin" /></td>
										</tr>
										<tr>
											<td>Лозинка:</td>
											<td><input name="password" type="password"
												value="adminp" /></td>
										</tr>
									</table>
									<div>
										<input type="submit" value="   Најави се   " />
									</div>
								</form>
								<%
									}
								%>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
								<br/>
							</div>
							
						</div>
						
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp" />
	</div>
	</div>
</body>
</html>
