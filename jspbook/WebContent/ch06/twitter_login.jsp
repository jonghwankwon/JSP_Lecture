<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch06 : twitter_login.jsp</title>
</head>
<body>
	<div align="center">
	<h2>트위토 로그인</h2>
	<form name="form1" method="POST" action="twitter_list.jsp">
		<input type="text" name="username" />
		<input type="submit" value="로그인"  />
	</form>	
	</div>
</body>
</html>