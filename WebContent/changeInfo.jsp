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

<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<%
	String email = (String) session.getAttribute("memEmail");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);

	try {
%>
<body>
	<jsp:include page="/common/header.jsp" />

	<!-- Change Info -->
	<%
		if (c.getCertStatus() == false) {
	%>
	<form action="mailCert.jsp" method="post" name="certinput">
	<table>
	<tr><td>인증코드</td></tr>
		<tr>
			<td>인증번호 입력 :</td>
			<td><input type="text" name="cert" id="cert"></td>
			<td><input type="submit" name ="submit" class ="button junseok9" value="제출">
		</tr>
	</table>
	</form>
	<%
		} else {
	%>
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
						<td width="200">사용자 이메일</td>
						<td width="400"><%=c.getEmail()%></td>
					</tr>
					<tr>
						<td width="200">비밀번호</td>
						<td width="400"><input type="password" name="passwd"
							size="10" maxlength="10"></td>
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

	<jsp:include page="/common/footer.jsp" />

</body>
<%
	}
	} catch (Exception e) {
	}
%>
</html>
