<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
<header id="header">
	<!-- Logo -->
	<!--<h1 id="logo"><a href="index.jsp"><pre>∑ π</pre></a></h1>-->

	<!-- Nav -->

	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar junseok10" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"> </span> <span
					class="icon-bar"> </span> <span class="icon-bar"> </span>
				</a> <a id="logo" class="brand" href="main.jsp"><h1 class="junseok1">∑
						π</h1></a>
				<div class="nav-collapse collapse junseok11">
					<ul class="nav pull-right">
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
						<li><a class="font_HYNAML" href="signout.jsp">&lt; <%=session.getAttribute("memEmail")%>님
								환영합니다. &gt;
						</a></li>
						<%
							}
						%>
						<li class="active"><a href="main.jsp">Home</a></li>
						<li><a href="changeInfo.jsp">Change Info</a></li>
						<li><a href="how.jsp">How To</a></li>
						<li><a href="play.jsp">Play With</a></li>
						<li><a href="contact.jsp">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>