<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


	<!-- 별점 css -->
	<link href='<c:url value="/resources/css/star-rating.css" />' rel="stylesheet" type="text/css">
	
<%-- <script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script> --%>
<!-- <script type="text/javascript"> -->
<!-- // $(document).ready(function() { -->
<!-- // 	$('.star-rating label').click(function(){ -->
<!-- // 		  $(this).parent().children('label').removeClass('on'); -->
<!-- // 		  $(this).addClass('on').prevAll('label').addClass('on'); -->
<!-- // 		  var reveiw_star = $(this).attr("value"); -->
<!-- // 		  alert(review_star); -->
<!-- // 		  return false; -->
<!-- // 		}); -->
<!-- // }); -->
<!-- </script> -->

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


 <!-- Font awesome -->
    <link href="<c:url value='/resources/member/css/font-awesome.css'/>" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<c:url value='/resources/member/css/bootstrap.css'/>" rel="stylesheet">   
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="<c:url value='/resources/member/css/jquery.smartmenus.bootstrap.css'/>" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/member/css/jquery.simpleLens.css'/>">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/member/css/slick.css'/>">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/member/css/nouislider.css'/>">
    <!-- Theme color -->
    <link id="switcher" href="<c:url value='/resources/member/css/theme-color/default-theme.css'/>" rel="stylesheet">
    <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
    <!-- Top Slider CSS -->
    <link href="<c:url value='/resources/member/css/sequence-theme.modern-slide-in.css'/>" rel="stylesheet" media="all">
 
    <!-- Main style sheet -->
    <link href="<c:url value='/resources/member/css/style.css'/>" rel="stylesheet">    

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
  
  

 <!-- Cart view section -->
 <section id="aa-myaccount">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="aa-myaccount-area">         
            <div class="row">
              <div class="col-md-6">
                <div class="aa-myaccount-register">                 
                 <h4>리뷰수정</h4>
                 
                 <form action='<c:url value="reviewUpdatePro.sh" />' id="fr" class="aa-login-form" method="post" enctype="multipart/form-data">
                 	<input type="hidden" name="review_idx" value="${reviewBean.review_idx}">
<%-- 	  				<input type="text" name="review_start" value="${reviewBean.review_star}"> --%>
                   <label for="name">기존 평점</label>
                   
                   <div class="star-rating">
 
                   <c:set var ="review_star" value="${ reviewBean.review_star }"></c:set>
                              <c:if test="${review_star eq 5}"> 
							  <input type="radio" id="stars" name="5-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="5-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="4-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="4-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="3-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="3-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="2-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="2-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="1-star" value="" checked="checked" disabled="disabled"/>
							  <label for="1-star" class="star">&#9733;</label>
							  </c:if>
							  
							  <c:if test="${review_star eq 4}"> 
							  <input type="radio" id="stars" name="5-stars" value="" disabled="disabled"/>
							  <label for="5-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="4-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="4-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="3-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="3-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="2-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="2-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="1-star" value="" checked="checked" disabled="disabled"/>
							  <label for="1-star" class="star">&#9733;</label>
							  </c:if>
							 
							   <c:if test="${review_star eq 3}"> 
							  <input type="radio" id="stars" name="5-stars" value="" disabled="disabled" disabled="disabled"/>
							  <label for="5-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="4-stars" value="" disabled="disabled" disabled="disabled"/>
							  <label for="4-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="3-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="3-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="2-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="2-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="1-star" value="" checked="checked" disabled="disabled"/>
							  <label for="1-star" class="star">&#9733;</label>
							   </c:if>
							   
							  <c:if test="${review_star eq 2}"> 
							  <input type="radio" id="stars" name="5-stars" value="" disabled="disabled"/>
							  <label for="5-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="4-stars" value="" disabled="disabled"/>
							  <label for="4-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="3-stars" value="" disabled="disabled"/>
							  <label for="3-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="2-stars" value="" checked="checked" disabled="disabled"/>
							  <label for="2-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="1-star" value="" checked="checked" disabled="disabled"/>
							  <label for="1-star" class="star">&#9733;</label>
							   </c:if>
							   
							  <c:if test="${review_star eq 1}"> 
							  <input type="radio" id="stars" name="5-stars" value="5" disabled="disabled"/>
							  <label for="5-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="4-stars" value="4" disabled="disabled"/>
							  <label for="4-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="3-stars" value="3" disabled="disabled"/>
							  <label for="3-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="2-stars" value="2" disabled="disabled"/>
							  <label for="2-stars" class="star">&#9733;</label>
							  <input type="radio" id="stars" name="1-star" value="1" checked="checked" disabled="disabled"/>
							  <label for="1-star" class="star">&#9733;</label>
							   </c:if>

                   </div>
                   
                   <label for="name">평점 수정</label>
                   
                   <div class="star-rating"> 
							
							  <input type="radio" id="5-stars" name="review_star" value="5"  />
							  <label for="5-stars" class="star">&#9733;</label>
							  <input type="radio" id="4-stars" name="review_star" value="4" />
							  <label for="4-stars" class="star">&#9733;</label>
							  <input type="radio" id="3-stars" name="review_star" value="3" />
							  <label for="3-stars" class="star">&#9733;</label>
							  <input type="radio" id="2-stars" name="review_star" value="2" />
							  <label for="2-stars" class="star">&#9733;</label>
							  <input type="radio" id="1-star" name="review_star" value="1" checked="checked"/>
							  <label for="1-star" class="star">&#9733;</label>

                   </div>
         
                    <label for="name">작성자</label>
                    <input type="text" class="form-control" id="review_email" name="review_email" value="${reviewBean.review_email }" readonly="readonly">
					
					<label for="name">제목</label>
                    <input type="text" class="form-control" id="review_subject" name="review_subject" value="${reviewBean.review_subject }">
                    
                	<textarea rows="10px" cols="90" name="review_content" >${reviewBean.review_content }</textarea>
                	
                	
                     <!-- 다중 파일 업로드시 multiple="multiple" 추가 / name="file" 이어야함 accept : 확장자명 지정 -->
                     <input multiple="multiple" type="file" class="form-control" id="review_image" name="file" value="${reviewBean.review_image }" accept=".jpg,.jpeg,.png,.gif"> ${reviewBean.review_image }
                	 <input multiple="multiple" type="file" class="form-control" id="review_image2" name="file" value="${reviewBean.review_image2 }" accept=".jpg,.jpeg,.png,.gif">${reviewBean.review_image2 }

                    <button type="submit" id="review_insertBtn" class="aa-browse-btn">리뷰수정</button>
                            
                  </form>
                </div>
              </div>
            </div>          
         </div>
       </div>
     </div>
   </div>
 </section>
 <!-- / Cart view section -->

 <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<c:url value='/resources/member/js/bootstrap.js'/>"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="<c:url value='/resources/member/js/jquery.smartmenus.js'/>"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="<c:url value='/resources/member/js/jquery.smartmenus.bootstrap.js'/>"></script>  
  <!-- To Slider JS -->
  <script src="<c:url value='/resources/member/js/sequence.js'/>"></script>
  <script src="<c:url value='/resources/member/js/sequence-theme.modern-slide-in.js'/>"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="<c:url value='/resources/member/js/jquery.simpleGallery.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/member/js/jquery.simpleLens.js'/>"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="<c:url value='/resources/member/js/slick.js'/>"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="<c:url value='/resources/member/js/nouislider.js'/>"></script>
  <!-- Custom js -->
  <script src="<c:url value='/resources/member/js/custom.js'/>"></script> 

    
  

  </body>
</html>






