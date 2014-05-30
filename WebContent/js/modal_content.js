

// 1. 이름 체크
var _onCheckName = function(userinput) {
	// 숫자 판별
	var val = new Array();
	var di = true;
	for(var i=0; i<userinput.modal_name.value.length; i++) {
		val[i] = userinput.modal_name.value.charAt(i);
		if(isNaN(val[i]) == false)
			di = false;
	}
	// 숫자가 있으면 제외
	if (di == false) {
	//	$('#name_err').css('color', 'red');
		$('#name_err').html('숫자는 제외해주세요.');
		return false;
	}
	// 빈 공간 체크
	else if (userinput.modal_name.value == "") {
	//	$('#name_err').css('color', 'white');
		$('#name_err').html('이름을 입력하세요.');
		return false;
	}
	// ㅇㅋ 통과.
	else {
	//	$('#name_err').css('color', 'rgb(184, 138, 120)');
		$('#name_err').html('');
		return true;
	}
};



// 2. 핸드폰 체크
var _onCheckCellphone = function(userinput) {
	// 숫자 판별
	var val1 = new Array();
	var val2 = new Array();
	var val3 = new Array();
	var di = true;
	for(var i=0; i<4; i++) {
		val1[i] = userinput.modal_cellphone1.value.charAt(i);
		val2[i] = userinput.modal_cellphone2.value.charAt(i);
		val3[i] = userinput.modal_cellphone3.value.charAt(i);
		if(isNaN(val1[i]) == true)
			di = false;
		if(isNaN(val2[i]) == true)
			di = false;
		if(isNaN(val3[i]) == true)
			di = false;
	}

	// 문자가 있으면 제외
	if (di == false) {
	//	$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').html('문자는 제외해주세요.');
		return false;
	}
	// 빈 공간 체크
	else if (userinput.modal_cellphone1.value == "") {
	//	$('#cellphone_err').css('color', 'white');
		$('#cellphone_err').html('번호를 입력하세요.');
		return false;
	}
	else if (userinput.modal_cellphone2.value == "") {
	//	$('#cellphone_err').css('color', 'white');
		$('#cellphone_err').html('번호를 입력하세요.');
		return false;
	}
	else if (userinput.modal_cellphone3.value == "") {
	//	$('#cellphone_err').css('color', 'white');
		$('#cellphone_err').html('번호를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_cellphone1.value.length < 3 ||
			userinput.modal_cellphone1.value.length > 4) {
	//	$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_cellphone2.value.length < 3 ||
			userinput.modal_cellphone2.value.length > 4) {
	//	$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_cellphone3.value.length < 3 ||
			userinput.modal_cellphone3.value.length > 4) {
	//	$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	
	// ㅇㅋ 통과.
	else {
	//	$('#cellphone_err').css('color', 'rgb(184, 138, 120)');
		$('#cellphone_err').html('');
		return true;
	}
};



// 3. 집전화 체크
var _onCheckHomephone = function(userinput) {
	// 숫자 판별
	var val1 = new Array();
	var val2 = new Array();
	var val3 = new Array();
	var di = true;
	for(var i=0; i<4; i++) {
		val1[i] = userinput.modal_homephone1.value.charAt(i);
		val2[i] = userinput.modal_homephone2.value.charAt(i);
		val3[i] = userinput.modal_homephone3.value.charAt(i);
		if(isNaN(val1[i]) == true)
			di = false;
		if(isNaN(val2[i]) == true)
			di = false;
		if(isNaN(val3[i]) == true)
			di = false;
	}// 문자가 있으면 제외
	if (di == false) {
		//	$('#homephone_err').css('color', 'red');
			$('#homephone_err').html('문자는 제외해주세요.');
			return false;
		}
	// 빈 공간 체크
	else if (userinput.modal_homephone1.value == "") {
	//	$('#homephone_err').css('color', 'white');
		$('#homephone_err').html('번호를 입력하세요.');
		return false;
	}
	else if (userinput.modal_homephone2.value == "") {
	//	$('#homephone_err').css('color', 'white');
		$('#homephone_err').html('번호를 입력하세요.');
		return false;
	}
	else if (userinput.modal_homephone3.value == "") {
	//	$('#homephone_err').css('color', 'white');
		$('#homephone_err').html('번호를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_homephone1.value.length < 3 ||
			userinput.modal_homephone1.value.length > 4) {
	//	$('#homephone_err').css('color', 'red');
		$('#homephone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_homephone2.value.length < 3 ||
			userinput.modal_homephone2.value.length > 4) {
	//	$('#homephone_err').css('color', 'red');
		$('#homephone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_homephone3.value.length < 3 ||
			userinput.modal_homephone3.value.length > 4) {
	//	$('#homephone_err').css('color', 'red');
		$('#homephone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	
	// ㅇㅋ 통과.
	else {
	//	$('#homephone_err').css('color', 'rgb(184, 138, 120)');
		$('#homephone_err').html('');
		return true;
	}
};



// 4. 생년월일 체크
var _onCheckBirthday = function(userinput) {
	// 숫자 판별
	var val1 = new Array();
	var val2 = new Array();
	var val3 = new Array();
	var di = true;
	for(var i=0; i<4; i++) {
		val1[i] = userinput.modal_birthday1.value.charAt(i);
		val2[i] = userinput.modal_birthday2.value.charAt(i);
		val3[i] = userinput.modal_birthday3.value.charAt(i);
		if(isNaN(val1[i]) == true)
			di = false;
		if(isNaN(val2[i]) == true)
			di = false;
		if(isNaN(val3[i]) == true)
			di = false;
	}
	// 문자가 있으면 제외
	if (di == false) {
	//	$('#birthday_err').css('color', 'red');
		$('#birthday_err').html('문자는 제외해주세요.');
		return false;
	}
	// 년도 체크 - 빈공간
	else if (userinput.modal_birthday1.value == "") {
	//	$('#birthday_err').css('color', 'white');
		$('#birthday_err').html('년도 를 입력하세요.');
		return false;
	}
	// 년도 체크 - 길이
	// 4칸 입력 가능.
	else if (userinput.modal_birthday1.value.length != 4) {
	//	$('#birthday_err').css('color', 'red');
		$('#birthday_err').html('4글자를 입력하세요.');
		return false;
	}
	
	// 월 체크 - 빈공간
	else if (userinput.modal_birthday2.value == "") {
	//	$('#birthday_err').css('color', 'white');
		$('#birthday_err').html('월 을 입력하세요.');
		return false;
	}
	// 월 체크 - 길이
	// 2칸 입력 가능.
	else if (userinput.modal_birthday2.value.length != 2 ) {
	//	$('#birthday_err').css('color', 'red');
		$('#birthday_err').html('2글자를 입력하세요.');
		return false;
	}
	
	// 일 체크 - 빈공간
	else if (userinput.modal_birthday3.value == "") {
	//	$('#birthday_err').css('color', 'white');
		$('#birthday_err').html('일 을 입력하세요.');
		return false;
	}
	// 일 체크 - 길이
	// 2칸 입력 가능.
	else if (userinput.modal_birthday3.value.length != 2) {
	//	$('#birthday_err').css('color', 'red');
		$('#birthday_err').html('2글자를 입력하세요.');
		return false;
	}
	
	// ㅇㅋ 통과.
	else {
	//	$('#birthday_err').css('color', 'rgb(184, 138, 120)');
		$('#birthday_err').html('');
		return true;
	}
};



// 5. 집주소 체크
var _onCheckAddress = function(userinput) {
	if (userinput.modal_address.value.length > 5) {
	//	$('#address_err').css('color', 'red');
		$('#address_err').html('5글자 이상 입력하세요.');
		return false;
	}
		
	// ㅇㅋ 통과.
	else {
	//	$('#address_err').css('color', 'rgb(184, 138, 120)');
		$('#address_err').html('');
		return true;
	}
};



//6. 학교 체크
var _onCheckSchool = function(userinput) {
	var val = new Array();
	var di = true;
	for(var i=0; i<userinput.modal_school.value.length; i++) {
		val[i] = userinput.modal_school.value.charAt(i);
		if(val[i].equals('대') != true)
			di = false;
	}
	if (userinput.modal_school.value.length != 3) {
	//	$('#school_err').css('color', 'red');
		$('#school_err').html('3글자만 입력하세요.');
		return false;
	}
	else if(userinput.modal_school.value) {
		
	}
	// ㅇㅋ 통과.
	else {
	//	$('#school_err').css('color', 'rgb(184, 138, 120)');
		$('#school_err').html('');
		return true;
	}
};



// 5. 집주소 체크
var _onCheckAddress = function(userinput) {
	if (userinput.modal_address.value.length < 5) {
	//	$('#address_err').css('color', 'red');
		$('#address_err').html('5글자 이상 입력하세요.');
		return false;
	}
		
	// ㅇㅋ 통과.
	else {
	//	$('#address_err').css('color', 'rgb(184, 138, 120)');
		$('#address_err').html('');
		return true;
	}
};