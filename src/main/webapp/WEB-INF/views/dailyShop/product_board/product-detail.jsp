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
  <section id="aa-catg-head-banner">
   <img src="<c:url value='/resources/img/fashion/fashion-header-bg-8.jpg'/>" alt="fashion img">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>T-Shirt</h2>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

  <!-- product category -->
  <section id="aa-product-details">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-product-details-area">
            <div class="aa-product-details-content">
              <div class="row">
                <!-- Modal view slider -->
                <div class="col-md-5 col-sm-5 col-xs-12">                              
                  <div class="aa-product-view-slider">                    
                  <!-- 상품 이미지 돋보기 확대 기능 -->            
                    <div id="demo-1" class="simpleLens-gallery-container">
                      <div class="simpleLens-container">
                      <!-- 돋보기로 확대될 사진 넣는 곳 -->
                        <div class="simpleLens-big-image-container"><a data-lens-image="<c:url value='/resources/img/view-slider/large/polo-shirt-1.png'/>" class="simpleLens-lens-image"><img src="<c:url value='/resources/img/view-slider/medium/polo-shirt-1.png'/>" class="simpleLens-big-image"></a></div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Modal view content -->
                <div class="col-md-7 col-sm-7 col-xs-12">
                  <div class="aa-product-view-content">
                  <!-- 제품명 -->
                    <h3>${pd.product_name}</h3>
                    <div class="aa-price-block">
                   <!-- 제품 가격  -->
                     <span class="aa-product-view-price">판매가격 : ${pd.product_price }</span><br>
<!--                      <span class="aa-product-view-price">소비자가격 : <del>86,000원</del></span> -->
                    <!-- 재고 상태 -->
                      <p class="aa-product-avilability">재고상태 : <span>${pd.product_stock } 개</span></p>
                    </div>
                    <!-- 제품 간단 설명 -->
                    <p>${pd.product_detail1 }</p>
                    <p>${pd.product_detail2 }</p>
                    <p>좋아요 수 : ${pd.product_likecount }</p>
                   
                 
<!--                     <h4>Size</h4> -->
					<!-- 제품 용량 -->
                    <div class="aa-prod-view-size">
                     제품 사이즈 : ${pd.product_size } ml <br>
                 	 제품 카테고리 : ${pd.product_category }
                    </div>
                    

					<!-- 제품 수량 -->
                    <div class="aa-prod-quantity">
                    수량 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:<input class="aa-prod-category" type="number" value="1" min="1">
                    </div>
            
                    <div class="aa-prod-view-bottom">
                      <a class="aa-add-to-cart-btn" href="#">바로구매</a>
                      <a class="aa-add-to-cart-btn" href="#">장바구니 담기</a>
                      <a class="aa-add-to-cart-btn" href="pushWishList.sh?product_idx=${pd.product_idx }"> 찜 ${pd.product_likecount }</a>
<!--                       <a class="aa-add-to-cart-btn" href="#">Compare</a> -->
                    </div>
                    
               
                    
                  </div>
                </div>
              </div>
            </div>
            <div class="aa-product-details-bottom">
              <ul class="nav nav-tabs" id="myTab2">
                <li><a href="#description" data-toggle="tab">상품상세정보</a></li>
                <li><a href="#review" data-toggle="tab">상품사용후기</a></li>
                <li><a href="#information" data-toggle="tab">상품구매안내</a></li>            
              </ul>

              <!-- 상세 정보 사진 부분 -->
              <div class="tab-content">
                <div class="tab-pane fade in active" id="description">
                
                 ${pd.product_main_image }
                  
                </div>
                <div class="tab-pane fade in active2" id="information">
                
                <!-- 상품 구매 안내 부분 -->
                 ${pd.product_detail_image }
                
                </div>
                
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
                            <!-- 리뷰 작성시 올린 상품 이미지 300px, 300px -->
                              <img class="media-object" src="<c:url value='/resources/img/testimonial-img-3.jpg'/>" alt="girl image">
                              <img class="media-object" src="<c:url value='/resources/img/testimonial-img-3.jpg'/>" alt="girl image">
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
                    <!-- 페이징 부분 -->
                 <div class="aa-blog-archive-pagination" align="center">
                      <nav>
                        <ul class="pagination">
                          <li>
                            <a href="#" aria-label="Previous">
                              <span aria-hidden="true">«</span>
                            </a>
                          </li>
                          <li><a href="#">1</a></li>
                          <li><a href="#">2</a></li>
                          <li><a href="#">3</a></li>
                          <li><a href="#">4</a></li>
                          <li><a href="#">5</a></li>
                          <li>
                            <a href="#" aria-label="Next">
                              <span aria-hidden="true">»</span>
                            </a>
                          </li>
                        </ul>
                      </nav>
                    </div>      
                 </div>
                </div>            
              </div>
            </div>
          </div>
         </div>
      </section>
  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

    

  </body>
</html>