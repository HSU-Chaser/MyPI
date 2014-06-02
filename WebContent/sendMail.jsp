<%@page import="main.logon.Encryptor"%>
<%@page import="main.logon.MailService"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 메일 전송
	String name = request.getParameter("name");
	String from = request.getParameter("from");
	String to = "mill397@naver.com";
	String subject = "[MyPI] " + name + "님의 Contact 메일";
	String content = request.getParameter("content");
	
	System.out.println("from: " + from);
	System.out.println("to: " + to);
	System.out.println("subject: " + subject);
	System.out.println("content: " + content);
	
	if (MailService.send(from, to, subject, content)) {
		out.print("true");
	} else {
		out.print("false");
	}
%>
