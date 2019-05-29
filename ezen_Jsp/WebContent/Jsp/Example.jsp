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
	<center>
		<h2>물품을 선택하세요</h2>
		<form method="post" action="Example_re.jsp">
			<table>
				<tr>
					<td>상품 목록</td>
					<td colspan="4">
						<input type="checkbox" name=product value="20000">모자
						<input type="checkbox" name="product" value="3000000">텔레비전 
						<input type="checkbox" name="product" value="150000">신발
						<input type="checkbox" name="product" value="60000">가방
					</td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="제출하기"></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>