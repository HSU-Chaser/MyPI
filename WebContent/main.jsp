<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Team Chaser</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<script type="text/javascript">
	var _onLoadData = function() {
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
			},
			complete : function() {
				$('#work').hide();
				$('#contact').fadeIn(1000);
			}
		});
	};

	$(document).ajaxStart(function() {
		var progressbar = $("#progressbar");
		var progressLabel = $(".ui-progress-label");

		progressbar.progressbar({
			value : false,
			change : function() {
				progressLabel.text(progressbar.progressbar("value") + "%");
			},
			complete : function() {
				progressLabel.text("Complete!");
			}
		});

		function progress() {
			var val = progressbar.progressbar("value") || 0;

			progressbar.progressbar("value", val + 1);

			if (val < 99) {
				setTimeout(progress, 100);
			}
		}

		setTimeout(progress, 1000);
	});

	var _onEditInfo = function(info) {
		$("#changeForm").dialog("open");

		$('#changeForm').dialog({
			width : 350,
			height : 300,
			modal : true,
			buttons : {
				"수정" : function() {

				},
				Cancel : function() {
					$(this).dialog("close");
				}
			},
			close : function() {
				allFields.val("").removeClass("ui-state-error");
			}
		});
	};

	var _onFilterExtend = function() {
		var status = $('#moreFilter').css('display');
		if (status == 'none') {
			$('#extendButton').attr('src', './images/icon/minus.png');
		} else {
			$('#extendButton').attr('src', './images/icon/plus.png');
		}
		$('#moreFilter').toggle('slow');
	};

	var _onFilp = function(n) {
		$('#content' + n).slideToggle('slow');
	};
</script>

<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>

<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>
	<!-- Header -->
	<jsp:include page="/common/header.jsp" />

	<!-- Intro -->
	<section id="intro" class="main style1 dark fullscreen">
		<div class="content container">
			<!-- Information -->
			<header>
				<h2>마이파이</h2>
			</header>
			<p>마이파이 내용</p>
		</div>
	</section>

	<!-- Loading -->
	<section id="work" class="main style2 fullscreen" style="display: none">
		<div class="content container">
			<div id="progressbar"
				class="ui-progressbar ui-widget ui-widget-content ui-corner-all">
				<div class="ui-progressbar-value ui-widget-header ui-corner-left"
					style="display: none"></div>
			</div>
			<div class="ui-progress-label">Loading...</div>
		</div>
	</section>

	<!-- Result -->
	<section id="contact" style="display: none">
		<div id="result" class="content"></div>
	</section>

	<!-- Footer -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>