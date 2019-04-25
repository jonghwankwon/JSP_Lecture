<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.*" import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	List<BbsMember> bmList = (List<BbsMember>) request.getAttribute("bbsMemberList");
	List<String> pageList = (List<String>) request.getAttribute("pageList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsMain.jsp</title>
<style>
table {
	width: 80%;
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
		<%=(String) session.getAttribute("memberName")%>
		회원님 반갑습니다.<br> <a href="bbsWrite.jsp">글쓰기</a>&nbsp;&nbsp; <a
			href="twit_list.jsp">트윗</a>&nbsp;&nbsp; <a href="loginMain.jsp">회원목록</a>&nbsp;&nbsp;
		<a href="memberProcServlet?action=logout">로그아웃</a>
		<hr>
		<table border="1" style="border-collapse: collapse;" width=600>
			<tr bgcolor="skyblue" height="30">
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>최종수정일</th>
				<th>액션</th>
			</tr>
			<%
				for (BbsMember bm : bmList) {
			%>
			<tr height="25">
				<td><%=bm.getId()%></td>
				<td><a href="bbsProcServlet?action=view&id=<%=bm.getId()%>"><%=bm.getTitle()%></a></td>
				<td><%=bm.getName()%></td>
				<td><%=bm.getDate().substring(0, 16)%></td>
				<%
					String updateUri = "bbsProcServlet?action=update&id=" + bm.getId();
						String deleteUri = "bbsProcServlet?action=delete&id=" + bm.getId();
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
		<%
			for (String bmPage : pageList)
				out.print(bmPage);
		%>
	</div>
</body>
</html>