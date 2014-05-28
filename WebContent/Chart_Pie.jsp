<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.globfx.swiffchart.SwiffChart"%>
<%
	// Test init
	String installation_dir = "C:\\Program Files (x86)\\GlobFX\\Swiff Chart Generator 3";

	// Create a new Swiff Chart object
	SwiffChart chart = new SwiffChart(installation_dir);

	// JSP Init
	chart.SetServletInfo(request, response);

	String sep = ";";
	boolean ignoremultseparators = true;
	chart.SetSeparators(sep, ignoremultseparators);

	// Fill the series and categories
	String categories = "Google" + sep + "Naver" + sep
			+ "Daum";
	chart.SetCategoriesFromString(categories);

	String series = "40" + sep + "50" + sep + "10";

	chart.SetSeriesValuesFromString(0, series);

	// Set the chart title
	chart.SetTitle("검색 엔진 비율");

	// Apply a Pie style
	// The chart type is stored in the style file (*.scs)
	// Here the selected style is the predefined column style "Honolulu"
	String style = "pie/Honolulu";
	chart.LoadStyle(style);
	
	chart.SetWidth(100);
	chart.SetHeight(50);
	
	chart.SetLooping(false);

	// 출력 스트림 중복 사용 배제
	out.clear();
	out = pageContext.pushBody();
	
	//   String chart_res= chart.GetHTMLTag();
	//   chart.Release();

	chart.ExportAsResponse();
%>

