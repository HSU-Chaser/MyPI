<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="main.search.BindingWord"%>
<%@page import="main.search.MakeObject"%>
<%@page import="main.ranking.Ranking"%>
<%@page import="java.util.Iterator"%>
<%@page import="main.search.SearchResult"%>
<%@page import="java.util.ArrayList"%>
<%@ page trimDirectiveWhitespaces="true"%>

<style type="text/css">
.resultObject {
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 2%;
	margin-bottom: 2%;
}

.resultObject table {
	width: 100%;
	border: 0;
	cellspacing: 0;
	cellpadding: 0;
	border: thin solid white;
	cellpadding: 0;
}

.resultObject tr {
	
}

.resultObject td {
	background-color: rgba(255, 255, 255, .5);
	border: thin solid white;
	height: 3em;
	text-align: center;
}
</style>

<body>
	<%
		String memberEmail = null;
		memberEmail = (String) session.getAttribute("memEmail");

		if (memberEmail == null) {
	%>
	<script type="text/javascript">
		alert("로그인 정보가 없습니다.");
		location.replace("index.jsp");
	</script>
	<%
		} else {
			String memberId = memberEmail.split("@")[0];
			BindingWord binding = new BindingWord(memberEmail);
			MakeObject object = new MakeObject();
			// Ranking ranking = new Ranking();
			ArrayList<SearchResult> result = object.getResult(binding
					.getKeywordMap());
	%>

	<div id="engineGraph" class="resultObject">
		<table>
			<tr>
				<td></td>
			</tr>
		</table>
	</div>

	<div id="exposureGraph" class="resultObject">
		<table>
			<tr>
				<td></td>
			</tr>
		</table>
	</div>

	<div id="image" class="resultObject">
		<table>
			<tr>
				<td width="20%" align="center"><img src=""></td>
				<td width="20%" align="center"><img src=""></td>
				<td width="20%" align="center"><img src=""></td>
				<td width="20%" align="center"><img src=""></td>
				<td width="20%" align="center"><img src=""></td>
			</tr>
			<tr>
				<td width="20%" align="center"><img src=""></td>
				<td width="20%" align="center"><img src=""></td>
				<td width="20%" align="center"><img src=""></td>
				<td width="20%" align="center"><img src=""></td>
				<td width="20%" align="center"><img src=""></td>
			</tr>
		</table>
	</div>

	<div class="resultObject font_GODOM">
		<table>
			<tr>
				<td width="5%">번호</td>
				<td width="82%">제목</td>
				<td width="10%">노출도</td>
				<td width="3%"></td>
			</tr>
			<%
				for (int i = 0; i < result.size(); i++) {
			%>

			<tr onclick="_onFilp(<%=i + 1%>)">
				<td><%=i + 1%></td>
				<td><a href="<%=result.get(i).getURL()%>" target="_blank"><%=result.get(i).getTitle()%></a></td>
				<td><%=result.get(i).getExposure()%></td>
				<td>▼</td>
			</tr>

			<tr id="content<%=i + 1%>" style="display: none"
				onclick="_onFilp(<%=i + 1%>)">
				<td align="center" colspan="7"><%=result.get(i).getSnippet()%></td>
			</tr>

			<%
				}
				}
			%>
		</table>
	</div>

</body>
</html>