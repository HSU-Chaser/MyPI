<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="main.logon.LogonDBBean"%>

<html>
<head>
<title>Email �ߺ�Ȯ��</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String email = request.getParameter("email");
	LogonDBBean manager = LogonDBBean.getInstance();

	int check = manager.confirmEmail(email);
%>

<body>
	<%
		if (check == 1) {
	%>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td height="39"><%=email%>�̹� ������� �̸����Դϴ�.</td>
		</tr>
	</table>
	<form name="checkForm" method="post" action="confirmId.jsp">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center">�ٸ� �̸����� ����ϼ���.
					<p>
						<input type="text" size="10" maxlength="12" name="id"> <input
							type="submit" value="�̸����ߺ�Ȯ��">
				</td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center"><p>
					�Է��Ͻ�
					<%=email%>�� ����Ͻ� �� �ִ� �̸����Դϴ�. <input type="button" value="�ݱ�"
						onclick="setEmail()"></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>
<script language="javascript">
<!-- 
      function setEmail()
      {
            opener.document.userinput.email.value emailemail %>
	";
		self.close();
	}
	-->
</script>