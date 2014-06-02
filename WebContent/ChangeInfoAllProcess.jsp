<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<body>
	<%
		String email = (String) session.getAttribute("memEmail");
		LogonDBBean manager = LogonDBBean.getInstance();
		LogonDataBean c = manager.getMember(email);
		String name = request.getParameter("modal_name");
		String cellphone1 = request.getParameter("modal_cellphone1");
		String cellphone2 = request.getParameter("modal_cellphone2");
		String cellphone3 = request.getParameter("modal_cellphone3");
		String phone = cellphone1+"-"+cellphone2+"-"+cellphone3;
		String homephone1 = request.getParameter("modal_homephone1");
		String homephone2 = request.getParameter("modal_homephone2");
		String homephone3 = request.getParameter("modal_homephone3");
		String phone2 = homephone1+"-"+homephone2+"-"+homephone3;
		String birthday1 = request.getParameter("modal_birthday1");
		String birthday2 = request.getParameter("modal_birthday2");
		String birthday3 = request.getParameter("modal_birthday3");
		String day = birthday1+"."+birthday2+"."+birthday3;
		String address = request.getParameter("modal_address");
		String school = request.getParameter("modal_school");
		String workplace = request.getParameter("modal_workplace");
		String occupation = request.getParameter("modal_occupation");
		manager.updateName(c,name);
		manager.updateCellPhone(c,phone);
		manager.updateHomePhone(c,phone2);
		manager.updateBirthDay(c,day);
		manager.updateAddress(c,address);
		manager.updateSchool(c,school);
		manager.updateWorkPlace(c,workplace);
		manager.updateOccuPation(c,occupation);
		
		response.sendRedirect("main.jsp");
	%>
</body>
</html>