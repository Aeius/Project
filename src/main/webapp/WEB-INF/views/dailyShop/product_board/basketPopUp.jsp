<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PERFUMESHIP</title>
   <!-- Font awesome -->
    <link href="<c:url value='/resources/member/css/font-awesome.css'/>" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<c:url value='/resources/member/css/bootstrap.css'/>" rel="stylesheet">   
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="<c:url value='/resources/member/css/jquery.smartmenus.bootstrap.css'/>" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/member/css/jquery.simpleLens.css'/>">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/member/css/slick.css'/>">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/member/css/nouislider.css'/>">
    <!-- Theme color -->
    <link id="switcher" href="<c:url value='/resources/member/css/theme-color/default-theme.css'/>" rel="stylesheet">
    <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
    <!-- Top Slider CSS -->
    <link href="<c:url value='/resources/member/css/sequence-theme.modern-slide-in.css'/>" rel="stylesheet" media="all">
 
    <!-- Main style sheet -->
    <link href="<c:url value='/resources/member/css/style.css'/>" rel="stylesheet">    

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <script type="text/javascript">
    	function goToBasket() {
    		// 부모창 이동
    		opener.document.location.href="<c:url value='/basket.sh'/>"
   			// 자식창 닫기
    		self.close();
		}
    	
    	function continueShopping() {
   			self.close();
		}
    </script>
</head>
<body>
 
<div class="aa-prod-view-bottom">
<br><br>
<p style="font-size: 10px; text-align: center;">장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?</p>
	<div style="text-align: center; margin-top: 15px;">
		<a class="aa-add-to-cart-btn" href="#" onclick="goToBasket()">장바구니 이동</a>&nbsp;&nbsp;<a class="aa-add-to-cart-btn" href="#" onclick="continueShopping()">쇼핑계속하기</a>
	</div>
</div>
</body>
</html>