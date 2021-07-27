<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Daily Shop | Home</title>
    
    <!-- Font awesome -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">   
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="css/jquery.simpleLens.css">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="css/theme-color/default-theme.css" rel="stylesheet">
    <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
    <!-- Top Slider CSS -->
    <link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="css/style.css" rel="stylesheet">    

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    

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
           <div class="cart-view-table">
             <form action="">
               <div class="table-responsive">
               <h2>장바구니</h2>
                  <table class="table">
                    <thead>
                      <tr>
                        <th></th>
                        <th></th>
                        <th>제품명</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>총 가격</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><a class="remove" href="#"><fa class="fa fa-close"></fa></a></td> <!-- 삭제버튼 -->
                        <td><a href="#"><img src="../img/man/polo-shirt-1.png" alt="img"></a></td> <!-- 이미지 -->
                        <td><a class="aa-cart-title" href="#">향수이름1</a></td>
                        <td>가격1</td>
                        <td><input class="aa-cart-quantity" type="number" value="1"></td> <!-- 수량입력 -->
                        <td>가격1 X 수량</td>
                      </tr>
                      <tr>
                        <td><a class="remove" href="#"><fa class="fa fa-close"></fa></a></td>
                        <td><a href="#"><img src="../img/man/polo-shirt-2.png" alt="img"></a></td>
                        <td><a class="aa-cart-title" href="#">향수이름2</a></td>
                        <td>가격2</td>
                        <td><input class="aa-cart-quantity" type="number" value="1"></td>
                        <td>가격2 X 수량</td>
                      </tr>
                      <tr>
                        <td><a class="remove" href="#"><fa class="fa fa-close"></fa></a></td>
                        <td><a href="#"><img src="../img/man/polo-shirt-3.png" alt="img"></a></td>
                        <td><a class="aa-cart-title" href="#">향수이름3</a></td>
                        <td>가격3</td>
                        <td><input class="aa-cart-quantity" type="number" value="1"></td>
                        <td>가격3 X 수량</td>
                      </tr>
                      <tr>
                        <td colspan="6" class="aa-cart-view-bottom">
                        <!-- 용량 컬럼을 추가해보려고 했는데 colspan="7" 으로 변경하면 밑 부분 표가 깨집니다 -->
                        <!-- _responsice.scss에 관련 스타일이 있는데 다른 태그들이랑 묶여 있어서 손대기 어려울듯.. -->
                          <div class="aa-cart-coupon">
<!--                             <input class="aa-coupon-code" type="text" placeholder="쿠폰(텍스트->셀렉트)"> 셀렉트 박스로 바꿈 -->
                            <select name="coupon"  class="aa-coupon-code">
                            	<option value="">쿠폰 선택</option>
                            	<option value="">3000원 할인 쿠폰</option>
                            	<option value="">1000원 할인 쿠폰</option>
                            </select>
                            <input class="aa-cart-view-btn" type="submit" value="쿠폰 적용">
                          </div>
                          <input class="aa-cart-view-btn" type="submit" value="업데이트"> <!-- 수량 바꾸고 적용하는 버튼 -->
                        </td>
                      </tr>
                      </tbody>
                  </table>
                </div>
             </form>
             <!-- Cart Total view -->
             <div class="cart-view-total">
               <table class="aa-totals-table">
                 <tbody>
                   <tr>
                     <th>가격</th>
                     <td>$450</td>
                   </tr>
                   <tr>
                     <th>할인액</th>
                     <td>- $0</td>
                   </tr>
                   <tr>
                     <th>총 가격</th>
                     <td>$450</td>
                   </tr>
                 </tbody>
               </table>
               <br>* 포인트 사용은 결제 페이지에서 가능합니다
               <a href="#" class="aa-cart-view-btn">결제하기</a>
             </div>
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