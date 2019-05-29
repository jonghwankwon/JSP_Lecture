<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
	<c:when test="${param.login == 'user'}">
		<span>사용자 로그인</span>
	</c:when>
		<c:when test="${param.login == 'admin' && param.id == 'root' && param.passwd == '1234' }">
			<span>관리자 로그인</span>
		</c:when>
		<c:otherwise>
			<span>아이디와 비밀번호를 확인하세요.</span>
		</c:otherwise>
	</c:choose>

</body>
</html>