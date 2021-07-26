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
  
  <script type="text/javascript">
						
	function updateReview(product_idx){
		
		// 댓글 번호를 새로운 윈도우 창으로 가져가 댓글 번호 정보 비교
			window.name="parentForm"
			document.open("<c:url value='/reviewUpdateForm.sh?product_idx="+product_idx+"'/>","replyForm","width=720, height=800");
			}
	</script>
						
  <script type="text/javascript">
						
 	function deleteReview(product_idx){
		// 댓글 번호를 새로운 윈도우 창으로 가져가 댓글 번호 정보 비교
			location.href="<c:url value='/reviewDeletePro.sh?product_idx="+product_idx+"'/>"
			}
	</script>				
<style type="text/css">

	.star-rating {
/*   border:solid 1px #ccc; */
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}
	</style>

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
                   
                    <c:forEach var="reviewList" items="${reviewList}"> 
                     <li>
                        <div class="media">
                          <div class="media-body">
                          <div class="media-lef=">
                            <a href="#">
                            <!-- 상품 이미지 300px, 300px -->
                                <img class="media-object" src="<c:url value='/resources/img/testimonial-img-3.jpg'/>" alt="girl image">
                              <img class="media-object" src="<c:url value='/resources/img/testimonial-img-3.jpg'/>" alt="girl image">
                            </a>
                          </div>
                         
                         <!-------------------------------  리뷰 작성자, 작성일  --------------------------------------->
                         
                         	<h4 class="media-heading"><strong>제목 : ${reviewList.review_subject}</strong></h4>
                            <h4 class="media-heading"><strong>작성자 : ${reviewList.review_email}</strong> - <span>작성일 : ${reviewList.review_date}</span></h4>
                           <div class="star-rating">

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

<!-- 							  <input type="radio" id="5-stars" name="review_star" value="5" /> -->
<!-- 							  <label for="5-stars" class="star">&#9733;</label> -->
<!-- 							  <input type="radio" id="4-stars" name="review_star" value="4" /> -->
<!-- 							  <label for="4-stars" class="star">&#9733;</label> -->
<!-- 							  <input type="radio" id="3-stars" name="review_star" value="3" /> -->
<!-- 							  <label for="3-stars" class="star">&#9733;</label> -->
<!-- 							  <input type="radio" id="2-stars" name="review_star" value="2" /> -->
<!-- 							  <label for="2-stars" class="star">&#9733;</label> -->
							
							  <input type="checkbox" id="1-star" name="review_star" checked="checked" />
							  <label for="1-star" class="star">&#9733;</label>
							
							
						</c:forEach>
<%-- 		                     <input type="text" name="review_star" value=${ reviewList.review_star }> --%>
		                   </div>
		                   
                          <!-------------------------------  리뷰내용  --------------------------------------->
<%--                             <p>${reviewList.review_content}</p> --%>
							
                            <p><textarea rows="10px" cols="55px" name="review_content" readonly="readonly">${reviewList.review_content}</textarea></p>
                        	
                            <input type="button" class="aa-browse-btn" value="수정" onclick="updateReview (${reviewList.review_product_idx} )">
                            <input type="button" class="aa-browse-btn" value="삭제" onclick="deleteReview(${reviewList.review_product_idx} )">
                           
                        
                          </div>
                          
                        </div>
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
      </section>
  <!-- / product category -->

 <!-- / Cart view section -->

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

    

  </body>
</html>