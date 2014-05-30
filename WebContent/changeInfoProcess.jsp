<%@page import="main.logon.LogonDataBean"%>
<%@page import="main.logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// Get Email
	String email = (String) session.getAttribute("memEmail");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);

	// Get Change Type
	String infoType = request.getParameter("infoType");

	if (infoType.equals("name")) {

	} else if (infoType.equals("cellphone")) {
	} else if (infoType.equals("homephone")) {
	} else if (infoType.equals("birthday")) {
	} else if (infoType.equals("address")) {
	} else if (infoType.equals("school")) {
	} else if (infoType.equals("workplace")) {
	} else if (infoType.equals("occupation")) {
	}
%>