<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<header id="header">
	<!-- Logo -->
	<%
		if (session.getAttribute("memEmail") == null) {
	%>
	<a id="logo" class="brand" href="index.jsp"><img
		src="./images/logo.png"></a>
	<%
		} else {
	%>
	<a id="logo" class="brand" href="main.jsp"><img
		src="./images/logo.png"></a>
	<!-- Nav -->
	<div class="navbar">
		<div class="junseok11" style="float: right;">
			<ul>
				<li><span class="font_GODOM">&lt; <%=session.getAttribute("memEmail")%>님
						환영합니다. &gt;
				</span></li>
				<li><a class="font_GODOM" href="signout.jsp">로그아웃</a></li>
			</ul>
		</div>
	</div>
	<%
		}
	%>
	<%
		//if(request.getRequestURL().toString()
		//		.equals("http://mypi.co.kr/main.jsp")) {
		if (request.getRequestURL().toString()
				.equals("http://localhost:8080/MyPI/main.jsp")) {
	%>

	<!-- Search Bar -->
	<div id="searchBar">
				<!-- Search Button -->
		<button id="search"><img src="./images/icon/search.png"></button>
		<!-- Basic Filter -->
		<button id="email" class="basic-filter"><img src="./images/icon/email.png"></button>
		<!-- Extended Filter -->
		<button id="name" class="filter"><img src="images/icon/name.png"></button>
		<button id="cellphone" class="filter"><img  src="images/icon/cellphone.png"></button>
		<button id="homephone" class="filter"><img src="images/icon/homephone.png"></button>
		<button id="birthday"class="filter"><img src="images/icon/birthday.png"></button>
		<button id="address" class="filter"><img src="images/icon/address.png"></button>
		<button id="school" class="filter"><img src="images/icon/school.png"></button>
		<button id="workplace" class="filter"><img src="images/icon/workplace.png"></button>
		<button id="occupation" class="filter"><img src="images/icon/occupation.png"></button>
		<!-- Filter Toggle -->
		<button id="open-filter" class="toggle-filter"><img src="./images/icon/plus.png"></button>
		<button id="close-filter" class="toggle-filter" style="display: none"><img src="./images/icon/minus.png"></button>


	</div>


	<!-- Modal Dialog -->
	<div id="dialog-form" title="Change Information" style="display: none">
		<p class="validateTips">Change Information.</p>

		<form>
			<fieldset>
				<label for="name">Name</label> <input type="text" name="name"
					id="name" class="text ui-widget-content ui-corner-all">
			</fieldset>
		</form>
	</div>
	<%
		}
	%>
</header>