<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Your Company</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="main-out">
<div class="main">
<div class="page">
<div class="top">
<div class="header">
<div class="header-top">
<h1>Your <span>Company</span></h1>
<p>Call Us: 000 0000 000</p>
</div>
<div class="topmenu">
<ul>
  <li><a href="index.html">Home</a></li>
  <li><a href="#">About&nbsp;Us</a></li>
  <li><a href="#">What's&nbsp;New</a></li>
  <li><a href="#">Services</a></li>
  <li><a href="#">Contact</a></li>
  <li><a href="#">Resources</a></li>
  <li><a href="#">Links</a></li>
</ul>
</div>
<div class="header-img">
<h2>Slogan goes here</h2>
</div>
</div>
<div class="content">
<div class="content-left">
<div class="row1">
<div class="img"><img src="images/img1.jpg" alt="" height="101"
 width="157"></div>
<div class="welcome">
<h1 class="title">Welcome to <span>Your Company</span></h1>
<p><strong>Lorem Ipsum is simply dummy text of the printing and
typesetting industry.</strong><br>

<form action="login" method="post">
    <table>
    	<tr><td>user name</td><td><input name="username" type="text"/></td></tr>
    	<tr><td>password</td><td><input name="password" type="text"/></td></tr>
    </table>
    <div><input type="submit" value="Post Greeting" /></div>
  </form>


Lorem Ipsum has been the industry's standard dummy text ever since the
1500s, when an unknown printer took a galley of type and scrambled it
to make a type specimen book. It has survived not only five centuries,
but also the leap into electronic typesetting, remaining essentially
unchanged. sn book. It has survived not only five centuries, but also
the leap into electronic typesetting, remaining essentially unchanged.</p>
</div>
</div>
<div class="row2">
<div class="section1">
<h2 class="subtitle">What&#8217;s New</h2>
<p><strong>Lorem Ipsum is simply dummy text of the<br>
printing and typesetting industry.</strong><br>
Lorem Ipsum has been the industry's standard<br>
dummy text ever since the 1500s, when an<br>
unknown printer took a galley of type and</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><a href="#" class="more">read more</a></p>
</div>
<div class="section2">
<h2 class="subtitle">Resources</h2>
<p><strong>Lorem Ipsum is simply dummy text of the printing and
typesetting industry.</strong><br>
Lorem Ipsum has been the industry's standard dummy text ever since the
1500s, when an unknown printer took a galley of type and scrambled it
to make a type specimen book. It has survived not only five centuries,
but</p>
<p>&nbsp;</p>
<p><a href="#" class="more">read more</a></p>
</div>
</div>
</div>
<div class="content-right">
<h2>Main Menu</h2>
<ul>
  <li style="border-top: medium none;"><a href="#">Link 1</a></li>
  <li><a href="#">Link 2</a></li>
  <li><a href="#">Link 3</a></li>
  <li><a href="#">Link 4</a></li>
  <li><a href="#">Link 5</a></li>
  <li><a href="#">Link 6</a></li>
  <li><a href="#">Link 7</a></li>
  <li><a href="#">Link 8</a></li>
  <li><a href="#">Link 9</a></li>
  <li><a href="#">Link 10</a></li>
</ul>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>
</div>
</div>
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
<p>&copy; Copyright 2010. Designed by <a target="_blank"
 href="http://www.htmltemplates.net">htmltemplates.net</a></p>
<!--Designed by--><a href="http://www.htmltemplates.net">
<img src="images/footnote.gif" class="copyright" alt="html templates"></a></div>
<!--In partnership with--><a href="http://www.casinotemplates.net">
<img src="images/footnote.gif" class="copyright" alt="casinotemplates.net"></a>
<!--DO NOT Remove The Footer Links-->
</div>
</div>
</div>
</body>
</html>
