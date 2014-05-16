<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.*"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Team Chaser</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<!--bootstrap-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"
	media="screen" title="no title" charset="utf-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<script language="javascript">
<!--
	function checkIt() {
		var userinput = eval("document.userinput");

		if (!userinput.passwd.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (userinput.passwd.value != userinput.passwd2.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}

		if (!userinput.username.value) {
			alert("사용자 이름을 입력하세요.");
			return false;
		}

		if (!userinput.jumin1.value || !userinput.jumin2.value) {
			alert("주민등록번호를 입력하세요.");
			return false;
		}
	}

	function zipCheck() {
		url = "ZipCheck.jsp?check=y";
		open(url, "post", "toolbar = no, status = yes, menubar = no,"
				+ "scrollbars = yes, directories = no,"
				+ "width = 500, height = 300");
	}
	-->
</script>
<style type="text/css">
table,th,tr,td {
	border: 1px solid red;
}
</style>
<%
	String email = (String) session.getAttribute("memEmail");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);

	try {
%>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>

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
					</a> <a id="logo" class="brand" href="main.jsp"><h1
							class="junseok1">∑ π</h1></a>
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

							<li><a href="main.jsp">Home</a></li>
							<li class="active"><a href="changeInfo.jsp">Change Info</a></li>
							<li><a href="how.jsp">How To</a></li>
							<li><a href="play.jsp">Play With</a></li>
							<li><a href="contact.jsp">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Change Info -->
	<section id="contact" class="main style3 secondary">
		<div class="content container">
			<form method="post" action="modifyProcess.jsp" name="userinput"
				onSubmit="return checkIt()">
				<table width="600" border="1" cellspacing="0" cellpadding="3"
					align="center">
					<tr>
						<td colspan="2" height="39" align="center"><font size="+1"><b>회원
									정보 수정</b></font></td>
					</tr>
					<tr>
						<td colspan="2" class="normal" align="center">회원의 정보를 수정합니다.</td>
					</tr>
					<!-- 					<tr>
						<td width="200"><b>이메일 입력</b></td>
						<td width="400"></td>
					</tr> -->
					<tr>
						<%
							if (c.getCertStatus() == false) {
						%>
						<td><input type="text" /></td>
						<td><input type="submit" /></td>
						<%
							} else {
						%>
						<td>이메일 인증 완료.</td>
						<%
							}
						%>
					</tr>
					<tr>
						<td width="200">사용자 이메일</td>
						<td width="400"><%=c.getEmail()%></td>
					</tr>
					<tr>
						<td width="200">비밀번호</td>
						<td width="400"><input type="password" name="passwd"
							size="10" maxlength="10" value="<%=c.getPassword()%>"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							name="modify" value="수  정"> <input type="button"
							value="취  소" onclick="javascript:window.location='index.jsp'"></td>
					</tr>
				</table>
			</form>
		</div>
	</section>

	<!-- Footer -->
	<footer id="footer">

		<!--
			     Social Icons
			     
			     Use anything from here: http://fortawesome.github.io/Font-Awesome/cheatsheet/)
			-->
		<ul class="actions">
			<li><a href="#" class="fa solo fa-twitter"><span>Twitter</span></a></li>
			<li><a href="#" class="fa solo fa-facebook"><span>Facebook</span></a></li>
			<li><a href="#" class="fa solo fa-google-plus"><span>Google+</span></a></li>
			<li><a href="#" class="fa solo fa-dribbble"><span>Dribbble</span></a></li>
			<li><a href="#" class="fa solo fa-pinterest"><span>Pinterest</span></a></li>
			<li><a href="#" class="fa solo fa-instagram"><span>Instagram</span></a></li>
		</ul>

		<!-- Menu -->
		<ul class="menu">
			<li>&copy; copyright Team My Pi</li>
			<li>Design: J, Develop: s, s, y, o</li>
		</ul>

	</footer>

</body>
<%
	} catch (Exception e) {
	}
%>
</html>