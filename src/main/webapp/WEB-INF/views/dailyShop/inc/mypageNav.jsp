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
 <section id="aa-catg-head-banner">
    <img src="<c:url value='/resources/img/fashion/조말론5.gif'/>" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>My Page</h2>
        <ol class="breadcrumb">
          <li><a href="./cart.jsp">장바구니</a></li> 
          <li><a href="./orderList.jsp">주문내역</a></li>
          <li><a href="./wishlist.jsp">찜목록</a></li> 
          <li><a href="./myReview.jsp">내 리뷰</a></li>    
          <li><a href="<c:url value='/coupon.sh'/>">혜택</a></li> 
          <li><a href="<c:url value='/update.sh'/>">내 정보</a></li>    
          <li><a href="./subscribe.jsp">구독 정보</a></li>   
        </ol>
      </div>
     </div>
   </div>
  </section>
</body>
</html>