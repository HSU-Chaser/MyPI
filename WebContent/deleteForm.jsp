<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>È¸¿ø Å»Åð</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
	function begin() {
		document.myform.password.focus();
	}

	function checkIt() {
		if (!document.myform.password.value) {
			alert("ºñ¹Ð¹øÈ£¸¦ ÀÔ·ÂÇÏÁö ¾ÊÀ¸¼Ì½À´Ï´Ù.");
			document.myform.password.focus();
			return false;
		}
	}
	-->
</script>

<body onload="begin()">
	<form name="myform" action="deletePro.jsp" method="post"
		onSubmit="return checkIt()">
		<table cellspacing="1" cellpadding="1" width="260" border="1"
			align="center">
			<tr height="30">
				<td colspan="2" align="middle"><font
					size="+1"><b>È¸¿ø Å»Åð</b></font></td>
			</tr>
			<tr>
				<td width="110" align="center">ºñ¹Ð¹øÈ£</td>
				<td width="150" align="center"><input type="password"
					name="password" size="15" maxlength="12"></td>
			</tr>
			<tr height="30">
				<td colspan="2" align="middle"><input
					type="submit" value="È¸¿øÅ»Åð"> <input type="button"
					value="Ãë  ¼Ò" onclick="javascript:window.location='main.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>