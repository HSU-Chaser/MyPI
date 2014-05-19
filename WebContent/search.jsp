<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Team Chaser</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<!--bootstrap-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"
	media="screen" title="no title" charset="utf-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>




<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>

	<jsp:include page="/common/header.jsp" />

	<!-- Contact -->
	<section id="contact" class="main style3 secondary">
		<div class="content container">

			<!-- Result -->
			<%
				String memberEmail = null;
				memberEmail = (String) session.getAttribute("memEmail");

				if (memberEmail == null) {
			%>
			<br>로그인 필요 <br>
			<%
				} else {
			%>
			<script type="text/javascript">
				
			</script>
			<%
				}
			%>
			</table>
		</div>
	</section>

	<jsp:include page="/common/footer.jsp" />

</body>
</html>