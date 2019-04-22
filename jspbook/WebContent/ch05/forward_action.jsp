<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch05 : forward_action 테스트</title>
</head>
<body>
	<h2>forward_action.jsp에서 footer.jsp 호출</h2>
	<hr>
	forward_action.jsp의 모든 내용은 출력되지 않습니다.
	<%!int a = 10;%>
	<jsp:forward page="footer.jsp">
		<jsp:param name="email" value="forward@test.net" />
		<jsp:param name="tel" value="010-9876-5432" />
	</jsp:forward>
</body>
</html>