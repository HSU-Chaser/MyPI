<%@ page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<title>Processing...</title>
</head>

<body>
	<%
		String cx = "cx=010276989280583185703:xega91fkwmq"; // Search Engine ID
		String id = request.getParameter("id");
		//String name = request.getParameter("name");
		String googleQuery = "http://www.google.com/cse/publicurl?" + cx+ "&q=" + id;
	%>

</body>

<script type="text/javascript">
alert('a');
     window.location.replace("<%= googleQuery %>");
</script>
</html>