<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>member/info.jsp</h1>
<%
// // 세션값을 가져오기(페이지 상관없이 값 유지)
// String id=(String)session.getAttribute("id");

// // MemberDAO 메서드 정의  리턴할형  getMember(id)
// // MemberDAO 객체생성
// MemberDAO mdao=new MemberDAO();
// // getMember() 메서드 호출
// MemberBean mb=mdao.getMember(id);

%>
<%-- <%= %> 대신에 ${ }으로 출력하기 (EL표현언어 사용) -> JSP 문법  --%>

아이디 : ${mb.id}<%//=mb.getId() %><br> 
비밀번호 : ${mb.pass}<%//=mb.getPass() %><br> 
이름: ${mb.name}<%//=mb.getName() %><br> 
가입날짜: ${mb.date}<%//=mb.getDate() %><br> 

<a href="main">main.jsp 이동</a>
</body>
</html>






