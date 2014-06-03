<%@page import="main.ranking.ProgressObserver"%>
<%@page import="main.search.MakeObject"%>
<%@page import="main.ranking.ImageStorage"%>
<%@page import="main.search.SearchResult"%>
<%@page import="java.util.Vector"%>
<%@page import="main.search.SearchDic"%>
<%@page import="main.ranking.ExtendedInfo"%>
<%@page import="main.ranking.Ranking"%>
<%@page import="main.extending.form.ExtendedStorage"%>
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

.resultObject .div-num {
	width: 8%;
	height: 2em;
	float: left;
	background-color: #ffffff;
	display: inline;
	text-align: center;
	height: 2em;
	display: inline;
	vertical-align: middle;
	padding-left: 2%;
	padding-right: 2%;
	width: 8%;
}

.resultObject .div-title {
	width: 82%;
	height: 2em;
	float: left;
	background-color: #ffffff;
	display: inline-block;
	text-align: left;
	height: 2em;
	vertical-align: middle;
	position: relative;
}

.resultObject .div-title .title {
	position: absolute;
	max-width: 100%;
	height: 100%;
	word-spacing: 1px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	color: #0c76c7;
	text-decoration: none;
	height: 100%;
	white-space: nowrap;
}

.resultObject .div-exp {
	width: 10%;
	height: 2em;
	float: left;
	background-color: #ffffff;
	display: inline;
	text-align: center;
	height: 2em;
	vertical-align: middle;
}

.resultObject .div-graph {
	width: 100%;
	border: 0;
	cellpadding: 0;
	cellspacing: 0;
	background-color: white;
	color: #0c76c7;
	text-align: center;
	background-color: white;
}

.resultObject .div-tr {
	width: 100%;
	border: 0;
	border: .1 solid white;
	cellpadding: 0;
	text-align: center;
}

.resultObject .div-td {
	background-color: rgba(255, 255, 255, .5);
	border: thin solid white;
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
			ProgressObserver observer = new ProgressObserver();
			Ranking ranking = new Ranking(client_num, observer);
			ExtendedInfo extend = new ExtendedInfo(memberEmail);
			SearchDic searchDic = new SearchDic(memberEmail); // binding 에 전달
			extend.makeKeywordMap();

			searchDic.bindingWord(extend.getKeywordMap());

			Vector<SearchResult> result = ranking.getResult(searchDic
					.getSearchWordList());
			/* MakeObject object = new MakeObject();
			ArrayList<SearchResult> result = object.getResult(searchDic
					.getSearchWordList()); */
	%>

	<br>
	<br>
	<br>
	<br>

	<h2 class="font_GODOM" align="center" style="color: white;">
		<%=memberEmail%>
		님의 MyPI 솔루션 검색 결과
	</h2>
	<br>
	<br>

	<div id="graph" class="resultObject">
		<div>
			<div class="div-graph font_GODOM"
				style="width: 49%; float: left; color:">검색 엔진 비율</div>
			<div class="div-graph font_GODOM" style="width: 49%; float: right">검색
				통계</div>
		</div>
		<div style="clear: both;"></div>
		<div class="div-tr">
			<div class="div-td" style="width: 49%; float: left">
				<iframe src="engineGraph.jsp" frameborder="0" name="engineGraph"
					align="center" width="100%" height="300px" scrolling='no'></iframe>
			</div>
			<div class="div-td" style="width: 49%; float: right">
				<iframe src="exposureGraph.jsp" frameborder="0" name="exposureGraph"
					align="center" width="100%" height="300px" scrolling='auto'></iframe>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>

	<h2 class="resultObject font_GODOM" style="color: white">이미지</h2>
	<div id="image" class="resultObject">
		<div class="div-tr">
			<%
				if (ImageStorage.getImgUrlList().size() == 0) {
						out.println("<h3 class='font_GODOM'>이미지 결과가 없습니다.</h3>");
					} else {
						for (int i = 0; i < ImageStorage.getImgUrlList().size(); i++) {
			%>
			<div class="div-td" align="center"
				style="position: relative; width: 20%; height: 0; float: left; overflow: hidden; padding-bottom: 20%">
				<img src="<%=ImageStorage.getImgUrlList().get(i)%>"
					style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
			</div>
			<%
				if (i + 1 % 5 == 0) {
			%><div style="clear: both;"></div>
			<%
				}
						}
					}
			%>
		</div>
		<div style="clear: both;"></div>
	</div>

	<h2 class="resultObject font_GODOM" style="color: white">Static
		Search</h2>
	<div class="resultObject font_GODOM">
		<div class="div-tr">
			<%
				if (ExtendedStorage.exposureUrlList.size() == 0) {
						out.println("<h3 class='font_GODOM'>주요 노출 사이트 결과가 없습니다.</h3>");
					} else {
						for (int i = 0; i < ExtendedStorage.exposureUrlList.size(); i++) {
			%>
			<div class="div-td" style="float: left; width: 12.5%">
				<a href="<%=ExtendedStorage.exposureUrlList.get(i)%>"
					target="_blank"><img src="<%=ExtendedStorage.imgList.get(i)%>"
					width="100%" align="middle" alt="Image"></a>
			</div>
			<%
				}
					}
			%>
		</div>
		<div style="clear: both"></div>
	</div>

	<h2 class="resultObject font_GODOM" style="color: white">Dynamic
		Search</h2>
	<div class="resultObject font_GODOM">
		<!-- TH	 -->
		<!-- 		<div class="div-th">
			<div class="div-td" style="width: 5%; float: left">번호</div>
			<div class="div-td" style="width: 82%; float: left">제목</div>
			<div class="div-td" style="width: 10%; float: left">위험도</div>
			<div class="div-td" style="width: 3%; float: left">-</div>
			<div style="clear: both;"></div>
		</div> -->
		<%
			for (int i = 0; i < result.size(); i++) {
		%>
		<!-- TR -->
		<div class="div-tr" onclick="_onFilp(<%=i + 1%>)">
			<div class="div-num"><%=i + 1%></div>
			<div class="div-title">
				<a class="title" href="<%=result.get(i).getURL()%>" target="_blank"><%=result.get(i).getTitle()%></a>
			</div>
			<div class="div-exp">
				<%
					double exp = result.get(i).getExposure();
							if (exp >= 70.0) {
				%>
				<img alt="위험" src="images/icon/birthday.png">
				<%
					} else if (exp >= 30.0 && exp < 70.0) {
				%>
				<img alt="주의" src="images/icon/email.png">
				<%
					} else {
				%>
				<img alt="안전" src="images/icon/name.png">
				<%
					}
				%>
			</div>
			<!-- <div class="div-td" style="width: 3%; float: left">▼</div> -->
			<div style="clear: both"></div>
		</div>

		<div id="content<%=i + 1%>" style="display: none"
			onclick="_onFilp(<%=i + 1%>)">
			<!-- TR -->
			<div class="div-tr">
				<div class="div-td" align="center"><%=result.get(i).getSnippet()%>
				</div>
			</div>
			<div style="clear: both"></div>

			<!-- TR -->
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
			</div>
			<div style="clear: both"></div>
			<!-- TR -->
			<div class="div-tr">
				<div class="div-td" align="center">
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
		<div style="margin-bottom: 1em"></div>
		<%
			}
				ImageStorage.getImgUrlList().clear();
				SearchDic.getSearchWordList().clear();
			}
		%>
	</div>
</body>
</html>
