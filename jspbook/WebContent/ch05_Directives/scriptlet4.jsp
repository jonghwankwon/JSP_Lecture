<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scriptlet4.jsp</title>
</head>
<body>
	<div align="center">
		<h2>scriptlet test</h2>
		<h3>구구단 (홀수)</h3>
		<hr>
		<table border="1px"  bordercolor="black" width="300" >
			<tr>
				<th>※</th>
				<th>3</th>
				<th>5</th>
				<th>7</th>
				<th>9</th>
			<%for (int i = 3; i < 10; i += 2) {%>
			</tr>
			<tr height="50">
				<%for (int k = 1; k < 10; k += 2) {%>
				<%if (k == 0) {%>
					<%} else {%>
				<th><%=i * k%></th>
				<%}%>
				<%}%>
				<%}%>
			</tr>
		</table>
	</div>
</body>
</html>