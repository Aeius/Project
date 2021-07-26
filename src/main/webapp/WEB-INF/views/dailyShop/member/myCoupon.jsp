<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Daily Shop | Home</title>
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  

  </head>
  <body>
<!--   session 값 없을 때 로그인 페이지로 이동 -->
<%--   <c:choose> --%>
<%-- 	<c:when test="${ empty sessionScope }"> --%>
<%-- 		<c:redirect url="login"></c:redirect> --%>
<%-- 	</c:when> --%>
<%-- `</c:choose>  --%>
<%-- <c:if test="${empty sessionScope.member_email}"> --%>
<%-- 	<c:redirect url="/login.sh"></c:redirect> --%>
<%-- </c:if> --%>
   <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->


  <!-- header -->
<jsp:include page="../inc/header.jsp"></jsp:include>
  <!-- / menu -->
  
  <!-- catg header banner section -->
  <jsp:include page="../inc/mypageNav.jsp"></jsp:include>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
   <!-- product category -->
  <section id="cart-view">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-product-catg-content">
          <br><br>
          <!-- 쿠폰 등록 추가 -->
          <!-- 페이징 지우기 -->
          <h2>혜택</h2>
            <h3>나의 보유 포인트 : ${member.member_point}</h3>
            <div class="aa-product-catg-body">
            <form action="<c:url value='/couponPro.sh'/>" method="post">
            <input type="text" name="inputCouponCode" placeholder="쿠폰번호를 입력">
            <input type="submit" value="쿠폰등록"> 
            </form>
            
            <br>
                  <table id="example1" class="table table-bordered table-striped">
                  <tr>
                  	<td>쿠폰명</td>
                  	<td>할인금액</td>
                  	<td>사용기한</td>
                  	<td>사용여부</td>
					</tr>
						<c:forEach var="couponInfoList" items="${couponInfoList}" varStatus="status">
                   		<tr>
							<td>${couponInfoList.coupon_name}</td>
							<td>${couponInfoList.coupon_price}원</td>
							<td>${couponInfoList.coupon_date} ~ ${couponInfoList.coupon_expireDate}</td>
							<td><c:choose>
								    <c:when test="${couponInfoList.coupon_status eq false}">
								    	사용 완료
								    </c:when>         
								    <c:otherwise>
								    	사용 가능
								    </c:otherwise>
							 	</c:choose></td>
                      </tr>
                    </thead>
                    <!-- 쿠폰 목록 나열 -->
                    <tbody>
                    	<c:forEach var="couponInfoList" items="${couponInfoList}">
	                      <tr>
	                        <td>${couponInfoList.coupon_name}</td>
	                        <td>${couponInfoList.coupon_price}원</td>
	                        <td>${couponInfoList.coupon_date}</td>
	                        <td>${couponInfoList.coupon_expireDate}</td>
	                      </tr>
                     	</c:forEach>
                    </tbody>
					</c:forEach>
                  </table>
            </div>
          </div>
        </div>
	</div>
	</div>
  </section>
  <!-- / product category -->

 <!-- / Cart view section -->

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

    

  </body>
</html>