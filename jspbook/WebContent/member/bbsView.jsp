<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsView</title>
<style type="text/css">
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
		<%
			request.setCharacterEncoding("UTF-8");
			BbsDTO bbs = (BbsDTO) request.getAttribute("bDto");
			System.out.println(bbs.toString());
		%>
		<h2>게시글 상세보기</h2>
		<hr>
			<table border="1">
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
				<tr>
					<th>글번호</th>
					<td><%=bbs.getId()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=bbs.getTitle()%></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td><%=session.getAttribute("memberName")%></td>
				</tr>
				<tr>
					<th>수정일시</th>
					<td><%=bbs.getDate()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%=bbs.getContent()%></td>
				</tr>
				<tr>
					<%
					String  updateUri = "bbsProcServlet?action=update&id="+bbs.getId();
					String  deleteUri = "bbsProcServlet?action=delete&id="+bbs.getId();
					%>
					<td colspan="2">
				<button onclick="location.href='<%=updateUri%>'">수정</button>&nbsp;
				<button onclick="location.href='<%=deleteUri%>'">삭제</button>&nbsp;
				<input type=button value="뒤로가기" name="B3" onClick="history.back()"></td>
				</tr>
			</table>
	</div>
</body>
</html>