<%@ page import="main.logon.MailService"%>
<%@ page import="main.logon.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="member" class="main.logon.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	member.setCertKey(); // 인증 키 생성
	LogonDBBean manager = LogonDBBean.getInstance();
	manager.insertMember(member);

	MailService mailService = new MailService();
	mailService.send("noreply@mypi.co.kr", member.getEmail(),
			"[MyPI] 회원가입 인증 코드",
			"회원님의 인증 코드는 <br>" + member.getCertKey() + "<br> 입니다.");

	response.sendRedirect("main.jsp");
%>
