<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<style type="text/css">
		border, th, td, tr {
			border: 1px solid white;
		}
	
	<!-- Modal Dialog -->
	<!-- name -->
	</style>
	<div class="md-modal md-effect-7" id="name">
		<div class="md-content">
			<div>
				<h3 class="font_GODOM">정보 수정</h3>
				<form method="post" action="" name="userinput_name"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="modal_name" id="modal_name" class="color font_GODOM" size="10"
								maxlength="35" placeholder="홍 길 동"></td>
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
				<form method="post" action="" name="userinput_cellphone"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">전 화 번 호</td>
							<td class="signup_form font_GODOM">
								<input type="text"
								name="modal_cellphone" id="modal_cellphone" class="color font_GODOM inputSize" size="10"
								maxlength="35" placeholder="010">
								<input type="text"
								name="modal_cellphone" id="modal_cellphone" class="color font_GODOM inputSize" size="10"
								maxlength="35" placeholder="1234">
								<input type="text"
								name="modal_cellphone" id="modal_cellphone" class="color font_GODOM inputSize" size="10"
								maxlength="35" placeholder="5678"></td>
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
				<form method="post" action="" name="userinput_homephone"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">전 화 번 호</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="modal_homephone" id="modal_homephone" class="color font_GODOM" size="10"
								maxlength="35" placeholder="02-1234-5678"></td>
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
				<form method="post" action="" name="userinput_birthday"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">생 년 월 일</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="modal_birthday" id="modal_birthday" class="color font_GODOM" size="10"
								maxlength="35" placeholder="851212"></td>
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
				<form method="post" action="" name="userinput_address"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">집 주 소</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="modal_address" id="modal_address" class="color font_GODOM" size="10"
								maxlength="35" placeholder="한 성 대"></td>
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
				<form method="post" action="" name="userinput_school"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="modal_school" id="modal_school" class="color font_GODOM" size="10"
								maxlength="35" placeholder="한 성 대"></td>
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
				<form method="post" action="" name="userinput_workplace"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">직 장 주 소</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="modal_workplace" id="modal_workplace" class="color font_GODOM" size="10"
								maxlength="35" placeholder="한 성 대"></td>
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
				<form method="post" action="" name="userinput_occupation"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="signup_text font_GODOM">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="modal_occupation" id="modal_occupation" class="color font_GODOM" size="10"
								maxlength="35" placeholder="학 생"></td>
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