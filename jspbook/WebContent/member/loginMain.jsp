<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="member.*"%>
<%
	MemberDAO mDao = new MemberDAO();
	List<MemberDTO> list = mDao.selectAll();
	mDao.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<style>
table {
	width: 100%;
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
	<center>
		<h2>회원 명단</h2>
		<%=session.getAttribute("memberName")%> 회원님 반갑습니다.<br>
		<a href="bbsMain.jsp">게시판</a>&nbsp;&nbsp;
		<a href="twit_list.jsp">트윗</a>&nbsp;&nbsp;
		<a href="/jspbook/member/memberProcServlet?action=logout">로그아웃</a>
		<hr>
		<table border="1" bordercolor="#1827CA" bgcolor="#D0A9F5" style="border-collapse: collapse;">
			<tr bgcolor="#E3CEF6">
				<th>아이디</th>
				<th>이름</th>
				<th>생일</th>
				<th>주소</th>
				<th>액션</th>
			</tr>
			<%
				for (MemberDTO member : list) {
			%>
			<tr>
				<td><%=member.getId()%></td>
				<td><%=member.getName()%></td>
				<td><%=member.getBirthday()%></td>
				<td><%=member.getAddress()%></td>
				<%
					//	action을 parameta로 받음
					String  updateUri = "memberProcServlet?action=update&id="+member.getId();
					String  deleteUri = "memberProcServlet?action=delete&id="+member.getId();
				%>
				<td>&nbsp;<button onclick="location.href='<%=updateUri%>'">수정</button>&nbsp;
				<button onclick="location.href='<%=deleteUri%>'">삭제</button>&nbsp;</td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
</body>
</html>