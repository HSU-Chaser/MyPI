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

.resultObject .div-tr {
	width: 100%;
	border: 0;
	cellspacing: 0;
	cellpadding: 0;
	border: .1 solid white;
	cellpadding: 0;
	text-align: center;
}

.resultObject .div-td {
	background-color: rgba(255, 255, 255, .5);
	border: thin solid white;
	height: 3em;
	text-align: center;
}
</style>

<body>
	<%
		String memberEmail = (String) session.getAttribute("memEmail");

			if (memberEmail == null) {
	%>
	<script type="text/javascript">
		alert("로그인 정보가 없습니다.");
		location.replace("index.jsp");
	</script>
	<%
		} else {

			String client_str = (String) session.getAttribute("client_num");
			int client_num = Integer.parseInt(client_str);
			SearchDic searchDic;
			Ranking ranking = new Ranking(client_num);
			ExtendedInfo extend = new ExtendedInfo(memberEmail);
			searchDic = new SearchDic(memberEmail); // binding 에 전달
			extend.makeKeywordMap();

			searchDic.bindingWord(extend.getKeywordMap());

			/* ArrayList<SearchResult> result = ranking.getResult(searchDic
					.getSearchWordList()); */
			MakeObject object = new MakeObject();
			ArrayList<SearchResult> result = object.getResult(searchDic
					.getSearchWordList());
	%>



	<br>
	<br>
	<br>
	<br>
	<br>


	<p>
		<%=memberEmail%>
		님의 MyPI 솔루션 검색 결과
	</p>


	<br>
	<br>
	<br>


	<h3>그래프</h3>
	<div id="graph" class="resultObject"></div>
	<table border='0' align='left' width='100%' height=500px">
		<tr valign="top">
			<td align='left' width='55%' height="15%"><iframe
					src='engineGraph.jsp' align="top" frameborder='0'
					name="engineGraph" width='100%' height="100%" scrolling='no'></iframe></td>
			<td align='left' valign="top" width='55%' height="85%"><iframe
					src='exposureGraph.jsp' align="top" frameborder='0'
					name="exposureGraph" width='100%' height="100%" scrolling='auto'></iframe></td>
		</tr>
	</table>

	<h3>이미지</h3>
	<div id="image" class="resultObject">
		<table>
			<tr>
				<%
					for (int i = 0; i < ImageStorage.getImgUrlList().size(); i++) {
				%>

				<td align="center"><img
					src="<%=ImageStorage.getImgUrlList().get(i)%>" width="100px"></td>

				<%
					}
				%>
			</tr>
		</table>
	</div>

	<h3>Static Search</h3>
	<div class="resultObject font_GODOM"></div>

	<h3>Dynamic Search</h3>
	<div class="resultObject font_GODOM">
		<div class="div-tr">
			<div class="div-td" style="width: 5%; float: left">번호</div>
			<div class="div-td" style="width: 82%; float: left">제목</div>
			<div class="div-td" style="width: 10%; float: left">노출도</div>
			<div class="div-td" style="width: 3%; float: left"></div>
			<div style="clear: both;"></div>
		</div>
		<%
			for (int i = 0; i < result.size(); i++) {
		%>
		<div class="div-tr" onclick="_onFilp(<%=i + 1%>)">
			<div class="div-td" style="width: 5%; float: left;"><%=i + 1%></div>
			<div class="div-td" style="width: 82%; float: left;">
				<a href="<%=result.get(i).getURL()%>" target="_blank"><%=result.get(i).getTitle()%></a>
			</div>
			<div class="div-td" style="width: 10%; float: left;"><%=result.get(i).getExposure()%></div>
			<div class="div-td" style="width: 3%; float: left">▼</div>
			<div style="clear: both"></div>
		</div>

		<div id="content<%=i + 1%>" class="div-tr" style="display: none"
			onclick="_onFilp(<%=i + 1%>)">
			<div class="div-tr">
				<div class="div-td" align="center"><%=result.get(i).getSnippet()%>
				</div>
			</div>
			<div style="clear: both"></div>
			<div class="div-tr">
				<div class="div-td" align="center">
					<!-- Engine Solution -->
					<%
						if (result.get(i).getEngine().matches(".*Naver.*") == true) {
					%>
					<jsp:include page="/Solution/Naver.jsp" flush="false" />
					<%
						} else if (result.get(i).getEngine().matches(".*Daum.*") == true) {
					%>
					<jsp:include page="/Solution/Daum.jsp" flush="false" />
					<%
						} else if (result.get(i).getEngine().matches(".*Google.*") == true) {
					%>
					<jsp:include page="/Solution/Google.jsp" flush="false" />
					<%
						}
					%>
				</div>
				<div calss="div-td" align="center">
					<!-- Static Solution -->
					<%
						if (result.get(i).getURL().matches(".*blog.naver.*") == true) {
					%>
					<jsp:include page="/Solution/NaverBlog.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*kin.naver.*") == true) {
					%>
					<jsp:include page="/Solution/NaverKin.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL()
										.matches(".*blog.cyworld.*") == true) {
					%>
					<jsp:include page="/Solution/CyworldBlog.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*cyworld.*") == true) {
					%>
					<jsp:include page="/Solution/Cyworld.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*blog.daum.*") == true) {
					%>
					<jsp:include page="/Solution/DaumBlog.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*dreamwiz.*") == true) {
					%>
					<jsp:include page="/Solution/Dreamwiz.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*egloos.*") == true) {
					%>
					<jsp:include page="/Solution/Egloos.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*gallog.*") == true) {
					%>
					<jsp:include page="/Solution/Gallog.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*me2day.*") == true) {
					%>
					<jsp:include page="/Solution/NaverMe2day.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*tistory.*") == true) {
					%>
					<jsp:include page="/Solution/Tistory.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*todayhumor.*") == true) {
					%>
					<jsp:include page="/Solution/TodayHumor.jsp" flush="false" />
					<%
						} else if (result.get(i).getURL().matches(".*twitter.*") == true) {
					%>
					<jsp:include page="/Solution/Twitter.jsp" flush="false" />
					<%
						}
					%>
				</div>
			</div>
			<div style="clear: both"></div>
		</div>
		<%
			}
			}
		%>


	</div>

</body>
</html>
