<%@page import="main.ranking.Ranking"%>
<%@page import="java.util.Iterator"%>
<%@page import="main.search.MakeObject"%>
<%@page import="main.search.SearchResult"%>
<%@page import="main.extending.form.ExtendedStorage"%>
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
			<td width="6%" align="center">신뢰도</td>
			<td width="52%" align="center">내용</td>
		</tr>
		<%
			String memberEmail = (String) session.getAttribute("memEmail");
			String memberId = memberEmail.split("@")[0];
			String nickNameOR = "";

			ExtendedStorage storage = new ExtendedStorage(memberEmail);
			storage.execute(); //start the extending algorithm	

			for (int i = 0; i < storage.nickNameList.size(); i++) {
				if (i == storage.nickNameList.size() - 1) {
					nickNameOR = nickNameOR + storage.nickNameList.get(i);
					break;
				}
				nickNameOR = nickNameOR + storage.nickNameList.get(i) + "+OR+";
			}

			// for google_ search word
			String searchWord = null;
			searchWord = "\"" + memberId + "\"" /* + "+OR+" + nickNameOR*/;
			/* if (!storage.realBirthday.equals("null")) {
				searchWord = searchWord + "+OR+" + storage.realBirthday;
			}
			if (!storage.realEmail.equals("null")) {
				searchWord = searchWord + "+OR+" + storage.realEmail;
			}
			if (!storage.realName.equals("null")) {
				searchWord = searchWord + "+OR+" + storage.realName;
			} */

			out.println(searchWord);

			MakeObject search = new MakeObject();
			Ranking ranking = new Ranking();
			ArrayList<SearchResult> result = ranking.getResult(searchWord);

			for (int i = 0; i < result.size(); i++) {
		%>

		<tr>
			<td align="center"><%=i + 1%></td>
			<td align="center"><%=result.get(i).getTitle()%></td>
			<td align="center"><%=result.get(i).getEngine()%></td>
			<td align="center"><a href="<%=result.get(i).getURL()%>"
				target="_blank">링크</a></td>
			<td align="center"><%=result.get(i).getExposure()%></td>
			<td align="center"><%=result.get(i).getExposure()%></td>
			<td><%=result.get(i).getSnippet()%></td>

		</tr>
		<%
			}
		%>
	</table>
</body>
</html>