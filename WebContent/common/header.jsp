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
		String path = request.getRequestURI();
		int start = path.lastIndexOf("/");
		int end = path.length();
		if (path.substring(start + 1, end).equals("main.jsp")) {
	%>

	<!-- Search Bar -->
	<div id="searchBar">
		<!-- Search Button -->
		<button id="search" class="ui-button">
			<img src="images/icon/search.png">
		</button>
		<!-- Basic Filter -->
		<div style="float: left;">
			<button id="email" class="basic-filter ui-button">
				<img src="images/icon/email.png">
			</button>
			<!-- Extended Filter -->
			<button id="name" class="filter ui-button md-trigger"
				data-modal="modal-12">
				<img src="images/icon/name.png">
			</button>
			<button id="cellphone" class="filter ui-button md-trigger"
				data-modal="modal-12">
				<img src="images/icon/cellphone.png">
			</button>
			<button id="homephone" class="filter ui-button md-trigger"
				data-modal="modal-12">
				<img src="images/icon/homephone.png">
			</button>
			<button id="birthday" class="filter ui-button md-trigger"
				data-modal="modal-12">
				<img src="images/icon/birthday.png">
			</button>
		</div>
		<div style="float: left;">
			<button id="address" class="filter ui-button md-trigger"
				data-modal="modal-12">
				<img src="images/icon/address.png">
			</button>
			<button id="school" class="filter ui-button md-trigger"
				data-modal="modal-12">
				<img src="images/icon/school.png">
			</button>
			<button id="workplace" class="filter ui-button md-trigger"
				data-modal="modal-12">
				<img src="images/icon/workplace.png">
			</button>
			<button id="occupation" class="filter ui-button md-trigger"
				data-modal="modal-12">
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

	<!-- Modal Dialog -->
	<div class="md-modal md-effect-12" id="modal-12">
		<div class="md-content">
			<h3 class="fond_GODOM">회원정보 수정</h3>
			<button>닫기</button>
		</div>
	</div>
	<div class="md-overlay"></div>
	<script src="js/effecter/classie.js"></script>
	<script src="js/effecter/modalEffects.js"></script>
	<script>
		// this is important for IEs
		var polyfilter_scriptpath = '/js/';
	</script>
	<script src="js/effecter/cssParser.js"></script>
	<script src="js/effecter/css-filters-polyfill.js"></script>
	<%
		}
	%>
</header>