<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>PerfumeShip</title>
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  

  </head>
  <body> 
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
 <section id="cart-view">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
         <div class="cart-view-area">
           <div class="cart-view-table aa-wishlist-table">
             <form action="">
               <div class="table-responsive">
               <h2>찜 목록</h2>
                  <table class="table">
                    <thead>
                      <tr>
                        <th></th>
                        <th></th>
                        <th>제품명</th>
                        <th>가격</th>
                        <th>재고 상황</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="myWishList" items="${myWishList}">
                      <tr>
                        <td><a class="remove" href="deleteWishList.sh?product_idx=${myWishList.wishList_product_idx }"><fa class="fa fa-close"></fa></a></td>
                        <td><a href="#"><img src="<c:url value='/resources/upload/${myWishList.product_main_image}' />" width="80" height="80" ></a></td>
                        <td><a class="aa-cart-title" href="productDetail.sh?product_idx=${myWishList.wishList_product_idx }">${myWishList.product_name}</a></td>
                        <td>${myWishList.product_price} 원</td>
                        <td>${myWishList.product_stock} 개</td>
                        <td><a href="insertBasket.sh?product_idx=${myWishList.wishList_product_idx }&member_email=${sessionScope.member_email}&quantity=1" class="aa-add-to-cart-btn">장바구니에 담기</a></td>
                      </tr>
                      </c:forEach>
                      </tbody>
                  </table>
                </div>
             </form>             
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>
 <!-- / Cart view section -->

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->



  </body>
</html>