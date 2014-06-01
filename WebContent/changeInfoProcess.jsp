<%@page import="main.logon.LogonDataBean"%>
<%@page import="main.logon.LogonDBBean"%>
<%@page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	// Get Email
	String email = (String) session.getAttribute("memEmail");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);

	// Get Change Type
	
	String type = (String)request.getParameter("type");
	if(type.equals("name")){
		String name = request.getParameter("modal_name");
		manager.updateName(name);
	}else if(type.equals("cellphone")){
		String cellphone1 = request.getParameter("modal_cellphone1");
		String cellphone2 = request.getParameter("modal_cellphone2");
		String cellphone3 = request.getParameter("modal_cellphone3");
		String phone = cellphone1+"-"+cellphone2+"-"+cellphone3;
		manager.updateCellPhone(phone);
	}else if(type.equals("homephone")){
		String homephone = request.getParameter("modal_homephone");
		manager.updateHomePhone(homephone);
	}else if(type.equals("birthday")){
		String birthday = request.getParameter("modal_birthday");
		manager.updateBirthDay(birthday);
	}else if(type.equals("address")){
		String address = request.getParameter("modal_address");
		manager.updateAddress(address);
	}else if(type.equals("school")){
		String school = request.getParameter("modal_school");
		manager.updateSchool(school);
	}else if(type.equals("workplace")){
		String workplace = request.getParameter("modal_workplace");
		manager.updateWorkPlace(workplace);
	}else if(type.equals("occupation")){
		String occupation = request.getParameter("modal_occupation");
		manager.updateOccuPation(occupation);
	}
	response.sendRedirect("main.jsp");
%>
