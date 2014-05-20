<%@page import="main.ranking.Ranking"%>
<%@page import="java.util.Iterator"%>
<%@page import="main.search.MakeObject"%>
<%@page import="main.search.SearchResult"%>
<%@page import="main.extending.form.ExtendedStorage"%>
<%@page import="main.search.BindingWord"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>검색결과</title>
</head>

<body>
	<table border="1" style="table-layout: fixed;">
		<tr>
			<td width="4%" align="center">번호</td>
			<td width="20%" align="center">제목</td>
			<td width="6%" align="center">엔진</td>
			<td width="6%" align="center">링크</td>
			<td width="6%" align="center">노출도</td>
			<td width="52%" align="center">내용</td>
		</tr>
		<%
			BindingWord binding;
			MakeObject makeObject = new MakeObject();
			Ranking ranking = new Ranking();
			String memberEmail = (String) session.getAttribute("memEmail");

			binding = new BindingWord(memberEmail); //binding 에 전달

			ArrayList<SearchResult> result = ranking.getResult(binding
					.getSearchWord());

			for (int i = 0; i < result.size(); i++) {
		%>

		<tr>
			<td align="center"><%=i + 1%></td>
			<td align="center"><%=result.get(i).getTitle()%></td>
			<td align="center"><%=result.get(i).getEngine()%></td>
			<td align="center"><a href="<%=result.get(i).getURL()%>"
				target="_blank">링크</a></td>
			<td align="center"><%=result.get(i).getExposure()%></td>
			<td><%=result.get(i).getSnippet()%></td>

		</tr>
		<%
			}
		%>
	</table>
</body>
</html>