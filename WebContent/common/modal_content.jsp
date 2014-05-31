<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<style type="text/css">
		border, th, td, tr {
			border: 1px solid white;
		}
	</style>
	<!-- Modal Dialog -->
	<!-- name -->
	<div class="md-modal md-effect-7" id="name">
		<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
<<<<<<< Upstream, based on origin/Algorithm
				<form method="post" action="" name="userinput_name" onSubmit="return checkIt()">
=======
				<form method="post" action="changeInfoProcess.jsp" name="userinput_name"
					onSubmit="return checkIt()">
>>>>>>> 68fd9df changInfoProcess
					<table>
						<tr>
							<td class="signup_text font_GODOM">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
							<td class="signup_form font_GODOM"><input type="hidden" name="type" value="name"><input type="text"
								name="modal_name" id="modal_name" class="color font_GODOM" size="10"
								maxlength="10" placeholder="홍 길 동" onblur="_onCheckName(this.form)">
								<div id="name_err" class="errMsg"></div></td>
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" value=" 취소 "></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- cellphone -->
	<div class="md-modal md-effect-7" id="cellphone">
		<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
<<<<<<< Upstream, based on origin/Algorithm
				<form method="post" action="" name="userinput_cellphone" onSubmit="return checkIt()">
=======
				<form method="post" action="changeInfoProcess.jsp" name="userinput_cellphone"
					onSubmit="return checkIt()">
>>>>>>> 68fd9df changInfoProcess
					<table>
						<tr>
							<td class="signup_text font_GODOM">전 화 번 호</td>
							<td class="signup_form font_GODOM">
							<input type="hidden" name="type" value="cellphone">
								<input type="text"
<<<<<<< Upstream, based on origin/Algorithm
								name="modal_cellphone1" id="modal_cellphone1" class="color font_GODOM inputSize" size="10"
								maxlength="4" placeholder="010" onblur="_onCheckCellphone(this.form)">
=======
								name="modal_cellphone1" id="modal_cellphone" class="color font_GODOM inputSize" size="10"
								maxlength="35" placeholder="010">
>>>>>>> 68fd9df changInfoProcess
								<input type="text"
<<<<<<< Upstream, based on origin/Algorithm
								name="modal_cellphone2" id="modal_cellphone2" class="color font_GODOM inputSize" size="10"
								maxlength="4" placeholder="1234" onblur="_onCheckCellphone(this.form)">
=======
								name="modal_cellphone2" id="modal_cellphone" class="color font_GODOM inputSize" size="10"
								maxlength="35" placeholder="1234">
>>>>>>> 68fd9df changInfoProcess
								<input type="text"
<<<<<<< Upstream, based on origin/Algorithm
								name="modal_cellphone3" id="modal_cellphone3" class="color font_GODOM inputSize" size="10"
								maxlength="4" placeholder="5678" onblur="_onCheckCellphone(this.form)">
								<div id="cellphone_err" class="errMsg"></div></td>
=======
								name="modal_cellphone3" id="modal_cellphone" class="color font_GODOM inputSize" size="10"
								maxlength="35" placeholder="5678"></td>
>>>>>>> 68fd9df changInfoProcess
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" value=" 취소 "></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- homephone -->
	<div class="md-modal md-effect-7" id="homephone">
		<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
				<form method="post" action="changeInfoProcess.jsp" name="userinput_homephone"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">전 화 번 호</td>
<<<<<<< Upstream, based on origin/Algorithm
							<td class="signup_form font_GODOM">
								<input type="text"
								name="modal_homephone1" id="modal_homephone1" class="color font_GODOM inputSize" size="10"
								maxlength="4" placeholder="02" onblur="_onCheckHomephone(this.form)">
								<input type="text"
								name="modal_homephone2" id="modal_homephone2" class="color font_GODOM inputSize" size="10"
								maxlength="4" placeholder="1234" onblur="_onCheckHomephone(this.form)">
								<input type="text"
								name="modal_homephone3" id="modal_homephone3" class="color font_GODOM inputSize" size="10"
								maxlength="4" placeholder="5678" onblur="_onCheckHomephone(this.form)">
								<div id="homephone_err" class="errMsg"></div></td>
