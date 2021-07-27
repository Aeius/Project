<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <footer id="aa-footer">
    <!-- footer bottom -->
    <div class="aa-footer-top">
     <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-top-area">
            <div class="row">
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <h3>Main Menu</h3>
                  <ul class="aa-footer-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="notice.sh">Our Services</a></li>
                    <li><a href="productList.sh">Our Products</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Contents</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="#">Perfume MBTI</a></li>
                      <li><a href="#">About Us</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Service</h3>
                    <ul class="aa-footer-nav">
                      <li><a href="notice.sh">QnA</a></li>
                      <li><a href="notice.sh">FAQ</a></li>
                      <li><a href="notice.sh">Notice</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3>Contact Us</h3>
                    <address>
                      <p> 25 Astor Pl, NY 10003, USA</p>
                      <p><span class="fa fa-phone"></span>+1 212-982-4589</p>
                      <p><span class="fa fa-envelope"></span>dailyshop@gmail.com</p>
                    </address>
                    <div class="aa-footer-social">
                      <a href="#"><span class="fa fa-facebook"></span></a>
                      <a href="#"><span class="fa fa-twitter"></span></a>
                      <a href="#"><span class="fa fa-google-plus"></span></a>
                      <a href="#"><span class="fa fa-youtube"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     </div>
    </div>
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
      <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-bottom-area">
            <p>Designed by <a href="http://www.markups.io/">MarkUps.io</a></p>
          </div>
        </div>
      </div>
      </div>
    </div>
  </footer>
  
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