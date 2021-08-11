<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PERFUMESHIP</title>
</head>
<body>
 <section id="aa-catg-head-banner">
    <img src="<c:url value='/resources/img/fashion/조말론5.gif'/>" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2  style="font-family: serif;">My Page</h2>
        <ol class="breadcrumb">
          <li><a href="<c:url value='/basket.sh'/>">장바구니</a></li> 
          <li><a href="<c:url value='/orderList.sh'/>">주문내역</a></li>
          <li><a href="<c:url value='/myWishList.sh'/>">찜목록</a></li> 
          <li><a href="<c:url value='/reviewList.sh'/>">내 리뷰</a></li>    
          <li><a href="<c:url value='/coupon.sh'/>">쿠폰 & 포인트</a></li> 
          <li><a href="<c:url value='/userCheck.sh'/>">회원 정보</a></li>    
          <li><a href="<c:url value='/subscribe.sh'/>">구독 정보</a></li> 
          <!-- 현재 구독 정보 페이지는 subscribeComingSoon.jsp로 연결됩니다. -->  
        </ol>
      </div>
     </div>
   </div>
  </section>
</body>
</html>