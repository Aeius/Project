<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action='<c:url value="/member/loginPro"/>' method="post">
	로그인 <br>
	회원 ID : <input type="text" name="id"> <br>
	비밀번호 : <input type="password" name="pass"> <br>
	<input type="submit" value="로그인">
	<a href = "insert">회원가입</a>
</form>
</body>
</html>