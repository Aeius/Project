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
<h1>member/info.jsp</h1>
<%-- <%= %> 대신에 ${ } 출력 EL(표현언어) --%>

아이디 : ${mb.id}<br> 
비밀번호 : ${mb.pass}<br> 
이름: ${mb.name}<br> 
가입날짜: ${mb.date}<br> 

<a href='<c:url value="/member/main" />'>main.jsp 이동</a>
</body>
</html>






