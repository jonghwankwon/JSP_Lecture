<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.*" import="java.util.*"%>
<%
	BbsDAO bDao = new BbsDAO();
	List<BbsMember> contentList = bDao.selectJoinAll(10);
	bDao.close();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsMain.jsp</title>
<style>
td, th {
	width: auto;
	text-align: center;
}
</style>
</head>
<body>
	<div align="center">
		<h2>게시판</h2>
		<hr>
		<form action="/jspbook/member/bbsServlet" method="POST">
			<table border="1" style="border-collapse: collapse;">
				<tr bgcolor="#E3CEF6">
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성내용</th>
					<th>작성날짜</th>
					<th>옵션</th>
				</tr>
				<%
					for (BbsMember bbs : contentList) {
				%>
				<tr>
					<td><%=bbs.getId()%></td>
					<td><%=bbs.getName()%></td>
					<td><%=bbs.getTitle()%></td>
					<td><%=bbs.getContent()%></td>
					<td><%=bbs.getDate()%></td>
					<%
						//	action을 parameta로 받음
							String updateUri = "memberProcServlet?action=bbsUpdate&id=" + bbs.getId();
							String deleteUri = "memberProcServlet?action=bbsdelete&id=" + bbs.getId();
					%>
					<td>&nbsp;
						<button onclick="location.href='<%=updateUri%>'">수정</button>&nbsp;
						<button onclick="location.href='<%=deleteUri%>'">삭제</button>&nbsp;
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<br> <a href="bbsWrite.jsp">글쓰기</a>&nbsp;&nbsp;&nbsp; <a
				href="loginMain.jsp">돌아가기</a>
			<hr>
		</form>
	</div>
</body>
</html>