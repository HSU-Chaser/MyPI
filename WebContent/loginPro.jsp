<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="fourleaf.logon.LogonDBBean"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
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

<jsp:forward page="main.jsp" />

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

