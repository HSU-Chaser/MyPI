<%@page import="main.search.MakeObject"%>
<%@page import="main.ranking.ImageStorage"%>
<%@page import="main.search.SearchResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.search.SearchDic"%>
<%@page import="main.ranking.ExtendedInfo"%>
<%@page import="main.ranking.Ranking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			Ranking ranking = new Ranking();
			MakeObject object = new MakeObject();
			ExtendedInfo extend = new ExtendedInfo(memberEmail);
			SearchDic searchDic = new SearchDic(memberEmail); // binding 에 전달
			extend.makeKeywordMap();
			searchDic.bindingWord(extend.getKeywordMap());

			ArrayList<SearchResult> result = ranking.getResult(searchDic
					.getSearchWordList());
	%>

	<div id="engineGraph" class="resultObject"></div>


	<div id="exposureGraph" class="resultObject"></div>

	<div id="image" class="resultObject">
		<table>
			<tr>
				<%
					for (int i = 0; i < ImageStorage.getImgUrlList().size(); i++) {
				%>
				<td width="20%" align="center"><img
					src="<%=ImageStorage.getImgUrlList().get(i)%>"></td>
				<%
					}
				%>
			</tr>
		</table>
	</div>

	<div class="resultObject font_GODOM">

		<div>
			<div style="width: 5%">번호</div>
			<div style="width: 82%">제목</div>
			<div style="width: 10%">노출도</div>
			<div style="width: 3%"></div>
		</div>
		<%
			for (int i = 0; i < result.size(); i++) {
		%>


		<div onclick="_onFilp(<%=i + 1%>)">
			<div style="float: left;"><%=i + 1%></div>
			<div style="float: left;">
				<a href="<%=result.get(i).getURL()%>" target="_blank"><%=result.get(i).getTitle()%></a>
			</div>
			<div style="float: left;"><%=result.get(i).getExposure()%></div>
			<div style="float: left;">▼</div>
		</div>

		<div id="content<%=i + 1%>" style="display: none"
			onclick="_onFilp(<%=i + 1%>)">
			<div align="center"><%=result.get(i).getSnippet()%>
			</div>
		</div>

		<%
			}
			}
		%>

	</div>

</body>
</html>
