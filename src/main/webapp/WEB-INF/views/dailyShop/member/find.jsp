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
  <section id="aa-catg-head-banner">
    <img src="../img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Login Page</h2>
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
                <h4>아이디 찾기</h4>
                 <form action="" class="aa-login-form">
                  <label for="name">이름<span>*</span></label>
                   <input type="text" placeholder="Username" name="board_email">
                   <label for="phone">연락처<span>*</span></label>
                    <input type="text" placeholder="01012345678">
                    <button type="submit" class="aa-browse-btn">아이디 찾기</button>
                  </form>
                </div>
              </div>
              <div class="col-md-6">
                <div class="aa-myaccount-login">
                <h4>비밀번호 찾기</h4>
                 <form action="" class="aa-login-form">
                  <label for="board_email">아이디<span>*</span></label>
                   <input type="text" placeholder="UserID" name="board_email">
                   <label for="name">이름<span>*</span></label>
                   <input type="text" placeholder="Username" name="board_email">
                   <label for="phone">연락처<span>*</span></label>
                    <input type="text" placeholder="01012345678">
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
</html>