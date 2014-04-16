<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="fourleaf.logon.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="member" class="fourleaf.logon.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	LogonDBBean manager = LogonDBBean.getInstance();
	manager.insertMember(member);

	response.sendRedirect("loginForm.jsp");
%>
