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
<script src="../script/jquery-3.6.0.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]  -->

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
    <img src="<c:url value='/resources/img/banner_add/login3.gif"/'/>" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>아이디 / 비밀번호 찾기</h2>
      </div>
     </div>
   </div>
  </section>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
 <section id="aa-myaccount">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="aa-myaccount-area">         
            <div class="row">
              <div class="col-md-6">
                <div class="aa-myaccount-login">
                
                
                <h4>아이디(Email) 찾기</h4>
                
                 <form action="<c:url value='findEmail.sh' />" class="aa-login-form" method="post">
                  <label for="name">이름<span>*</span></label>
                   <input type="text" placeholder="Username" name="member_name">
                   <label for="phone">연락처<span>*</span></label>
                    <input type="text" placeholder="ex)01012345678" name="member_phone">
                    <button type="submit" class="aa-browse-btn">아이디(Email)찾기</button>
                  </form>
                  
                   
                </div>
              </div>
              <div class="col-md-6">
                <div class="aa-myaccount-login">
                <h4>비밀번호 찾기</h4>
                 <form action="<c:url value='findPassword.sh' />" class="aa-login-form" method="post">
                  <label for="board_email">아이디<span>*</span></label>
                   <input type="text" placeholder="UserID(email)" name="member_email">
                   <label for="name">이름<span>*</span></label>
                   <input type="text" placeholder="Username" name="member_name">
                   <label for="phone">연락처<span>*</span></label>
                    <input type="text" placeholder="ex) 01012345678" name="member_phone">
                    <button type="submit" class="aa-browse-btn">비밀번호 찾기</button>
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

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->


  </body>