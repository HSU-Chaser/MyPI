<%@page import="main.logon.Encryptor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.LogonDBBean"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String email = request.getParameter("fid");
	String password = request.getParameter("fpass");
	Encryptor encryptor = new Encryptor();
	password = encryptor.encrypt(password);
	LogonDBBean manager = LogonDBBean.getInstance();

	String emailcheck = request.getParameter("saveEmail");

	if (emailcheck != null && emailcheck.equals("on")) {
		Cookie cookie = new Cookie("email", email);
		cookie.setMaxAge(60 * 60);
		response.addCookie(cookie);
	} else {
		Cookie cookie = new Cookie("email", email);
		cookie.setMaxAge(0);
	}

	int check = manager.userCheck(email, password);

	if (check == 1) {
		session.setAttribute("memEmail", email);
		response.sendRedirect("main.jsp");
	} else if (check == 0) {
%>

<jsp:forward page="index.jsp" />

<script>
	alert("비밀번호가 틀렸습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 틀렸습니다.");
	history.go(-1);
</script>
<%
	}
%>

