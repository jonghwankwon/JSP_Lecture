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
<center>
	<h2>설 문 조 사</h2>
	<form method="post" action="form_re.jsp">
		<table>
			<tr>
				<td>이름</td>
				<td colspan="4"><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td colspan="2">
					<input type="radio" name="sex" value="male">남성
					<input type="radio" name="sex" value="female">여성
				</td>
			</tr>
			<tr>
				<td>좋아하는 계절</td>
				<td colspan="4">
					<input type="checkbox" name="season" value="1">봄
					<input type="checkbox" name="season" value="2">여름
					<input type="checkbox" name="season" value="3">가을
					<input type="checkbox" name="season" value="4">겨울
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