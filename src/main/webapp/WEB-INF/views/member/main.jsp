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
<c:if test="${ empty sessionScope }">
	<c:redirect url="login"></c:redirect>
</c:if>
<h1>member/main.jsp</h1>
${sessionScope.id }님 로그인 하셨습니다.
<input type="button" value="로그아웃" 
               onclick="location.href='<c:url value="/member/logout" />'"><br>
<a href='<c:url value="/member/info" />'>회원정보조회</a><br>
<a href='<c:url value="/member/update" />'>회원정보수정</a><br>
<a href='<c:url value="/member/delete" />'>회원정보삭제</a><br>
<%
// 관리자 "admin" 아이디를 가진 관리자 정함
// if 세션값 있으면
// if 세션값과 "admin" 비교해서 맞으면 회원정보목록 보이기
// if(id != null){
// 	if(id.equals("admin")){
		
// 	}
// }
%>
<c:if test="${ ! empty sessionScope }">
	<c:if test="${ sessionScope.id eq 'admin' }">
		<a href="list">회원정보목록</a><br>
	</c:if>
</c:if>
</body>
</html>




