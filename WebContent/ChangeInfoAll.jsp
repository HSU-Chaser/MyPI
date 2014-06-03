<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function checkIt() {
		var input = eval("document.userinput");
		if (!input.modal_name.value && !input.modal_cellphone1.value
				&& !input.modal_cellphone2.value
				&& !input.modal_cellphone3.value
				&& !input.modal_homephone1.value
				&& !input.modal_homephone2.value
				&& !input.modal_homephone3.value
				&& !input.modal_birthday1.value && !input.modal_birthday2.value
				&& !input.modal_birthday3.value && !input.modal_address.value
				&& !input.modal_school.value && !input.modal_workplace.value
				&& !input.modal_occupation.value) {
			alert("최소 하나 이상 입력하셔야 합니다.");
			return false;
		}
	}
</script>
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
		} else if (c.getNew_client() == false) {
			response.sendRedirect("main.jsp");
		} else {
	%>
	<form method="post" action="ChangeInfoAllProcess.jsp" name="userinput"
		onSubmit="return checkIt()">
		<table>
			<tr>
				<td class="modal_text_text font_GODOM">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="name"> <input type="text"
					name="modal_name" id="modal_name" class="color font_GODOM"
					size="10" maxlength="10" placeholder="홍길동"
					onblur="_onCheckName(this.form)"></td>

			</tr>
			<tr>
				<td class="modal_text font_GODOM">핸 드 폰</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="cellphone"> <input type="text"
					name="modal_cellphone1" id="modal_cellphone1"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="010" onblur="_onCheckCellphone(this.form)"> <input
					type="text" name="modal_cellphone2" id="modal_cellphone2"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="1234" onblur="_onCheckCellphone(this.form)"> <input
					type="text" name="modal_cellphone3" id="modal_cellphone3"
					class="color font_GODOM inputSize" size="10" maxlength="4"
					placeholder="5678" onblur="_onCheckCellphone(this.form)"></td>
			</tr>
			<tr>
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
					placeholder="5678" onblur="_onCheckHomephone(this.form)"></td>
			</tr>
			<tr>
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
					placeholder="14" onblur="_onCheckBirthday(this.form)"></td>
			</tr>
			<tr>
				<td class="modal_text font_GODOM">집 주 소</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="address"><input type="text"
					name="modal_address" id="modal_address" class="color font_GODOM"
					size="10" maxlength="35" placeholder="서울 성북구 삼선1동"
					onblur="_onCheckAddress(this.form)"></td>
			</tr>
			<tr>
				<td class="modal_text font_GODOM">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="school"><input type="text"
					name="modal_school" id="modal_school" class="color font_GODOM"
					size="10" maxlength="10" placeholder="한 성 대"
					onblur="_onCheckSchool(this.form)"></td>
			</tr>
			<tr>
				<td class="modal_text font_GODOM">직 장 주 소</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="workplace"><input type="text"
					name="modal_workplace" id="modal_workplace"
					class="color font_GODOM" size="10" maxlength="35"
					placeholder="한 성 대" onblur="_onCheckWorkplace(this.form)">
				</td>
			</tr>
			<tr>

				<td class="modal_text font_GODOM">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</td>
				<td class="signup_form font_GODOM"><input type="hidden"
					name="type" value="occupation"><input type="text"
					name="modal_occupation" id="modal_occupation"
					class="color font_GODOM" size="10" maxlength="10" placeholder="학 생"
					onblur="_onCheckOccupation(this.form)"></td>
			</tr>
			<tr>
				<td class="modal_text" align="center"><input type="submit"
					name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
				<td class="modal_text" align="center"><input type="button"
					class="button addButton font_GODOM md-close" onclick ="javascript:window.history.go(-1)" value=" 취소 "></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
</body>
</html>