<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch05 : Include 지시어 테스트</title>
</head>
<body>
	<center>
		<h2>include 지시어 테스트</h2>
		<hr>

		<%@ include file="menu.jspf"%>
		<p>
		<table border=0 cellpadding=5 cellspacing=1>
			<tr>
				<td><font size=-1><%@ include file="news.jspf"%></font></td>
				<td width="30">&nbsp</td>
				<td><font size=-1><%@ include file="shopping.jspf"%></font></td>
			</tr>
		</table>
	</center>

</body>
</html>