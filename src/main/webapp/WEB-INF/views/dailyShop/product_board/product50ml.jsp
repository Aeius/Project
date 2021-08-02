<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
									$('#all'+idx).html(heart); 
									$('#powdery'+idx).html(heart);
									$('#floral'+idx).html(heart);
									$('#woody'+idx).html(heart);
									$('#aqua'+idx).html(heart);
									$('#fruity'+idx).html(heart);
									$('#sitrus'+idx).html(heart);
									$('#spices'+idx).html(heart);
									$('#modern'+idx).html(heart);
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
 
  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
   <img src="<c:url value='/resources/img/banner_add/shopBanner.jpg'/>" alt="fashion img">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>50ml</h2>
<!--         <ol class="breadcrumb"> -->
<!--           <li><a href="index.html">Home</a></li>          -->
<!--           <li class="active">Women</li> -->
<!--         </ol> -->
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->
  <section id="aa-product">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="aa-product-area">
              <div class="aa-product-inner">
                <!-- start prduct navigation -->
                 <ul class="nav nav-tabs aa-products-tab">
                    <li class="active"><a href="#all" data-toggle="tab">전체</a></li>
                    <li><a href="#powdery" data-toggle="tab">파우더리</a></li>
                    <li><a href="#floral" data-toggle="tab">플로럴</a></li>
                    <li><a href="#woody" data-toggle="tab">우디</a></li>
                    <li><a href="#aqua" data-toggle="tab">아쿠아</a></li>
                    <li><a href="#fruity" data-toggle="tab">프루티</a></li>
                    <li><a href="#sitrus" data-toggle="tab">시트러스</a></li>
                    <li><a href="#spices" data-toggle="tab">스파이시</a></li>
                    <li><a href="#modern" data-toggle="tab">모던</a></li>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
<!-- all product category --------------------------------------------------------------------------------------------------------------------------->
                    <div class="tab-pane fade in active" id="all">
                      <ul class="aa-product-catg">
<!-- all product item-------------------------------------------------------------------------------------------------------------------------------->
                        <c:forEach var="allList" items="${allList }">
						<input type="hidden" id="member_email" value="${sessionScope.member_email }">
                         <script src="<c:url value='/resources/script/jquery-3.6.0.js'/>"></script> 
						  <script type="text/javascript">
						  </script>
                        <li>
                          <figure>
                            <a class="aa-product-img"  href="productDetail.sh?product_idx=${allList.product_idx }"><img src="<c:url value='/resources/upload/${allList.product_main_image }' />" width="250" height="300" alt="polo shirt img"></a>
