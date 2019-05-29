<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 첫번째나오는 건 빨간글자 / ","로 구분자를 자동으로 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] movieList = { "타이타닉", "어벤져스", "혹성탈출", "악인전", "킹콩" };
		pageContext.setAttribute("movieList", movieList);
	%>
	<ul>
		<c:forEach var="movie" items="${movieList}" varStatus="status">
			<c:choose>
				<c:when test="${status.first}">
					<li style="font-weight: bold; color: red;">${movie}</li>
				</c:when>
				<c:otherwise>
					<li>${movie}</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	<c:forEach var="movie" items="${movielist}" varStatus="status">
${movie} <c:if test="${not status.last}">,</c:if><!-- 마지막이 아닐 경우 ,를 찍음 -->
	</c:forEach>
</body>
</html>