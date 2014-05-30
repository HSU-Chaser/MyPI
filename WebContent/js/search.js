/*
 *	Search.js
 */
$(document).ready(function() {
	// Filter Event
	$('.toggle-filter').bind('click', function() {
		$('.filter').toggle(200);
		$('.toggle-filter').toggle();
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

	// Change Information Event
	$('.filter').bind('click', function() {
		$("#dialog-form").dialog({
			autoOpen : false,
			height : 300,
			width : 350,
			modal : true,
			buttons : {
				"Update" : function() {
					$(this).dialog("close");
				},
				Cancel : function() {
					$(this).dialog("close");
				}
			},
			close : function() {
				;
			}
		});
	});
});

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
			setTimeout(progress, 1000);
		}
	}

	setTimeout(progress, 1000);
});

var _onFilp = function(n) {
	$('#content' + n).toggle('slow');
};

var _onEditInfo = function(info) {
	$("#dialog-form").dialog({
		autoOpen : false,
		height : 300,
		width : 350,
		modal : true,
		buttons : {
			"Update" : function() {
				$(this).dialog("close");
			},
			Cancel : function() {
				$(this).dialog("close");
			}
		},
		close : function() {
			;
		}
	});

	$(".filter").button().click(function() {
		$("#dialog-form").dialog("open");
	});
};