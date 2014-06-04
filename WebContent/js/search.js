/*
 *	Search.js
 */
$(document).ready(function() {
	// Filter Event
	$('.toggle-filter').bind('click', function() {
		$('.filter').toggle(200);
		$('.toggle-filter').toggle();
	});

	$('#question_button').bind('click', function() {
		if ($('#close-filter').css('display') == 'none') {
			$('.filter').toggle(200);
			$('.toggle-filter').toggle();
		}
	});

	// Search Event
	$('#search').bind('click', function() {
		$.ajax({
			url : "./searchProcess.jsp",
			type : "POST",
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				$('#result').html("서버 오류입니다.");
			},
			beforeSend : function() {
				$('#intro').hide();
				$('#contact').hide();
				$('#work').fadeIn(1000);
				$('#progressbar').progressbar({
					value : false
				});
				$(".ui-progress-label").text('Loading...');
			},
			complete : function() {
				$('#work').hide();
				$('#contact').fadeIn(1000);
			}
		});
	});
});

$(document).ajaxStart(function() {
	var progressbar = $("#progressbar");
	var progressLabel = $(".ui-progress-label");
	var val = 0;

	progressbar.progressbar({
		value : false,
		change : function() {
			progressLabel.text("MYPI Search Start!");
		},
		complete : function() {
			progressLabel.text("Complete!");
		}
	});

	function progress() {

		// progressbar.progressbar("value")
		// progressbar.progressbar("value", false);

		val++;
		if (val < 200) {

			if (val >= 1 && val < 4) {
				progressLabel.text("Static Search를 시작합니다.");
			}
			if (val == 4) {
				progressLabel.text("Static Search가 완료되었습니다.");
			}
			if (val >= 5 && val < 20) {
				progressLabel.text("Dynamic Search를 시작합니다.");
			}
			if (val == 20) {
				progressLabel.text("Dynamic Search가 완료되었습니다.");
			}
			if (val >= 21 && val < 25) {
				progressLabel.text("최종 데이터 분석 중입니다.");
			}
			if (val >= 25) {
				progressLabel.text("곧 결과 화면이 출력됩니다. 잠시만 기다려주십시오. ");
			}

		}
		setTimeout(progress, 1000);
	}

	setTimeout(progress, 2000);
});

var changeIcon = function(type) {
	if (type == 'name') {
		$('#nameIcon').attr('src', 'images/ihfb/icons/my_name_p.png');
	} else if (type == 'cellphone') {
		$('#cellphoneIcon').attr('src', 'images/ihfb/icons/my_mobile_p.png');
	} else if (type == 'homephone') {
		$('#homephoneIcon').attr('src', 'images/ihfb/icons/my_phone_p.png');
	} else if (type == 'birthday') {
		$('#birthdayIcon').attr('src', 'images/ihfb/icons/my_birthday_p.png');
	} else if (type == 'address') {
		$('#addressIcon').attr('src', 'images/ihfb/icons/my_address_p.png');
	} else if (type == 'school') {
		$('#schoolIcon').attr('src', 'images/ihfb/icons/my_school_p.png');
	} else if (type == 'workplace') {
		$('#workplaceIcon').attr('src', 'images/ihfb/icons/my_workplace_p.png');
	} else if (type == 'occupation') {
		$('#occupationIcon').attr('src',
				'images/ihfb/icons/my_occupation_p.png');
	} else {
		alert('type undefined');
	}
};

var _onFilp = function(n) {
	if ($('#content' + n).css('display') == 'none') {
		$('#title' + n).css('color', '#0c76c7').css('background','#ffffff');
	} else {
		$('#title' + n).css('color', '#ffffff').css('background','#ffffff');
	}
	$('#content' + n).slideToggle('slow');
};

var _onSendMail = function(userinput) {
	$
			.ajax({
				beforeSend : function() {
					var emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
					if (userinput.fmail.value == "") {
						alert("답장을 받으실 이메일을 입력하세요!");
						return false;
					} else if (!emailRegex.test(userinput.fmail.value)) {
						alert("이메일 형식이 맞지 않습니다.");
						return false;
					} else
						return true;
				},
				type : "GET",
				url : "sendMail.jsp?name=" + userinput.fname.value + "&from="
						+ userinput.fmail.value + "&content="
						+ userinput.message.value,
				success : function(result) {
					if (result == "true") {
						alert("이메일을 보냈습니다.");
					} else {
						alert("이메일을 보내는 데 실패하였습니다.");
					}
				},
				error : function() {
					alert("이메일 전송 오류");
				}
			});
};