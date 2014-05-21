<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.*"%>
<jsp:useBean id="member" class="main.logon.LogonDataBean"><jsp:setProperty
		name="member" property="*" /></jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPI</title>
</head>
<%
	String email = (String) session.getAttribute("memEmail");
	String certkey = request.getParameter("cert");
	LogonDBBean manager = LogonDBBean.getInstance();
	int key = manager.getCertKey(email, certkey);
%>
<body>
	<%
		if (key == 0) {
	%>
	<script>
		alert("인증에 실패하셨습니다. 인증코드를 다시 입력해 주십시오.");
		history.go(-1);
	</script>
	<%
		} else if (key == 1) {
			manager.updateCertStatus(email);
	%>
	<script>
		alert("인증에 성공하셨습니다.");
		location.replace("main.jsp");
	</script>
	<%
		}
	%>


</body>
</html>
