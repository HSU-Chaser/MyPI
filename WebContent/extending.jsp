<%@page import="main.extending.form.Storage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>


	<%
		String query = "gtaer";
		Storage storage = new Storage(query);
		storage.execute(); //start the extending algorithm

		for (int i = 0; i < storage.nickNameList.size(); i++) {
	%>
	<%=storage.nickNameList.get(i)%>
	<%
		}
	%>



</body>
</html>