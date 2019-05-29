<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<style>
table {
	width: 80%;
	height: 40%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
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
		<h2>회원 명단</h2>
		${memberName} 회원님 반갑습니다.<br> 
		<a href="bbsProcServlet?action=list&page=1">게시판</a>&nbsp;&nbsp; 
		<a href="twit_list.jsp">트윗</a>&nbsp;&nbsp; 
		<a href="fileServlet?faction=member">다운로드</a>&nbsp;&nbsp; 
		<a href="/jspbook/member/memberProcServlet?action=logout">로그아웃</a>
		<hr>
		<table border="1" >
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>주소</th>
				<th>옵션</th>
			</tr>
			<c:set var="mList" value="${requestScope.MemberList}" />
			<c:forEach var="mem" items="${mList}">
				<tr>
					<td>${mem.id}</td>
					<td>${mem.name}</td>
					<td>${mem.birthday}</td>
					<td>${mem.address}</td>
					<td>&nbsp;
						<button	onclick="location.href='memberProcServlet?action=update&id=${mem.id}'">수정</button>&nbsp;
						<button	onclick="location.href='memberProcServlet?action=delete&id=${mem.id}'">삭제</button>&nbsp;
					</td>
				</tr>
			</c:forEach>
		</table>
		<c:set var="mpageList" value="${requestScope.mpageList}" />
		<c:forEach var="mpageNo" items="${mpageList}"> 
		${mpageNo} 
		</c:forEach>
	</div>
</body>
</html>