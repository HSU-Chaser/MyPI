<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="main.logon.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="member" class="main.logon.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	LogonDBBean manager = LogonDBBean.getInstance();
	manager.insertMember(member);

	response.sendRedirect("loginForm.jsp");
%>
