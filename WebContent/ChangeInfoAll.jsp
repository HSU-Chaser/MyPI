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
	<%
		if (request.getSession().getAttribute("memEmail") == null) {
	%>
	<script>
		alert("로그인을 하셔야 합니다.");
		location.replace("index.jsp");
	</script>
	<%
		} else {
	%>
	<form method="post" action="ChangeInfoAllProcess.jsp"
		name="userinput_name" onSubmit="return checkIt()">
		<table>
			<tr>
				<%
					if (c.getName().equals("null")) {
				%>
				<td class="modal_text_text font_GODOM">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="name"> <input type="text"
					name="modal_name" id="modal_name" class="color font_GODOM"
					size="10" maxlength="10" placeholder="홍길동"
					onblur="_onCheckName(this.form)"> <%
 	} else {
 %>
				<td class="modal_text font_GODOM">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="name"> <input type="text"
					name="modal_name" id="modal_name" class="color font_GODOM"
					size="10" maxlength="10" value="<%=c.getName()%>"
					onblur="_onCheckName(this.form)"> <%
 	}
 %>
					<div id="name_err" class="errMsg"></div></td>

			</tr>
			<tr>
				<td class="modal_text font_GODOM">전 화 번 호</td>
				<td class="signup_form font_GODOM">
					<%
						if (c.getCellphone().equals("null")) {
					%> <input type="hidden" name="type" value="cellphone"> <input
					type="text" name="modal_cellphone1" id="modal_cellphone1"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="010" onblur="_onCheckCellphone(this.form)"> <input
					type="text" name="modal_cellphone2" id="modal_cellphone2"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="1234" onblur="_onCheckCellphone(this.form)"> <input
					type="text" name="modal_cellphone3" id="modal_cellphone3"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="5678" onblur="_onCheckCellphone(this.form)"> <%
 	} else {
 			String cell1 = c.getCellphone().substring(0, 3);
 			String cell2 = "null";
 			if (c.getCellphone().length() == 12)
 				cell2 = c.getCellphone().substring(4, 7);
 			else if (c.getCellphone().length() == 13)
 				cell2 = c.getCellphone().substring(4, 8);
 			String cell3 = "null";
 			if (c.getCellphone().length() == 12)
 				cell3 = c.getCellphone().substring(8, 12);
 			else if (c.getCellphone().length() == 13)
 				cell3 = c.getCellphone().substring(9, 13);
 %> <input type="hidden" name="type" value="cellphone"> <input
					type="text" name="modal_cellphone1" id="modal_cellphone1"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					value="<%=cell1%>" onblur="_onCheckCellphone(this.form)"> <input
					type="text" name="modal_cellphone2" id="modal_cellphone2"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					value="<%=cell2%>" onblur="_onCheckCellphone(this.form)"> <input
					type="text" name="modal_cellphone3" id="modal_cellphone3"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					value="<%=cell3%>" onblur="_onCheckCellphone(this.form)"> <%
 	}
 %>
					<div id="cellphone_err" class="errMsg"></div>
				</td>
			</tr>
			<tr>
				<%
					if (c.getHomephone().equals("null")) {
				%>
				<td class="modal_text font_GODOM">전 화 번 호</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="homephone"> <input type="text"
					name="modal_homephone1" id="modal_homephone1"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="02" onblur="_onCheckHomephone(this.form)"> <input
					type="text" name="modal_homephone2" id="modal_homephone2"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="1234" onblur="_onCheckHomephone(this.form)"> <input
					type="text" name="modal_homephone3" id="modal_homephone3"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="5678" onblur="_onCheckHomephone(this.form)"> <%
 	} else {
 			String home1 = "null";
 			if (c.getHomephone().substring(0, 3).equals("02-")
 					&& c.getHomephone().length() == 11)
 				home1 = c.getHomephone().substring(0, 2);
 			else if (c.getHomephone().length() == 12)
 				home1 = c.getHomephone().substring(4, 7);
 			else if (c.getHomephone().length() == 13)
 				home1 = c.getHomephone().substring(4, 8);

 			String home2 = "null";
 			if (c.getHomephone().substring(0, 3).equals("02-")
 					&& c.getHomephone().length() == 11)
 				home2 = c.getHomephone().substring(3, 6);
 			else if (c.getHomephone().length() == 12)
 				home2 = c.getHomephone().substring(4, 7);
 			else if (c.getHomephone().length() == 13)
 				home2 = c.getHomephone().substring(4, 8);

 			String home3 = "null";
 			if (c.getHomephone().substring(0, 3).equals("02-")
 					&& c.getHomephone().length() == 11)
 				home3 = c.getHomephone().substring(7, 11);
 			else if (c.getHomephone().length() == 12)
 				home3 = c.getHomephone().substring(8, 12);
 			else if (c.getHomephone().length() == 13)
 				home3 = c.getHomephone().substring(9, 13);
 %>
				<td class="modal_text font_GODOM">전 화 번 호</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="homephone"> <input type="text"
					name="modal_homephone1" id="modal_homephone1"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					value="<%=home1%>" onblur="_onCheckHomephone(this.form)"> <input
					type="text" name="modal_homephone2" id="modal_homephone2"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					value="<%=home2%>" onblur="_onCheckHomephone(this.form)"> <input
					type="text" name="modal_homephone3" id="modal_homephone3"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					value="<%=home3%>" onblur="_onCheckHomephone(this.form)"> <%
 	}
 %>
					<div id="homephone_err" class="errMsg"></div></td>
			</tr>
			<tr>
				<%
					if (c.getBirthday().equals("null")) {
				%>
				<td class="modal_text font_GODOM">생 년 월 일</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="birthday"> <input type="text"
					name="modal_birthday1" id="modal_birthday1"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="1990" onblur="_onCheckBirthday(this.form)"> <input
					type="text" name="modal_birthday2" id="modal_birthday2"
					class="color font_GODOM inputSize" size="10" maxlength="2"
					placeholder="07" onblur="_onCheckBirthday(this.form)"> <input
					type="text" name="modal_birthday3" id="modal_birthday3"
					class="color font_GODOM inputSize" size="10" maxlength="2"
					placeholder="14" onblur="_onCheckBirthday(this.form)"> <%
 	} else {
 			String birth1 = "null";
 			birth1 = c.getBirthday().substring(0, 4);
 			String birth2 = "null";
 			birth2 = c.getBirthday().substring(5, 7);
 			String birth3 = "null";
 			birth3 = c.getBirthday().substring(8, 10);
 %>
				<td class="modal_text font_GODOM">생 년 월 일</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="birthday"> <input type="text"
					name="modal_birthday1" id="modal_birthday1"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					value="<%=birth1%>" onblur="_onCheckBirthday(this.form)"> <input
					type="text" name="modal_birthday2" id="modal_birthday2"
					class="color font_GODOM inputSize" size="10" maxlength="2"
					value="<%=birth2%>" onblur="_onCheckBirthday(this.form)"> <input
					type="text" name="modal_birthday3" id="modal_birthday3"
					class="color font_GODOM inputSize" size="10" maxlength="2"
					value="<%=birth3%>" onblur="_onCheckBirthday(this.form)"> <%
 	}
 %>
					<div id="birthday_err" class="errMsg"></div></td>
			</tr>
			<tr>
				<%
					if (c.getAddress().equals("null")) {
				%>
				<td class="modal_text font_GODOM">집 주 소</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="address"><input type="text"
					name="modal_address" id="modal_address" class="color font_GODOM"
					size="10" maxlength="35" placeholder="서울 성북구 삼선1동"
					onblur="_onCheckAddress(this.form)"> <%
 	} else {
 %>
				<td class="modal_text font_GODOM">집 주 소</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="address"><input type="text"
					name="modal_address" id="modal_address" class="color font_GODOM"
					size="10" maxlength="35" value="<%=c.getAddress()%>"
					onblur="_onCheckAddress(this.form)"> <%
 	}
 %>
					<div id="address_err" class="errMsg"></div></td>
			</tr>
			<tr>
				<%
					if (c.getSchool().equals("null")) {
				%>
				<td class="modal_text font_GODOM">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="school"><input type="text"
					name="modal_school" id="modal_school" class="color font_GODOM"
					size="10" maxlength="10" placeholder="한 성 대"
					onblur="_onCheckSchool(this.form)"> <%
 	} else {
 %>
				<td class="modal_text font_GODOM">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="school"><input type="text"
					name="modal_school" id="modal_school" class="color font_GODOM"
					size="10" maxlength="10" value="<%=c.getSchool()%>"
					onblur="_onCheckSchool(this.form)"> <%
 	}
 %>
					<div id="school_err" class="errMsg"></div></td>
			</tr>
			<tr>
				<%
					if (c.getWorkplace().equals("null")) {
				%>
				<td class="modal_text font_GODOM">직 장 주 소</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="workplace"><input type="text"
					name="modal_workplace" id="modal_workplace"
					class="color font_GODOM" size="10" maxlength="35"
					placeholder="한 성 대" onblur="_onCheckWorkplace(this.form)">
					<%
						} else {
					%>
				<td class="modal_text font_GODOM">직 장 주 소</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="workplace"><input type="text"
					name="modal_workplace" id="modal_workplace"
					class="color font_GODOM" size="10" maxlength="35"
					value="<%=c.getWorkplace()%>" onblur="_onCheckWorkplace(this.form)">
					<%
						}
					%>
					<div id="workplace_err" class="errMsg"></div></td>
			</tr>
			<tr>
				<%
					if (c.getOccupation().equals("null")) {
				%>
				<td class="modal_text font_GODOM">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="occupation"><input type="text"
					name="modal_occupation" id="modal_occupation"
					class="color font_GODOM" size="10" maxlength="10" placeholder="학 생"
					onblur="_onCheckOccupation(this.form)"> <%
 	} else {
 %>
				<td class="modal_text font_GODOM">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="occupation"><input type="text"
					name="modal_occupation" id="modal_occupation"
					class="color font_GODOM" size="10" maxlength="10"
					value="<%=c.getOccupation()%>"
					onblur="_onCheckOccupation(this.form)"> <%
 	}
 %>
					<div id="occupation_err" class="errMsg"></div></td>
			</tr>
			<tr>
				<td class="modal_text" align="center"><input type="submit"
					name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
				<td class="modal_text" align="center"><input type="button"
					class="button addButton font_GODOM md-close" value=" 취소 "></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>