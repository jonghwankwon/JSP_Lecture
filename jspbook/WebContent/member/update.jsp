<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>회원 가입</title>
<style>
label span {
	display: inline-block;
	width: 100px;
	text-align: center;
	padding: 15px;
}
</style>
</head>
<body>
	<center>
		<%
			MemberDTO member = (MemberDTO) request.getAttribute("member");
		%>
		<h2>회원 수정</h2>
		<hr>
		<form name="registerForm" action=/jspbook/member/updateMemberServlet method=post>
			<input type="hidden" id="id" name="id" value="<%=member.getId()%>">
			<label><span>아이디:</span>
			<%=member.getId()%></label><br>

			<label><span>이름:</span>
			<input type="text" name="name" value="<%=member.getName()%>" size="10"></label> <br>
		
			<label><span>생일:</span>
			<input type="text" name="birthday" value="<%=member.getBirthday()%>"size="10"></label><br> 
			
			<label><span>주소:</span>
			<input type="text" name="address" value="<%=member.getAddress() %> " size="10"></label><br> 
			
			<label><span><input type="submit" value="정보 수정" name="B1">&nbsp;&nbsp;</span></label> 
			<label><span><input type="reset" value="재작성" name="B2"></span></label>
		</form>
	</center>
</body>
</html>