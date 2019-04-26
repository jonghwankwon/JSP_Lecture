<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.*" import="java.util.*"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsMain.jsp</title>
<style>
table {
	width: 80%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin-bottom: 5%;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

th:nth-child(2n), td:nth-child(2n) {
	background-color: #bbdefb;
}

th:nth-child(2n+1), td:nth-child(2n+1) {
	background-color: #e3f2fd;
}
</style>
</head>
<body>
	<div align="center">
		<h2>게시판</h2>
		${memberName} 회원님 반갑습니다.<br> 
		<a href="bbsWrite.jsp">글쓰기</a>&nbsp;&nbsp; 
		<a href="twit_list.jsp">트윗</a>&nbsp;&nbsp; 
		<a href="memberProcServlet?action=list&mpage=1">회원목록</a>&nbsp;&nbsp;
		<a href="fileServlet?faction=bbs">다운로드</a>&nbsp;&nbsp; 
		<a href="memberProcServlet?action=logout">로그아웃</a>
		<hr>
		<table border="1" style="border-collapse: collapse;">
			<tr bgcolor="skyblue" height="30">
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>최종수정일</th>
				<th>옵션</th>
			</tr>
			<c:set var="bmList" value="${requestScope.bbsMemberList}"/>
			<c:forEach var = "bm" items="${bmList}">  
			<tr>
				<td>${bm.id}</td>
				<td><a href="bbsProcServlet?action=view&id=${bm.id}">${bm.title}</a></td>
				<td>${bm.name}</td>
				<td>${bm.date}</td>
				<td>&nbsp;
					<button onclick="location.href='bbsProcServlet?action=update&id=${bm.id}'">수정</button>&nbsp;
					<button onclick="location.href='bbsProcServlet?action=delete&id=${bm.id}'">삭제</button>&nbsp;
				</td>
			</tr>
				</c:forEach>
		</table>
		<c:set var="pageList" value="${requestScope.pageList}"/>
		<c:forEach var = "pageNo" items="${pageList}"> 
		${pageNo}
		</c:forEach>
	</div>
</body>
</html>