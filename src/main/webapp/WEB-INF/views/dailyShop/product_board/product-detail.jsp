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
 <script src="<c:url value='/resources/script/jquery-3.6.0.js'/>"></script> 
  <script type="text/javascript">
  $(document).ready(function(){	 
	  $('#wishlistbtn').click(function(){
		  $.ajax('<c:url value="/checkSession.sh"/>', {
				data:{member_email:$('#member_email').val()},
				success:function(rdata){
					if(rdata=="empty") {
						location.href="<c:url value='/login.sh'/>";
					} else {
						$.ajax('<c:url value="/pushWishList.sh"/>',{ // 눌렀을때 insert delete 작동
							data:{
								product_idx:$('#product_idx').val(),
								member_email:$('#member_email').val()
							},
							success:function(rdata){
							var heart = rdata;
							$.ajax('<c:url value="/checkWishCount.sh"/>',{ // 위시리스트 카운트조회
								data:{
									product_idx:$('#product_idx').val()
								},
								success:function(wishCount){
									if(heart == "offHeart"){
										heart = "좋아요♡ "+ wishCount;
									} else {
										heart = "좋아요♥ "+ wishCount; // 현재 카운트 리스트에 따른 하트와 카운트값 같이 출력
									}
									$('#wish').html(heart);
								}	
							});		 
							}
						});	
					}	
				}
			 });
		 });
	  });
  </script>
    
 	<script src="<c:url value='/resources/script/jquery-3.6.0.js'/>"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#intoCart').click(function() {
			$.ajax('<c:url value="/checkSession.sh"/>', {
				data:{member_email:$('#member_email').val()},
				success:function(rdata){
					if(rdata=="empty") {
						location.href="<c:url value='/login.sh'/>";
					} else {
						var popupWidth = 330, popupHeight = 185;
						// 팝업창 화면 한가운데 열리게 설정
						var popupX = (window.screen.width / 2) - (popupWidth / 2);
						var popupY= (window.screen.height / 2) - (popupHeight / 2);
						
						var popUp = window.open("about:blank","basket", 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
						
						$.ajax('<c:url value="/intoBasket.sh"/>', {
							data:{
								product_idx:$('#product_idx').val(),
								quantity:$('#quantity').val(),
								member_email:$('#member_email').val()
								},
							success:function(rdata){
								if(rdata=="in") {
									popUp.location.href="<c:url value='/basketPopUp.sh'/>";
								} else {
									popUp.close();
									alert('장바구니에 담기 실패');
								}
							}
						});
					}
				}
			});
		});
	});
</script>
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
        <h2></h2>
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
                        <div class="simpleLens-big-image-container"><a data-lens-image="<c:url value='/resources/upload/${productBean.product_main_image }'/>" class="simpleLens-lens-image"><img src="<c:url value='/resources/upload/${productBean.product_main_image }'/>" class="simpleLens-big-image"></a></div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Modal view content -->
                <div class="col-md-7 col-sm-7 col-xs-12">
                  <div class="aa-product-view-content">
                  <!-- 제품명 -->
<!--                   값 전달을 위해 hidden으로 가공 -->
                  	<input type="hidden" id="product_idx" value="${productBean.product_idx}">
                  	<input type="hidden" id="member_email" value="${sessionScope.member_email}">
                    <h3>${productBean.product_name}</h3>
                    <div class="aa-price-block">
                   <!-- 제품 가격  -->
                     <span class="aa-product-view-price">판매가격 : ${productBean.product_price}</span><br>
<!--                      <span class="aa-product-view-price">소비자가격 : <del>86,000원</del></span> -->
                    <!-- 재고 상태 -->
                      <p class="aa-product-avilability">재고상태 : <span>${productBean.product_stock} 개</span></p>
                    </div>
                    <!-- 제품 간단 설명 -->
                    <p>${productBean.product_detail }</p>
                    
                    <p>좋아요 수 : ${productBean.product_likecount }</p>
                 
<!--                     <h4>Size</h4> -->
					<!-- 제품 용량 -->
                    <div class="aa-prod-view-size">
                     제품 사이즈 : ${productBean.product_size } ml <br>
                 	 제품 카테고리 : ${productBean.product_category }
                    </div>
                    

					<!-- 제품 수량 -->
                    <div class="aa-prod-quantity">
                    수량 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:<input class="aa-prod-category" type="number" value="1" min="1" id="quantity">
                    </div>
            
                    <div class="aa-prod-view-bottom">
                      <a class="aa-add-to-cart-btn" href="#">바로구매</a>
                      <a class="aa-add-to-cart-btn" href="#" id="intoCart">장바구니 담기</a>
<!--                       <a class="aa-add-to-cart-btn" href="#">장바구니 담기</a> -->
<!--                       <input type="button" class="aa-add-to-cart-btn" value="" name="wishlistbtn" id="wishlistbtn"> -->
					<c:choose>
						<c:when test="${wl.wishlistcount eq 0 }">
                      		<a class="aa-add-to-cart-btn" id="wishlistbtn" > <span id="wish">좋아요♡ ${productBean.product_likecount }</span></a>
						</c:when>
						<c:otherwise>
                      		<a class="aa-add-to-cart-btn" id="wishlistbtn" >  <span id="wish">좋아요♥ ${productBean.product_likecount }</span></a>
                        </c:otherwise>
					</c:choose>
