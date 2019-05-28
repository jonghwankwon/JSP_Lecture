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
	width: 80%;
	font-size: 20px;
	border: 1px solid;
	text-align: center;
	background-color: pink;
}

td {
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
	%>
	<center>
		<h2>가격 확인</h2>
		<form method="post" action="a.jsp">
			<table>
				<tr>
					<td>선택 상품 및 총액</td>
					<td colspan="4">
						<%
							int total = 0;
							String product[] = request.getParameterValues("product");
							for (String p : product) {
								int n = Integer.parseInt(p);
								switch (n) {
								case 20000:
									out.println("모자");
									total += n;
									break;
								case 3000000:
									out.println("텔레비전");
									total += n;
									break;
								case 150000:
									out.println("신발");
									total += n;
									break;
								case 60000:
									out.println("가방");
									total += n;
									break;
								}
						%>
						<%
							} out.print(" / " + total + " 원");
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