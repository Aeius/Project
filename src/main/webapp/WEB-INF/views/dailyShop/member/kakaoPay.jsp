<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
    <button onclick="requestPay()">결제하기</button>
  ...
  <script>
  IMP.init("imp35099883"); 
  
    function requestPay() {
      // IMP.request_pay(param, callback) 호출
      IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "kakaopay",
          merchant_uid: "fd61f8ddd34ee2b8cbf8dc344f47beea",
          name: "노르웨이 회전 의자",
          amount: 64900,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              alert('결제 성공');
          } else {
        	  alert('결제 취소');
          }
      });
    }
  </script>
	<h1>카카오 페이</h1>
	<form action="kakaoPay.sh" method="POST">
		<input type="submit" id="paybtn" value="pay">
	</form>
</body>
</html>