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
  <section id="aa-product-details">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-product-details-area">
				<h2>내 리뷰</h2>
            <div class="aa-product-details-bottom">
              <!-- 상세정보 사진 부분 -->
                
                <!-- 리뷰 -->
                <div class="tab-pane fade in active3" id="review">
                 <div class="aa-product-review-area">
                 <!-- 총 리뷰 총수 -->
<!--                    <h4>[2 Reviews for T-Shirt]</h4>  -->
                   <ul class="aa-review-nav">
                     <li>
                        <div class="media">
                          <div class="media-body">
                          <div class="media-lef=">
                            <a href="#">
                            <!-- 상품 이미지 300px, 300px -->
                              <img class="media-object" src="../img/testimonial-img-3.jpg" alt="girl image">
                              <img class="media-object" src="../img/testimonial-img-3.jpg" alt="girl image">
                            </a>
                          </div>
                         
                         <!-------------------------------  리뷰 작성자, 작성일  --------------------------------------->
                            <h4 class="media-heading"><strong>리뷰작성자</strong> - <span>March 26, 2016 작성일</span></h4>
                            <div class="aa-product-rating">
                           <!-------------------------------  별점  --------------------------------------->
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star"></span>
                              <span class="fa fa-star-o"></span>
                            </div>
                          <!-------------------------------  리뷰내용  --------------------------------------->
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.<br>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p> 
                                  
                            <a href="#" class="reply-btn">삭제</a>
                            <a href="#" class="reply-btn">수정</a>
                          </div>
                          
                        </div>
                      </li>
                   </ul>
                   </div>
                   </div>
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