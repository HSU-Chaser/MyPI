<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String email = (String) session.getAttribute("memEmail");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);
%>
<body>
<form method="post" action="changeInfoProcess.jsp" name="infoType">
		<table width="600" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td colspan="2" height="39" align="center"><font size="+1"><b>회원
							정보 수정</b></font></td>
			</tr>
			<tr>
				<td colspan="2" class="normal" align="center">회원의 정보를 수정합니다.</td>
			</tr>
			<tr>
				<td width="200">사용자 이메일</td>
				<td width="400"><%=c.getEmail() %></td>
			</tr>
			<tr>
				<td width="200">비빌번호</td>
				<td width="400"><input type="password" id = "password" name="password" size="10"
					value ="<%=c.getPassword() %>" maxlength="15"></td>
			</tr>
			<tr>
				<td width="200">이름</td>
				<td width="400"><input type="text" id = "name" name="name" size="10"
					maxlength="10" value ="<%=c.getName()%>"></td>
			</tr>
			<tr>
				<td width="200">핸드폰번호</td>
				<td width="400"><input type="text" name="cellphone" size="10"
					maxlength="20" value ="<%=c.getCellphone()%>"></td>
			</tr>
			<tr>
				<td width="200">집번호</td>
				<td width="400"><input type="text" name="homephone" size="10"
					maxlength="20" value ="<%=c.getHomephone()%>"></td>
			</tr>
			<tr>
				<td width="200">생년월일</td>
				<td width="400"><input type="text" name="birthday" size="10"
					maxlength="10" value ="<%=c.getBirthday()%>"></td>
			</tr>
			<tr>
				<td width="200">집주소</td>
				<td width="400"><input type="text" name="address" size="10"
					maxlength="30" value ="<%=c.getAddress()%>"></td>
			</tr>
			<tr>
				<td width="200">학교</td>
				<td width="400"><input type="text" name="school" size="10"
					maxlength="10" value ="<%=c.getSchool()%>"></td>
			</tr>
			<tr>
				<td width="200">직장</td>
				<td width="400"><input type="text" name="workplace" size="10"
					maxlength="10" value ="<%=c.getWorkplace()%>"></td>
			</tr>
			<tr>
				<td width="200">직업</td>
				<td width="400"><input type="text" name="occupation" size="10"
					maxlength="10" value ="<%=c.getOccupation()%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="modify" value="수  정"> <input type="button"
					value="취  소" onclick="javascript:window.location='index.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>