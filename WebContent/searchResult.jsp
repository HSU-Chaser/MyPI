<%@page import="java.util.Iterator"%>
<%@page import="main.search.SearchMain"%>
<%@page import="main.search.SearchResult"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>검색결과</title>
</head>

<body>
	<table border="1" style="table-layout: fixed;">
		<tr>
			<td width="4%" align="center">번호</td>
			<td width="20%" align="center">제목</td>
			<td width="6%" align="center">링크</td>
			<td width="6%" align="center">노출도</td>
			<td width="6%" align="center">신뢰도</td>
			<td width="58%" align="center">내용</td>
		</tr>
		<%
			String query = "gtaer";
			SearchMain search = new SearchMain();
			ArrayList<SearchResult> result = search.getResult(query);
			for(int i=0; i<result.size(); i++) {
		%>
		<tr>
			<td align="center"><%=i+1%></td>
			<td align="center"><%=result.get(i).getTitle()%></td>
			<td align="center"><a href="<%=result.get(i).getURL()%>"
				target="_blank">링크</a></td>
			<td align="center"><%=result.get(i).getExposure()%></td>
			<td align="center"><%=result.get(i).getReliability()%></td>
			<td><%=result.get(i).getSnippet()%></td>

		</tr>
		<%
			}
		%>


	</table>
</body>
</html>