<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/script/jquery-3.6.0.js'/>"></script> 
<script type="text/javascript">
	$(document).ready(function{
		$('#paybtn').click(function(){
			$.ajax({
				url:'<c:url value="/kakaoPay.sh"/>',
				datatype:'json',
				success:function(rdata){
					alert(rdata.tid);
				},
				error:function(error){
					alert(error);
				}
			});
		});
	});
</script>
</head>
<body>

<h1>카카오 페이</h1>
<input type="button" id="paybtn" value="pay">
</body>
</html>