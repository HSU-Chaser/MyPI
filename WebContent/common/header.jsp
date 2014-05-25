<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<header id="header">
	<!-- Logo -->
	<a id="logo" class="brand" href="main.jsp"><h1 class="junseok1">∑
				π</h1></a>
	<!-- Nav -->

	<div class="navbar">
		<div class="junseok11" style="float: right;">
			<ul>
				<!--
				<%
					if (session.getAttribute("memEmail") == null) {
				%>
				<script language="JavaScript">
					if (!alert("로그인 정보가 없습니다."))
						location.replace("index.jsp");
				</script>
				<%
					} else {
				%>
				<li><span class="font_GODOM">&lt; <%=session.getAttribute("memEmail")%>님
						환영합니다. &gt;
				</span></li>
				<li><a class="font_GODOM" href="signout.jsp">로그아웃</a></li>
				<%
					}
				%>
				-->
				<li><a class="font_GODOM">&lt; <%=session.getAttribute("memEmail")%>님
						환영합니다. &gt;
				</a><button></button></li>
			</ul>
		</div>
	</div>
</header>