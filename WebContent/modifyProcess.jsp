<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.LogonDBBean"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="main.logon.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<html>
<body>

	<%
		String email = (String) session.getAttribute("memId");
		member.setEmail(email);
		LogonDBBean manager = LogonDBBean.getInstance();
		manager.updateMember(member);
	%>

	<table width="270" border="0" cellspacing="0" cellpadding="5"
		align="center">
		<tr>
			<td><font size="+1"><b>회원정보가 수정되었습니다.</b></font></td>
		</tr>
		<tr>
			<td align="center">
				<form>
					<input type="button" value="메인으로"
						onclick="window.location='main.jsp'">
				</form> 5초후에 메인으로 이동합니다.
				<meta http-equiv="Refresh" content="5;url=main.jsp">
			</td>
		</tr>
	</table>
</body>
</html>