=======
							<td class="signup_form font_GODOM"><input type="hidden" name="type" value="homephone"><input type="text"
								name="modal_homephone" id="modal_homephone" class="color font_GODOM" size="10"
								maxlength="35" placeholder="02-1234-5678"></td>
>>>>>>> 68fd9df changInfoProcess
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" value=" 취소 "></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- birthday -->
	<div class="md-modal md-effect-7" id="birthday">
		<<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
				<form method="post" action="changeInfoProcess.jsp" name="userinput_birthday"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">생 년 월 일</td>
<<<<<<< Upstream, based on origin/Algorithm
							<td class="signup_form font_GODOM">
								<input type="text"
								name="modal_birthday1" id="modal_birthday1" class="color font_GODOM inputSize" size="10"
								maxlength="4" placeholder="1991" onblur="_onCheckBirthday(this.form)">
								<input type="text"
								name="modal_birthday2" id="modal_birthday2" class="color font_GODOM inputSize" size="10"
								maxlength="2" placeholder="04" onblur="_onCheckBirthday(this.form)">
								<input type="text"
								name="modal_birthday3" id="modal_birthday3" class="color font_GODOM inputSize" size="10"
								maxlength="2" placeholder="29" onblur="_onCheckBirthday(this.form)">
								<div id="birthday_err" class="errMsg"></div></td>
=======
							<td class="signup_form font_GODOM"><input type="hidden" name="type" value="birthday"><input type="text"
								name="modal_birthday" id="modal_birthday" class="color font_GODOM" size="10"
								maxlength="35" placeholder="851212"></td>
>>>>>>> 68fd9df changInfoProcess
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" value=" 취소 "></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- address -->
	<div class="md-modal md-effect-7" id="address">
		<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
				<form method="post" action="changeInfoProcess.jsp" name="userinput_address"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">집 주 소</td>
							<td class="signup_form font_GODOM"><input type="hidden" name="type" value="address"><input type="text"
								name="modal_address" id="modal_address" class="color font_GODOM" size="10"
								maxlength="35" placeholder="서울 성북구 삼선1동" onblur="_onCheckAddress(this.form)">
								<div id="address_err" class="errMsg"></div></td>
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" value=" 취소 "></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- school -->
	<div class="md-modal md-effect-7" id="school">
		<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
				<form method="post" action="changeInfoProcess.jsp" name="userinput_school"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교</td>
							<td class="signup_form font_GODOM"><input type="hidden" name="type" value="school"><input type="text"
								name="modal_school" id="modal_school" class="color font_GODOM" size="10"
								maxlength="10" placeholder="한 성 대" onblur="_onCheckSchool(this.form)">
								<div id="school_err" class="errMsg"></div></td>
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" value=" 취소 "></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- workplace -->
	<div class="md-modal md-effect-7" id="workplace">
		<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
				<form method="post" action="changeInfoProcess.jsp" name="userinput_workplace"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">직 장 주 소</td>
							<td class="signup_form font_GODOM"><input type="hidden" name="type" value="workplace"><input type="text"
								name="modal_workplace" id="modal_workplace" class="color font_GODOM" size="10"
								maxlength="35" placeholder="한 성 대" onblur="_onCheckWorkplace(this.form)">
								<div id="workplace_err" class="errMsg"></div></td>
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" value=" 취소 "></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- occupation -->
	<div class="md-modal md-effect-7" id="occupation">
		<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
				<form method="post" action="changeInfoProcess.jsp" name="userinput_occupation"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</td>
							<td class="signup_form font_GODOM"><input type="hidden" name="type" value="occupation"><input type="text"
								name="modal_occupation" id="modal_occupation" class="color font_GODOM" size="10"
								maxlength="10" placeholder="학 생" onblur="_onCheckOccupation(this.form)">
								<div id="occupation_err" class="errMsg"></div></td>
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" value=" 취소 "></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
