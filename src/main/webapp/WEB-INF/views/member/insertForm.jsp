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
<form action="<c:url value="/member/insertPro" />" method="post">
회원 가입 <br>
회원 ID : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
이름 :  <input type="text" name="name"><br>
<input type="submit" value="가입">
</form>
</body>
</html>