<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="main.logon.LogonDBBean"%>

<%
	request.setCharacterEncoding("euc-kr");
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

	<link href="style.css" rel="stylesheet" type="text/css">
	<table width="270" border="0" cellspacing="0" cellpadding="5"
		align="center">
		<tr>
			<td><font size="+1"><b>ȸ��������
						�����Ǿ����ϴ�.</b></font></td>
		</tr>
		<tr>
			<td align="center">
				<form>
					<input type="button" value="��������"
						onclick="window.location='index.jsp'">
				</form> 5���Ŀ� �������� �̵��մϴ�.
				<meta http-equiv="Refresh" content="5;url=index.jsp">
			</td>
		</tr>
	</table>
</body>
</html>
