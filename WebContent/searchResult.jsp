<%@page import="java.util.Iterator"%>
<%@page import="main.search.SearchMain"%>
<%@page import="main.search.SearchResult"%>
<%@page import="main.extending.form.Storage"%>
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
			<td width="6%" align="center">엔진</td>
			<td width="6%" align="center">링크</td>
			<td width="6%" align="center">노출도</td>
			<td width="6%" align="center">신뢰도</td>
			<td width="52%" align="center">내용</td>
		</tr>
		<%
			String memberEmail = (String) session.getAttribute("memEmail");
			String memberId = memberEmail.split("@")[0];
			String nickNameOR = "";

			Storage storage = new Storage(memberEmail);
			storage.execute(); //start the extending algorithm	

			for (int i = 0; i < storage.nickNameList.size(); i++) {
				if (i == storage.nickNameList.size() - 1) {
					nickNameOR = nickNameOR + storage.nickNameList.get(i);
					break;
				}
				nickNameOR = nickNameOR + storage.nickNameList.get(i) + "+OR+";
			}

			String searchWord = "\"" + memberId + "\"" + "+OR+" + nickNameOR;

			SearchMain search = new SearchMain();
			ArrayList<SearchResult> result = search.getResult(searchWord);

			for (int i = 0; i < result.size(); i++) {
		%>

		<tr>
			<td align="center"><%=i + 1%></td>
			<td align="center"><%=result.get(i).getTitle()%></td>
			<td align="center"><%=result.get(i).getEngine()%></td>
			<td align="center"><a href="<%=result.get(i).getURL()%>"
				target="_blank">링크</a></td>
			<td align="center"><%=result.get(i).getExposure()%></td>
			<td align="center"><%=result.get(i).getReliability()%></td>
			<td><%=result.get(i).getSnippet()%></td>

		</tr>
		<%
			}
		%>

		<%=searchWord%>
	</table>
</body>
</html>