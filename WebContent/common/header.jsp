<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<header id="header">
	<!-- Logo -->

	<%
		if (session.getAttribute("memEmail") == null) {
	%>

	<a id="logo" class="brand" href="index.jsp"><img
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
		</span> <a class="font_GODOM" href="signout.jsp"><img
			src="./images/signout1.png" style="width: 35px;"></a>
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

	<!-- Search Bar -->
	<div id="searchBar">
		<!-- Search Button -->
		<img id="search" class="ui-button" src="images/icon/search.png">

		<!-- Basic Filter -->
		<div class="mobileCut">
			<img id="emailIcon" class="basic-filter"
				src="images/icon/email_p.png"> <span id="separator"></span>
			<!-- Extended Filter -->
			<img id="nameIcon" class="ui-button filter md-trigger"
				data-modal="name" src="images/icon/my_name.png"> <img
				id="cellphoneIcon" class="ui-button filter md-trigger"
				data-modal="cellphone" src="images/icon/my_mobile.png"> <img
				id="homephoneIcon" class="ui-button filter md-trigger"
				data-modal="homephone" src="images/icon/my_phone.png"> <img
				id="birthdayIcon" class="ui-button filter md-trigger"
				data-modal="birthday" src="images/icon/my_birthday.png">
		</div>

		<div class="mobileCut">
			<img id="addressIcon" class="ui-button filter md-trigger"
				data-modal="address" src="images/icon/my_address.png"> <img
				id="schoolIcon" class="ui-button filter md-trigger"
				data-modal="school" src="images/icon/my_school.png"> <img
				id="workplaceIcon" class="ui-button filter md-trigger"
				data-modal="workplace" src="images/icon/my_workplace.png"> <img
				id="occupationIcon" class="ui-button filter md-trigger"
				data-modal="occupation" src="images/icon/my_occupation.png">

			<!-- Filter Toggle -->
			<img id="open-filter" class="ui-button toggle-filter"
				src="images/icon/plus.png"> <img id="close-filter"
				class="ui-button toggle-filter" src="images/icon/minus.png">

		</div>
	</div>

	<div class="md-overlay"></div>
	<jsp:include page="/common/modal_content.jsp" />

	<%
		}
	%>
</header>