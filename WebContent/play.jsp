<%@page import="java.util.Iterator"%>
<%@page import="main.search.MakeObject"%>
<%@page import="main.search.SearchResult"%>
<%@page import="main.extending.form.Storage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Team Chaser</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<!--bootstrap-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"
	media="screen" title="no title" charset="utf-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>




<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>

	<jsp:include page="/common/header.jsp" />

	<!-- Contact -->
	<section id="contact" class="main style3 secondary">
		<div class="content container">

			<!-- Result -->
			<%
				String memberEmail = null;
				memberEmail = (String) session.getAttribute("memEmail");

				if (memberEmail == null) {
			%>
			<br>로그인 필요 <br>
			<%
				} else {
			%>
			<br>
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
					String memberId = memberEmail.split("@")[0];
						String nickNameOR = "";
						Storage storage = new Storage(memberEmail);
						storage.execute(); //start the extending algorithm	

						for (int i = 0; i < storage.nickNameList.size(); i++) {
							if (i == storage.nickNameList.size() - 1) {
								nickNameOR = nickNameOR + storage.nickNameList.get(i);
								break;
							}
							nickNameOR = nickNameOR + storage.nickNameList.get(i)
									+ "+OR+";
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

						System.out.println(searchWord);

						MakeObject search = new MakeObject();
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
					}
				%>
			</table>
		</div>
	</section>

	<jsp:include page="/common/footer.jsp" />

</body>
</html>