<!--                             <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a> <!-- 장바구니 담기 버튼 활성화 -->
                              <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${allList.product_idx }">${allList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${allList.product_price }</span>
                            </figcaption>
                          </figure>                        
                          <div class="aa-product-hvr-content">
                          <!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq allList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${allList.product_idx }" name="all">
							<span id="all${allList.product_idx }">
                      		좋아요♡ ${allList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${allList.product_idx }" name="all">
                         	<span id="all${allList.product_idx }">
                          	좋아요♥ ${allList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
<%--                        	 <a class="aa-add-to-cart-btn" id="${allList.product_idx }" > <span class="${allList.product_idx }">좋아요♡ ${allList.product_likecount }</span></a> --%>
<%--                        <a href="pushWishList.sh?product_idx=${allList.product_idx }" data-toggle="tooltip" data-placement="top" title="좋아요 ${allList.product_likecount }"><span class="fa fa-heart-o"></span></a>  <!-- 찜하기 버튼 --> --%>
<!--                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>   비교하기 버튼
<!--                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>  <!--퀵뷰                      -->
                          </div>
						<c:if test="${allList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
<!--                      <span class="aa-badge aa-hot" href="#">HOT!</span> 인기 표시 -->
                        </li>
						</c:forEach>
                      </ul>
                    </div>
<!-- powdery product category----------------------------------------------------------------------------------------------------------->
                    <div class="tab-pane fade" id="powdery">
                      <ul class="aa-product-catg">
<!-- powdery product item ---------------------------------------------------------------------------------------------------------------->
						<c:forEach var="powderyList" items="${powderyList }">
						<input type="hidden" id="member_email" value="${sessionScope.member_email }">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="productDetail.sh?product_idx=${powderyList.product_idx }"><img src="<c:url value='/resources/upload/${powderyList.product_main_image }'/>" width="250" height="300" alt="polo shirt img"></a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${powderyList.product_idx }">${powderyList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${powderyList.product_price }</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content">
                      			<!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq powderyList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${powderyList.product_idx }" name="all">
							<span id="all${powderyList.product_idx }">
                      		좋아요♡ ${powderyList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${powderyList.product_idx }" name="all">
                         	<span id="all${powderyList.product_idx }">
                          	좋아요♥ ${powderyList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                    	  
                          </div>
                          <!-- product badge -->
                          <c:if test="${powderyList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
                        </li>
                        </c:forEach>
                        <!------------------------------------  사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption> 
                          </figure>                        
                        </li>
                        <!------------------------------------ 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                     </div>   
<!-- floral product category------------------------------------------------------------------------------------------------------------------>
                    <div class="tab-pane fade" id="floral">
                      <ul class="aa-product-catg">
<!-- floral product item ---------------------------------------------------------------------------------------------------------------------->
						<c:forEach var="floralList" items="${floralList }">
						<input type="hidden" id="member_email" value="${sessionScope.member_email }">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="productDetail.sh?product_idx=${floralList.product_idx }"><img src="<c:url value='/resources/upload/${floralList.product_main_image }'/>" width="250" height="300" alt="polo shirt img"></a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${floralList.product_idx }">${floralList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${floralList.product_price }</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content">
                      			<!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq floralList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${floralList.product_idx }" name="all">
							<span id="all${floralList.product_idx }">
                      		좋아요♡ ${floralList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${floralList.product_idx }" name="all">
                         	<span id="all${floralList.product_idx }">
                          	좋아요♥ ${floralList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                    	  
                          </div>
                          <!-- product badge -->
                          <c:if test="${floralList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
                        </li>
                        </c:forEach>
                        <!------------------------------------  사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <!------------------------------------ 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                     </div>   
<!-- woody product category-------------------------------------------------------------------------------------------------------------------->
                    <div class="tab-pane fade" id="woody">
                      <ul class="aa-product-catg">
<!-- woody product item ------------------------------------------------------------------------------------------------------------------------->
						<c:forEach var="woodyList" items="${woodyList }">
						<input type="hidden" id="member_email" value="${sessionScope.member_email }">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="productDetail.sh?product_idx=${woodyList.product_idx }"><img src="<c:url value='/resources/upload/${woodyList.product_main_image }'/>" width="250" height="300" alt="polo shirt img"></a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${woodyList.product_idx }">${woodyList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${woodyList.product_price }</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content">
                      			<!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq woodyList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${woodyList.product_idx }" name="all">
							<span id="all${woodyList.product_idx }">
                      		좋아요♡ ${woodyList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${woodyList.product_idx }" name="all">
                         	<span id="all${woodyList.product_idx }">
                          	좋아요♥ ${woodyList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                          </div>
                          <!-- product badge -->
                          <c:if test="${woodyList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
                        </li>
                        </c:forEach>
                        <!------------------------------------  사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <!------------------------------------ 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                     </div>   
<!-- aqua product category-------------------------------------------------------------------------------------------------------------------- -->
                    <div class="tab-pane fade" id="aqua">
                      <ul class="aa-product-catg">
<!--  aqua product item ------------------------------------------------------------------------------------------------------------------------->
                       <c:forEach var="aquaList" items="${aquaList }">
                       <input type="hidden" id="member_email" value="${sessionScope.member_email }">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="productDetail.sh?product_idx=${aquaList.product_idx }"><img src="<c:url value='/resources/upload/${aquaList.product_main_image }'/>" width="250" height="300" alt="polo shirt img"></a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${aquaList.product_idx }">${aquaList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${aquaList.product_price }</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content">
                      			<!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq aquaList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${aquaList.product_idx }" name="all">
							<span id="all${aquaList.product_idx }">
                      		좋아요♡ ${aquaList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${aquaList.product_idx }" name="all">
                         	<span id="all${aquaList.product_idx }">
                          	좋아요♥ ${aquaList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                          </div>
                          <!-- product badge -->
                          <c:if test="${aquaList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
                        </li>
                        </c:forEach>
                        <!------------------------------------  사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <!------------------------------------ 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                    </div>
<!--fruity product category------------------------------------------------------------------------------------------------------------ -->
                    <div class="tab-pane fade" id="fruity">
                      <ul class="aa-product-catg">
<!-- fruity product item ------------------------------------------------------------------------------------------------------------------>
                       <c:forEach var="fruityList" items="${fruityList }">
                       <input type="hidden" id="member_email" value="${sessionScope.member_email }">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="productDetail.sh?product_idx=${fruityList.product_idx }"><img src="<c:url value='/resources/upload/${fruityList.product_main_image }'/>" width="250" height="300" alt="polo shirt img"></a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${fruityList.product_idx }">${fruityList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${fruityList.product_price }</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content">
                      			<!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq fruityList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${fruityList.product_idx }" name="all">
							<span id="all${fruityList.product_idx }">
                      		좋아요♡ ${fruityList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${fruityList.product_idx }" name="all">
                         	<span id="all${fruityList.product_idx }">
                          	좋아요♥ ${fruityList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                          </div>
                          <!-- product badge -->
                          <c:if test="${fruityList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
                        </li>
                        </c:forEach>
                        <!------------------------------------  사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <!------------------------------------ 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                    </div>
<!--- sitrus product category----------------------------------------------------------------------------------------------------->
                    <div class="tab-pane fade" id="sitrus">
                      <ul class="aa-product-catg">
<!--  sitrus product item ------------------------------------------------------------------------------------------------------>
						<c:forEach var="sitrusList" items="${sitrusList }">
						<input type="hidden" id="member_email" value="${sessionScope.member_email }">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="productDetail.sh?product_idx=${sitrusList.product_idx }"><img src="<c:url value='/resources/upload/${sitrusList.product_main_image }'/>" width="250" height="300" alt="polo shirt img"></a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${sitrusList.product_idx }">${sitrusList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${sitrusList.product_price }</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content">
                      			<!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq sitrusList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${sitrusList.product_idx }" name="all">
							<span id="all${sitrusList.product_idx }">
                      		좋아요♡ ${sitrusList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${sitrusList.product_idx }" name="all">
                         	<span id="all${sitrusList.product_idx }">
                          	좋아요♥ ${sitrusList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                          </div>
                          <!-- product badge -->
                          <c:if test="${sitrusList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
                        </li>
                        </c:forEach>
                        <!------------------------------------  사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <!------------------------------------ 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                     </div>   
                        
<!-- spices product category------------------------------------------------------------------------------------------------->
                    <div class="tab-pane fade" id="spices">
                      <ul class="aa-product-catg">
<!-- spices product item ---------------------------------------------------------------------------------------------------->
						<c:forEach var="spicesList" items="${spicesList }">
						<input type="hidden" id="member_email" value="${sessionScope.member_email }">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="productDetail.sh?product_idx=${spicesList.product_idx }"><img src="<c:url value='/resources/upload/${spicesList.product_main_image }'/>" width="250" height="300" alt="polo shirt img"></a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${spicesList.product_idx }">${spicesList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${spicesList.product_price }</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content">
                      			<!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq spicesList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${spicesList.product_idx }" name="all">
							<span id="all${spicesList.product_idx }">
                      		좋아요♡ ${spicesList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${spicesList.product_idx }" name="all">
                         	<span id="all${spicesList.product_idx }">
                          	좋아요♥ ${spicesList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                          </div>
                          <!-- product badge -->
                          <c:if test="${spicesList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
                        </li>
                        </c:forEach>
                        <!------------------------------------  사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <!------------------------------------ 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                     </div>   
<!-- modern product category--=---------------------------------------------------------------------------------------------->
                    <div class="tab-pane fade" id="modern">
                      <ul class="aa-product-catg">
<!-- modern product item ----------------------------------------------------------------------------------------------------->
						<c:forEach var="modernList" items="${modernList }">
						<input type="hidden" id="member_email" value="${sessionScope.member_email }">
                        <li>
                          <figure>
                            <a class="aa-product-img" href="productDetail.sh?product_idx=${modernList.product_idx }"><img src="<c:url value='/resources/upload/${modernList.product_main_image }'/>" width="250" height="300" alt="polo shirt img"></a>
                            <figcaption>
                              <h4 class="aa-product-title"><a href="productDetail.sh?product_idx=${modernList.product_idx }">${modernList.product_name }</a></h4>
                              <span class="aa-product-price">$ ${modernList.product_price }</span>
                            </figcaption>
                          </figure>                         
                          <div class="aa-product-hvr-content">
                      			<!-- 각 상품들에 대한 좋아요 체크 여부 확인 -->
                          <c:set var="heart" scope="session" value="0" /> <!-- 체크전 0으로 설정(초기화) -->
                          <c:forEach var="checkHeart"  items="${checkHeart}">
                          <c:if test="${checkHeart.wishList_product_idx eq modernList.product_idx}" > <!-- 내 찜목록 중 해당 상품이 있으면 heart 1로 설정 -->
							<c:set var="heart" scope="session" value="1" />
							</c:if>
                    	  </c:forEach>
                    	  
                    	  <c:choose>
                    	  <c:when test="${heart eq '0' }" > <!-- heart 값이 0 이면 (좋아요 안눌린 상태) -->
							<a class="aa-add-to-cart-btn" id="${modernList.product_idx }" name="all">
							<span id="all${modernList.product_idx }">
                      		좋아요♡ ${modernList.product_likecount }
                      		</span></a>
                          </c:when>
                          <c:otherwise> <!-- heart 값이 0 이 아니면 (좋아요 눌린 상태) -->
						   	<a class="aa-add-to-cart-btn" id="${modernList.product_idx }" name="all">
                         	<span id="all${modernList.product_idx }">
                          	좋아요♥ ${modernList.product_likecount }
                          	</span></a>
                          </c:otherwise>
                    	  </c:choose>
                          </div>
                          <!-- product badge -->
                          <c:if test="${modernList.product_stock eq 0 }">
                    	 <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>  <!--재고없음 표시  -->
                    	 </c:if>
                        </li>
                        </c:forEach>
                        <!------------------------------------  사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
						<li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                       <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                         <li>
                          <figure>
	                          <a class="aa-product-img" ><img src="<c:url value='/resources/img/공백.bmp' />" width="250" height="300" alt="polo shirt img"></a>
                              <figcaption>
                               <h4 class="aa-product-title"><a></a></h4>
                              <span class="aa-product-price"></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                        </li>
                        <!------------------------------------ 사진이 짤리는 현상 막기 위한 공백 ---------------------------------- -->
                      </ul>
                     </div>                  
<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
                    
                	</div>
				  </div>
			   </div>
			</div>
		</div>
	</div>
 </div>
</section>
  <!-- / product category -->

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

    

  </body>
</html>