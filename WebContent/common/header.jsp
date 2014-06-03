<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<header id="header">
	<!-- Logo -->
	
	<%
		if (session.getAttribute("memEmail") == null) {
	%>
		<a id="logo" class="brand" href="main.jsp"><img
		src="./images/ihfb/main_logo/pi_144x44.png"></a>
	<%
		} else {
	%>
	<a id="logo" class="brand" href="main.jsp"><img
		src="./images/ihfb/main_logo/pi_144x44.png"></a>
	<!-- Nav -->
	<div class="navbar">
		<span class="comment font_GODOM">&lt; <%=session.getAttribute("memEmail")%>님
					환영합니다. &gt;
		</span>
		<a class="font_GODOM" href="signout.jsp"><img src="./images/signout1.png"
		style="width: 35px;"></a>
	</div>
	<%
		}
	%>
	<%
		String path = request.getRequestURI();
		int start = path.lastIndexOf("/");
		int end = path.length();
		if (path.substring(start + 1, end).equals("main.jsp")) {
	%>
	
	<jsp:include page="/common/modal_content.jsp" />
	
	<!-- Search Bar -->
	<div id="searchBar">
		<!-- Search Button -->
		<button id="search" class="ui-button">
			<img src="images/icon/search.png">
		</button>
		<!-- Basic Filter -->
		<div class="mobileCut">
			<button id="email" class="basic-filter ui-button">
				<img src="images/icon/email.png">
			</button>
			<!-- Extended Filter -->
			<button id="name" class="filter ui-button md-trigger"
				data-modal="name">
				<img src="images/icon/name.png">
			</button>
			<button id="cellphone" class="filter ui-button md-trigger"
				data-modal="cellphone">
				<img src="images/icon/cellphone.png">
			</button>
			<button id="homephone" class="filter ui-button md-trigger"
				data-modal="homephone">
				<img src="images/icon/homephone.png">
			</button>
			<button id="birthday" class="filter ui-button md-trigger"
				data-modal="birthday">
				<img src="images/icon/birthday.png">
			</button>
		</div>
		<div class="mobileCut">
			<button id="address" class="filter ui-button md-trigger"
				data-modal="address">
				<img src="images/icon/address.png">
			</button>
			<button id="school" class="filter ui-button md-trigger"
				data-modal="school">
				<img src="images/icon/school.png">
			</button>
			<button id="workplace" class="filter ui-button md-trigger"
				data-modal="workplace">
				<img src="images/icon/workplace.png">
			</button>
			<button id="occupation" class="filter ui-button md-trigger"
				data-modal="occupation">
				<img src="images/icon/occupation.png">
			</button>
			<!-- Filter Toggle -->
			<button id="open-filter" class="toggle-filter ui-button">
				<img src="images/icon/plus.png">
			</button>
			<button id="close-filter" class="toggle-filter ui-button">
				<img src="images/icon/minus.png">
			</button>
		</div>
	</div>
	
	<div class="md-overlay"></div>
	
	<%
		}
	%>
</header>