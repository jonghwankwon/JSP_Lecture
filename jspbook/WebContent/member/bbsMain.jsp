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
table {
	width: 50%;
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
		<h2>게시판</h2>
		<hr>
		<table border="1" style="border-collapse: collapse;">
			
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성날짜</th>
				<th>옵션</th>
			</tr>
			<%
				for (BbsMember bbs : contentList) {
			%>
			<tr>
				<td><%=bbs.getId()%></td>
				<td><%=bbs.getName()%></td>
				<td><a href="bbsProcServlet?action=view&id=<%=bbs.getId()%>"><%=bbs.getTitle()%></a></td>
				<td><%=bbs.getDate()%></td>
				<%
					//	action을 parameta로 받음
						String bbsupdateUri = "bbsProcServlet?action=update&id=" + bbs.getId();
						String bbsdeleteUri = "bbsProcServlet?action=delete&id=" + bbs.getId();
						//System.out.println("bbsMain: " + bbsupdateUri);
				%>
				<td>&nbsp;
					<button onclick="location.href='<%=bbsupdateUri%>'">수정</button>&nbsp;
					<button onclick="location.href='<%=bbsdeleteUri%>'">삭제</button>&nbsp;
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<br> <a href="bbsWrite.jsp">글쓰기</a>&nbsp;&nbsp;&nbsp; 
		<a href="loginMain.jsp">뒤로가기</a>
		<hr>
	</div>
</body>
</html>