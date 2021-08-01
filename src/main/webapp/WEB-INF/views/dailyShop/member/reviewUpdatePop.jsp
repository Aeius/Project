<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
		alert('리뷰수정완료');
		opener.location.href ='<c:url value='/reviewList.sh'/>'	 
		window.opener.document.location.reload();
 	 	window.close();
	 </script>
</head>
<body>

</body>
</html>