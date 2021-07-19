<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>member/updateForm.jsp</h1>
	
<%-- <%= %> 대신에 ${ }으로 출력하기 (EL표현언어 사용) -> JSP 문법  --%>

<form action="updatePro" method="post">
아이디 : <input type="text" name="id" value="${mb.id}" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name" value="${mb.name}"><br>
<input type="submit" value="회원수정">
</form>	

</body>
</html>





