<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="main.logon.LogonDBBean"%>

<html>
<head>
<title>ȸ�� Ż��</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">

<%
	String email = (String) session.getAttribute("memEmail");
	String password = request.getParameter("password");
	LogonDBBean manager = LogonDBBean.getInstance();

	int check = manager.deleteMember(email, password);

	if (check == 1) {
		session.invalidate();
%>

<body>
	<form method="post" action="index.jsp" name="userinput">
		<table width="270" border="0" cellspacing="0" cellpadding="5"
			align="center">
			<tr>
				<td height="39" align="center"><font size="+1"><b>ȸ��������
							�����Ǿ����ϴ�.</b></font></td>
			</tr>
			<tr>
				<td align="center">
					<p>
						�ȳ��� ������.
						<meta http-equiv="Refresh" content="5;url=index.jsp">
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="Ȯ��"></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>