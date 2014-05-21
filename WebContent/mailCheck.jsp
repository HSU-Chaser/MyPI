<%@page import="main.logon.Encryptor"%>
<%@page import="main.logon.MailService"%>
<%@ page import="main.logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<%
		String email = request.getParameter("email");
		LogonDBBean manager = LogonDBBean.getInstance();

		int check = manager.confirmEmail(email);
		if (check == 1) {
	%>
	<span style="color: red"><%=email%>은 이미 사용중인 이메일입니다.</span>
	<%
		} else {
			String certKey = Encryptor.encryptMD5();
			String from = "noreply@mypi.co.kr";
			String to = email;
			String subject = "[MyPI] 회원가입 인증 코드";
			String content = "회원님의 인증 코드는<br>" + certKey
					+ "<br>입니다.<br><br>이 메일은 발신전용 메일입니다.";
			MailService.send(from, to, subject, content);
	%>
	<span style="color: green"><%=email%>로 인증 메일은 전송하였습니다.</span>
	<%
		}
	%>
</body>
</html>