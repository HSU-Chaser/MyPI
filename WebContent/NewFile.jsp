<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		$.ajax({
			url : "./exposureGraph.jsp",
			type : "POST",
			success : function(result) {
				// 성공하면
				$('#result').html(result);
			}
		});
	</script>

	<div id="result"></div>

</body>
</html>