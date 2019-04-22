<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch05 : include action 테스트</title>
</head>
<body>
	<h2>include action에서 footer.jsp 호출</h2>
	<hr>
	include_action.jsp 에서 출력한 메세지 입니다.
	<br>
	<jsp:include page="footer.jsp">
		<jsp:param value="include@test.net" name="email" />
		<jsp:param value="010-9876-5432" name="tel" />
	</jsp:include>
</body>
</html>