<!--                       <a class="aa-add-to-cart-btn" href="#">Compare</a>  href="pushWishList.sh?product_idx=${pd.product_idx }"-->
<%--                       <a class="aa-add-to-cart-btn" href="pushWishList.sh?product_idx=${pd.product_idx}"> 찜 ${pd.product_likecount }</a> --%>
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
                
                 <img src='<c:url value="/resources/upload/${productBean.product_detail_image }"/>'>
                  
                </div>
                <div class="tab-pane fade in active2" id="information">
                
                <!-- 상품 구매 안내 부분 -->
                 ${productBean.product_detail_image }
                
                </div>
                
                <!-- 리뷰 -->
                <div class="tab-pane fade in active3" id="review">
                 <div class="aa-product-review-area">
                 <!-- 총 리뷰 총수 -->
<!--                    <h4>[2 Reviews for T-Shirt]</h4>  -->
                   <ul class="aa-review-nav">
                   
                    <c:forEach var="reviewList" items="${reviewList}"> 
                     <li>
                        <div class="media">
                          <div class="media-body">
                          <div class="media-lef=">
                            <a href="#">
                            
                            <!-- 리뷰 이미지 300px, 300px -->
		                      <img class="media-object" src='<c:url value="/resources/upload/${reviewList.review_image }" />'>
                              <img class="media-object" src='<c:url value="/resources/upload/${reviewList.review_image2 }" />'>
                             
                            </a>
                          </div>
                         
                         <!-------------------------------  리뷰 작성자, 작성일  --------------------------------------->
                         
                         	<h4 class="media-heading"><strong>제목 : ${reviewList.review_subject}</strong></h4>
                            <h4 class="media-heading"><strong>작성자 : ${reviewList.review_email}</strong> - <span>작성일 : ${reviewList.review_date}</span></h4>
                           <div class="star-rating">

						<!-------------------------------  별점 체크안되는 빈공간 --------------------------------------->
                           <c:set var ="review_star" value="${ reviewList.review_star }"></c:set>
                            <c:if test="${review_star eq 1}">
							  <label for="5-stars" class="star">&#9733;</label>
							  <label for="4-stars" class="star">&#9733;</label>
							  <label for="3-stars" class="star">&#9733;</label>
							  <label for="2-stars" class="star">&#9733;</label>
						   </c:if>
						   
						    <c:if test="${review_star eq 2}">
							
							  <label for="4-stars" class="star">&#9733;</label>
							  <label for="3-stars" class="star">&#9733;</label>
							  <label for="2-stars" class="star">&#9733;</label>
						   </c:if>
						    <c:if test="${review_star eq 3}">
							  <label for="5-stars" class="star">&#9733;</label>
							  <label for="4-stars" class="star">&#9733;</label>
							  
						   </c:if>

						   <c:if test="${review_star eq 4}">
							  <label for="5-stars" class="star">&#9733;</label>
							
						
						   </c:if>
						 
                           
                      <c:forEach var="review_star" items="${ratingOptions}" varStatus="status" begin="1" end="${reviewList.review_star}">

<!-- 							 별점 체크 되는 부분 곳 -->
							  <input type="checkbox" id="1-star" name="review_star" checked="checked" />
							  <label for="1-star" class="star">&#9733;</label>
							
							
						</c:forEach>
<%-- 		                     <input type="text" name="review_star" value=${ reviewList.review_star }> --%>
		                   </div>
		                   
                          <!-------------------------------  리뷰내용  --------------------------------------->
<%--                             <p>${reviewList.review_content}</p> --%>
							
                            <p><textarea rows="10px" cols="55px" name="review_content" readonly="readonly">${reviewList.review_content}</textarea></p>
                        	
                            <input type="button" class="aa-browse-btn" value="수정" onclick="updateReview (${reviewList.review_idx} )">
                            <input type="button" class="aa-browse-btn" value="삭제" onclick="deleteReview(${reviewList.review_idx} )">
                           
                        
                          </div>
                          
                        </div>
                      </li>
                    </c:forEach>
                   </ul>
                  </div>
                    <!-------------------------------  페이징  --------------------------------------->
                   <div class="aa-blog-archive-pagination" align="center">
                      <nav>
                        <ul class="pagination">
                          <li>
                          <c:if test="${pb.startPage > pb.pageBlock }">
                            <a href='<c:url value="/reviewList.sh?pageNum=${pb.startPage-pb.pageBlock }" />' aria-label="Previous">
                              <span aria-hidden="true">«</span>
                            </a>
                            </c:if>
                                                       
                          </li>
                          
                          <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }" step="1">
                          	<li><a href='<c:url value="/reviewList.sh?pageNum=${i }" />'>${i }</a></li>
    					  </c:forEach>
					
                          <li>
                          <c:if test="${pb.endPage < pb.pageCount }">
                           <a href='<c:url value="/reviewList.sh?pageNum=${pb.startPage+pb.pageBlock }" />' aria-label="Next">
                              <span aria-hidden="true">»</span>
                            </a>
                          </c:if>
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
       </div>
      </section>
  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

    

  </body>
</html>