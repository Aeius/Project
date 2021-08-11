<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>PERFUMESHIP</title>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  

<script src="<c:url value='/resources/script/jquery-3.6.0.js'/>"></script> 
  <script type="text/javascript">
  $(document).ready(function(){	 
	  $('.aa-add-to-cart-btn').click(function(){
		  var idx = $(this).attr("id")
		  var category = $(this).attr("name");
		  $.ajax('<c:url value="/checkSession.sh"/>', {
				data:{
					member_email:$('#member_email').val()
					},
				success:function(rdata){
					if(rdata=="empty") {
						location.href="<c:url value='/login.sh'/>";
					} else {
						$.ajax('<c:url value="/pushWishList.sh"/>',{ // 눌렀을때 insert delete 작동
							data:{
								product_idx:$('#'+idx).attr("id"),
								member_email:$('#member_email').val()
							},
							success:function(rdata){
							var heart = rdata;
							$.ajax('<c:url value="/checkWishCount.sh"/>',{ // 위시리스트 카운트조회
								data:{
									product_idx:$('#'+idx).attr("id")
								},
								success:function(wishCount){
									if(heart == "offHeart"){
										heart = "좋아요♡ "+ wishCount;
									} else {
										heart = "좋아요♥ "+ wishCount; // 현재 카운트 리스트에 따른 하트와 카운트값 같이 출력
									}
									$('#best' + idx).html(heart);
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
 
  <!------------------------------------------------------- Start slider--------------------------------------------------------- -->
  <section id="aa-slider">
    <div class="aa-slider-area">
      <div id="sequence" class="seq">
        <div class="seq-screen">
          <ul class="seq-canvas">
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/slider_pick1.jpg'/>" onerror="this.src='<c:url value="/resources/img/no_image.jpg"/>'" />
              </div>   
              <div class="seq-title">
               <span data-seq style="color: #353535; background-color:#fff;background-color: rgba( 255, 255, 255, 0.4 );">
               What We Recommend for you</span>                
                <h2 data-seq>당신의 향수를 찾아드립니다.</h2>                
                <p data-seq style="color: #353535; background-color:#fff;background-color: rgba( 255, 255, 255, 0.4 );">퍼퓸 테일러가 당신이 찾는 향수를 추천해 드립니다.</p>
                <a data-seq href="<c:url value='/recoTest.sh'/>" style="border:1px solid #000; background-color: rgba( 255, 255, 255, 0.2 ); " class="aa-shop-now-btn aa-secondary-btn">
                TEST START</a>
              </div>
          
            </li>
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/slider_pick2.jpg'/>" onerror="this.src='<c:url value="/resources/img/no_image.jpg"/>'"/>
              </div>
              <div class="seq-title">
                <span data-seq style="color: #353535; background-color:#fff;background-color: rgba( 255, 255, 255, 0.4 );">
                2021 3/4 Collector's Pick</span>                
                <h2 data-seq>Penhaligon's Choice</h2>                
                <p data-seq style="color: #353535; background-color:#fff;background-color: rgba( 255, 255, 255, 0.4 );">프리미엄 컬렉션을 부티끄에서 만나보세요</p>
                <a data-seq href="<c:url value='/search.sh?search=펜할리곤스'/>"  style="border:1px solid #000; background-color: rgba( 255, 255, 255, 0.5 );"  class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
              <!-- single slide item -->           
              <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/slider_pick2_1.jpg'/>" onerror="this.src='<c:url value="/resources/img/no_image.jpg"/>'" />
              </div>
              <div class="seq-title">
               <span data-seq style="color: white; background-color:black ;background-color: rgba( 0, 0, 0, 0.4 );">
               2021/08 Woman's Pick</span>                 
                <h2 data-seq>Maison Margiela</h2>                
              <p data-seq style="color: #353535; background-color:#fff;background-color: rgba( 255, 255, 255, 0.4 );">
                Maison Margiela의 일관된 디자인 철학, Replica line</p>
                <a data-seq href="<c:url value='/search.sh?search=메종'/>"  style="border:1px solid #000; background-color: rgba( 255, 255, 255, 0.5 );"   class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
            
            <!-- single slide item -->
            <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/slider_pick4.jpg'/>" onerror="this.src='<c:url value="/resources/img/no_image.jpg"/>'" />
              </div>
              <div class="seq-title">
                <span data-seq style="color: white; background-color:black ;background-color: rgba( 0, 0, 0, 0.4 );">2021/08 Man's Pick</span>                
                <h2 data-seq>Mercedes Benz</h2>                
                <p data-seq style="color: #353535;  background-color:#fff;background-color: rgba( 255, 255, 255, 0.4 );" >
                여름에도 지나칠 수 없는 Luxury & Trendy</p>
                <a data-seq href="<c:url value='/search.sh?search=벤츠'/>" style="border:1px solid #000; background-color: rgba( 255, 255, 255, 0.5 );"    class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
          
            <!-- single slide item -->  
 
              <li>
              <div class="seq-model">
                <img data-seq src="<c:url value='/resources/img/slider/slider_pick3.jpg'/>" onerror="this.src='<c:url value="/resources/img/no_image.jpg"/>'" />
              </div>
              <div class="seq-title">
                <span data-seq style="color: #353535; background-color:#fff;background-color: rgba( 255, 255, 255, 0.4 );">
                Taylor's guide for You
                </span>                
                <h2 data-seq>"When you [Wear] the Perfume"</h2>                
                <p data-seq style="color: #fff; ">
               올바르게 입는 니치향수로 무더위 극복하기</p>
                <a data-seq href="<c:url value='/productList.sh'/>"  style=" font-color: white; border:1px solid #000; background-color: rgba( 255, 255, 255, 0.2); "  class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
              </div>
            </li>
            
            
            
            
            
                      
          </ul>
        </div>
        <!-- slider navigation btn -->
        <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
          <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
          <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
        </fieldset>
      </div>
    </div>
  </section>
  <!-- / slider -->
  <!----------------------------------------------------------- Start Promo section--------------------------------------- -->
  <!--  삭제! -->
  <!-- / Promo section -->
  <!---------------------------------------------------------------- Products section --------------------------------->
  <section id="aa-product">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-product-area">
              <div class="aa-product-inner">
                <!-- start prduct navigation -->
                 <ul class="nav nav-tabs aa-products-tab">
                    <li class="active"><a href="#men" data-toggle="tab">베스트 상품</a></li>
<!--                     <li><a href="#women" data-toggle="tab">sdsd</a></li> -->
<!--                     <li><a href="#sports" data-toggle="tab">wewe</a></li> -->
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <!-- Start men product category -->
                    <div class="tab-pane fade in active" id="all">
                      <ul class="aa-product-catg">
                        <!---------------------------------------------------  start single product item--------------------------------------------->
                        <c:forEach var="bestList" items="${bestList}">
                        <input type="hidden" id="member_email" value="${sessionScope.member_email }">
                         <li>
                          <figure>
                            <a class="aa-product-img"  href="productDetail.sh?product_idx=${bestList.product_idx }" style="background-color: white;"><img src="<c:url value='/resources/upload/${bestList.product_main_image }' />" width="250" height="300" alt="polo shirt img"></a>
<!--                             <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> <!-- 장바구니 담기 버튼 활성화 -->
                              <figcaption>
                              <h4 class="aa-product-title" style="font-size:13px;"><a href="productDetail.sh?product_idx=${bestList.product_idx }">${bestList.product_name }</a></h4>
                              <span class="aa-product-price" style="font-size:13px;">￦
                              ${bestList.product_price }</span>
                         	  </figcaption>
                          </figure>                        
                         <div class="aa-product-hvr-content">
                          <!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq bestList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${bestList.product_idx }" name="best">
							<span id="best${bestList.product_idx }">
                      		좋아요♡ ${bestList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${bestList.product_idx }" name="best">
                         	<span id="best${bestList.product_idx }">
                          	좋아요♥ ${bestList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                          </div>
                          
<!--                       ---- product badge- -->
<!--                           <span class="aa-badge aa-sale" href="#">SALE!</span> 세일중 표시 -->
							<c:if test="${bestList.product_stock eq 0 }">
                    	 	<span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    		</c:if>
<!--                      <span class="aa-badge aa-hot" href="#">HOT!</span> 인기 표시 -->
                        </li>
						</c:forEach>
                      </ul>
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

  <!-- Login Modal -->  

  

  </body>
</html>