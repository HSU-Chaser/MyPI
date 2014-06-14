<%@page import="net.sf.json.JSONArray"%>
<%@page import="main.search.SearchResult"%>
<%@page import="java.util.Vector"%>
<%@page import="main.search.SearchDic"%>
<%@page import="main.ranking.ExtendedInfo"%>
<%@page import="main.ranking.Ranking"%>
<%@page import="main.ranking.ProgressObserver"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	String client_str = (String) session.getAttribute("client_num");
	int client_num = 1; //Integer.parseInt(client_str);
	ProgressObserver observer = new ProgressObserver();
	Ranking ranking = new Ranking(client_num, observer);
	ExtendedInfo extend = new ExtendedInfo("gtaer@naver.com");
	SearchDic searchDic = new SearchDic("gtaer@naver.com");
	extend.makeKeywordMap();

	searchDic.bindingWord(extend.getKeywordMap());

	Vector<SearchResult> result = ranking.getResult(searchDic
			.getSearchWordList());
	
	JSONArray array = JSONArray.fromObject(result);
	out.println(array.toString());
%>