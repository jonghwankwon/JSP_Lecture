<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" scope="page" class="jspbook.ch03.Member" />
<jsp:setProperty name="member" property="*" />
    <%member.getNewId(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form name="join" method=post>
	이름 : <input type="text" name="name" width="200" size="20"> <br>
	이메일 : <input type="text" name="email" width="200" size="20"> <br> 
	전화번호 : <input type="text" name="tel" width="200" size="20"> <br>
	<input type="submit" value="가입">
	<input type="reset" value="재입력">
	</form>
	<br>
	회원가입이 정상적으로 되었습니다.<br>
	회원님의 ID: <jsp:getProperty name="member" property="id" /> 입니다.
</body>
</html>