<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script>
	$.ajax({
		method : "POST",
		url : "https://kapi.kakao.com/v1/payment/ready",
		headers :{
			Authorization: "KakaoAK fd61f8ddd34ee2b8cbf8dc344f47beea",
			Content-type: "application/x-www-form-urlencoded;charset=utf-8"
			},
		data : { // 보낼 데이터들
			cid:"TC0ONETIME",
			partner_order_id:"partner_order_id",
			partner_user_id:"partner_user_id",
			item_name="초코파이",
			quantity:"1",
			total_amount:"2200",
			vat_amount:"200",
			tax_free_amount:"0",
			approval_url:"https://developers.kakao.com/success",
			fail_url:"https://developers.kakao.com/fail",
			cancel_url:"https://developers.kakao.com/cancel"
		}
	}).done(function(msg) { // 응답 받은 후 처리할 코드
		alert("Data Saved: " + msg);
	});
</script>

	<h1>카카오 페이</h1>
	<form action="kakaoPay.sh" method="POST">
		<input type="submit" id="paybtn" value="pay">
	</form>
</body>
</html>