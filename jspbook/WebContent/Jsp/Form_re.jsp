<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설문 조사</title>
<style type="text/css">
table {
font-family: 맑은 고딕;
width:80%;
font-size: 20px;
border: 1px solid;
text-align: center;
background-color: pink;
}
td{
height: 40px;
border: 1px solid;
}
input {
	font-size: 20px;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");

		String sex = request.getParameter("sex");
		if (sex.equals("male")) {
			sex = "남자";
		} else {
			sex = "여자";
		}
	%>
	<center>
		<h2>설 문 조 사 결 과</h2>
		<form method="post" action="a.jsp">
			<table>
				<tr>
					<td>이름</td>
					<td><%=name%></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><%=sex%></td>
				</tr>
				<tr>
					<td>좋아하는 계절</td>
					<td>
						<%
							String season[] = request.getParameterValues("season");
							for (String s : season) {
								int n = Integer.parseInt(s);
								switch (n) {
								case 1:
									out.println("봄");
									break;
								case 2:
									out.println("여름");
									break;
								case 3:
									out.println("가을");
									break;
								case 4:
									out.println("겨울");
									break;
								}
							}
						%>
					</td>
				</tr>
				<tr>
					<td colspan="4"><input type="button" value="되돌아가기"
						onClick="history.back();"></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>