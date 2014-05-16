<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="main.logon.LogonDataBean"><jsp:setProperty
		name="member" property="*" /></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPI</title>
</head>
<body>
	<form action="">
		<table>
			<tr>
				<td>인증 키 입력 : </td>
				<td><input type="text"></td>
				<td><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>

</body>
</html>