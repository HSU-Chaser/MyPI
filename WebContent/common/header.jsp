<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- Header -->
<header id="header">
	<!-- Logo -->
	<a id="logo" class="brand" href="main.jsp"><h1 class="junseok1">∑
			π</h1></a>
	<!-- Nav -->
	<div class="navbar">
		<div class="junseok11" style="float: right;">
			<ul>
				<%
					if (session.getAttribute("memEmail") == null) {
				%>
				<script type="text/javascript">
					alert("로그인 정보가 없습니다.");
					location.replace("index.jsp");
				</script>
				<%
					} else {
				%>
				<li><span class="font_GODOM">&lt; <%=session.getAttribute("memEmail")%>님
						환영합니다. &gt;
				</span></li>
				<!-- <li><a class="font_GODOM" href="signout.jsp">로그아웃</a></li> -->
				<%
					}
				%>
			</ul>
		</div>
	</div>

	<!-- Search Bar -->
	<div id="searchBar"
		style="top: 7.6%; position: fixed; background-color: rgba(234, 234, 234, 0.4)">
		<!-- Basic Filter -->
		<div id="searchFilter" style="float: left; margin-left: 1px">
			<!-- Default Filter -->
			<img id="email" src="./images/icon/email.png"
				onclick="_onEditInfo(email)">
		</div>
		<!-- Extended Filter -->
		<div id="moreFilter"
			style="display: none; float: left; margin-left: 1px">
			<img id="name" src="./images/icon/name.png"
				onclick="_onEditInfo(name)"> <img id="cellphone"
				src="./images/icon/cellphone.png" onclick="_onEditInfo(cellphone)">
			<img id="homephone" src="./images/icon/homephone.png"
				onclick="_onEditInfo(homephone)"> <img id="birthday"
				src="./images/icon/birthday.png" onclick="_onEditInfo(birthday)">
			<img id="address" src="./images/icon/address.png"
				onclick="_onEditInfo(address)"> <img id="school"
				src="./images/icon/school.png" onclick="_onEditInfo(school)">
			<img id="workplace" src="./images/icon/workplace.png"
				onclick="_onEditInfo(workplace)"> <img id="occupation"
				src="./images/icon/occupation.png" onclick="_onEditInfo(occupation)">
		</div>
		<!-- Filter Toggle -->
		<div id="toggleFilter" style="float: left; margin-left: 1px">
			<img id="extendButton" src="./images/icon/plus.png"
				onclick="_onFilterExtend()">
		</div>

		<!-- Search Button -->
		<div id="searchbutton" style="float: right; margin-right: 1px">
			<button id="search" class="button small font_GODOM"
				onclick="_onLoadData()">검색</button>
		</div>
	</div>

	<!-- Modal Dialog -->
	<div id="changeForm" class="ui-widget" title="정보수정"
		style="width: 350px; margin: 20px 0; display: none;">
		<form>
			<fieldset style="padding: 0; border: 0; margin-top: 25px;">
				<label for="inputInfo" style="display: block;">정보입력</label> <input
					type="text" value="" class="text ui-widget-content ui-corner-all"
					style="display: block;">
			</fieldset>
		</form>
	</div>


</header>