					<%@ page contentType="text/html;charset=UTF-8" language="java"%>
					<div class="header">
						<div class="header-top">
							<h1>
								 <span></span>
							</h1>
							<p>
								<%
									if (null != session.getAttribute("userin")) {
										if (session.getAttribute("userin").equals(true)) {
								%>
								Здраво !  &nbsp;
								<%=session.getAttribute("username")%>
								
								<%
									}
									} else {
								%><font color="Red">Најавете се !</font>
								<%
									}
								%>
								<br><font color="Red">
								<%
									if (null != session.getAttribute("msg")) {
								%>
								<%=session.getAttribute("msg")%>
								<%
									session.removeAttribute("msg");
								%>
								<%
									}
								%>
								</font>
							</p>
						</div>
						<div class="topmenu">
							<ul>
								<li><a href="login">Најави се</a></li>
								<li><a href="add">Нов Пациент</a></li>
								<li><a href="search">Пребарај Пациент</a></li>
								<li><a href="reports">Извештаи</a></li>
								<!--  <li><a href="#">Детали за Пациент</a></li>-->
								<li><a href="logout">Одјави се</a></li>
							</ul>
						</div>
					</div>