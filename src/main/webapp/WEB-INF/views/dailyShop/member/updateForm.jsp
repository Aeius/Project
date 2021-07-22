<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
          <div class="aa-myaccount-register">       
                    <br>
                 <h2>내 정보</h2>
                 <form action="<c:url value='/member/updatePro'/>" class="aa-login-form" method="post">
                    <label for="">Email<span>*</span></label>
                    <input type="text" placeholder="이메일을 입력해주세요" value="${member.member_email}" name="member_email">
                    <label for="">비밀번호<span>*</span></label>
                    <input type="password" placeholder="비밀번호를 입력해주세요" name="member_password">
                    <label for="">이름<span>*</span></label>
                    <input type="text" placeholder="이름" value="${member.member_name}" name="member_name">
                    <label for="">전화번호<span>*</span></label>
                    <input type="text" placeholder="000-0000-0000" value="${member.member_phone}" name="member_phone">
                    <label for="">주소<span>*</span></label>
                    <input type="text" placeholder="주소" value="${member.member_address} ${member.member_extraAddress} ${member.member_extraAddress2}" name="member_address">
                    <button type="submit" class="aa-browse-btn">수정!</button>                    
                  </form>
                </div>
       		 </div>
       		</div>
        </div>
        <!-------------------------------------------- -사이드바 영역 --------------------------------------------------------------------- -->
  </section>
  <!-- / product category -->

 <!-- / Cart view section -->

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

    

  </body>
</html>