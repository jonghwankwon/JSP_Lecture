<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.*" import="java.util.*"%>
<%
	BbsMember bm = (BbsMember)request.getAttribute("bbsMember");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbsupdate.jsp</title>
<style type="text/css">
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
	<center>
		<%
			request.setCharacterEncoding("UTF-8");
			BbsDTO bbs = (BbsDTO) request.getAttribute("bDto");
			System.out.println(bbs.toString());
		%>
		<h2>글 수정</h2>
		<hr>
		<form name="bbsupdateForm" action="/jspbook/member/bbsProcServlet" method="post">
		<input type="hidden" id="id" name="id" value="<%=bbs.getId()%>">
		<input type="hidden" id="action" name="action" value="excute">
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
					<td><input type="text" name="title" value="<%=bbs.getTitle()%>" size="10"></td>
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
					<td><textarea name="content" rows="5" cols="40"><%=bbs.getContent()%></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="수정 완료" name="B1">&nbsp;&nbsp;
					<input type="reset" value="재수정" name="B2">&nbsp;&nbsp; 
					<input type=button value="뒤로가기" name="B3" onClick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>