<%@page import="main.logon.LogonDataBean"%>
<%@page import="main.logon.LogonDBBean"%>
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
		manager.updateName(c,name);
	}else if(type.equals("cellphone")){
		String cellphone1 = request.getParameter("modal_cellphone1");
		String cellphone2 = request.getParameter("modal_cellphone2");
		String cellphone3 = request.getParameter("modal_cellphone3");
		String phone = cellphone1+"-"+cellphone2+"-"+cellphone3;
		manager.updateCellPhone(c,phone);
	}else if(type.equals("homephone")){
		String homephone1 = request.getParameter("modal_homephone1");
		String homephone2 = request.getParameter("modal_homephone2");
		String homephone3 = request.getParameter("modal_homephone3");
		String phone2 = homephone1+"-"+homephone2+"-"+homephone3;
		manager.updateHomePhone(c,phone2);
	}else if(type.equals("birthday")){
		String birthday1 = request.getParameter("modal_birthday1");
		String birthday2 = request.getParameter("modal_birthday2");
		String birthday3 = request.getParameter("modal_birthday3");
		String day = birthday1+"."+birthday2+"."+birthday3;
		manager.updateBirthDay(c,day);
	}else if(type.equals("address")){
		String address = request.getParameter("modal_address");
		manager.updateAddress(c,address);
	}else if(type.equals("school")){
		String school = request.getParameter("modal_school");
		manager.updateSchool(c,school);
	}else if(type.equals("workplace")){
		String workplace = request.getParameter("modal_workplace");
		manager.updateWorkPlace(c,workplace);
	}else if(type.equals("occupation")){
		String occupation = request.getParameter("modal_occupation");
		manager.updateOccuPation(c,occupation);
	}
%>