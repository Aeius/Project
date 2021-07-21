<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <h3>나의 보유 포인트 : <%=1000 %></h3>
            <div class="aa-product-catg-body">
            <form action="#" method="post">
            <input type="text" value="" name="coupon" placeholder="쿠폰번호를 입력">
            <input type="submit" value="쿠폰등록"> 
            </form>
            
            <br>
                  <table id="example1" class="table table-bordered table-striped">
                   <thead>
                      <tr>
                        <th>쿠폰코드</th>
                        <th>할인액</th>
                        <th>발급일</th>
                        <th>만료일</th>
                      </tr>
                    </thead>
                    <!-- 쿠폰 목록 나열 -->
                    <tbody>
                      <tr>
                        <td>WELCOME</td>
                        <td>3000원</td>
                        <td>2021.07.13</td>
                        <td>2021.07.20</td>
                      </tr>
                      <tr>
                        <td>SUMMERSUMMER</td>
                        <td>2000원</td>
                        <td>2021.07.15</td>
                        <td>2021.08.05</td>
                      </tr>
                      <tr>
                        <td>LOVEPURFUME</td>
                        <td>1000원</td>
                        <td>2021.07.10</td>
                        <td>2021.07.31</td>
                      </tr>
                    </tbody>
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