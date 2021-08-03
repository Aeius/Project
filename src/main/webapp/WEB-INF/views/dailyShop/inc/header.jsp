<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
 <!-- Start header section -->
  <header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-top-area">
              <!-- start header top left -->
              <div class="aa-header-top-left">
                <!-- start language -->
                <!--  삭제! -->
                <!-- / language -->

                <!-- start currency -->
                 <!--  삭제! -->
                <!-- / currency -->
                <!-- start cellphone -->
                <div class="cellphone hidden-xs">
                  <p><span class="fa fa-phone"></span>00-62-658-658</p>
                </div>
                <!-- / cellphone -->
              </div>
              <!-- / header top left -->
              <div class="aa-header-top-right">
                <ul class="aa-head-top-nav-right">
<!--                 <c:if test="${ sessionScope.id eq 'admin' }"> <li><a href="../../../AdminLTE-master/pages/chart.jsp">관리자 페이지</a></li></c:if> -->
                  <%-- 관리자 로그인 --%>
					<%-- admin 으로 로그인 시 admin page 보임 --%>
					
					 <c:choose>
					<c:when test="${sessionScope.member_email eq 'admin' }">
						<li><a href='<c:url value="/chart.ad" />'>Admin Page</a></li>
						 <li class="hidden-xs"><a href="<c:url value='/logout.sh'/>">Logout</a></li>
						 
						        <li class="hidden-xs"><a href="<c:url value='/basket.sh'/>">My Cart</a></li>
						       <li class="hidden-xs"><a href="<c:url value='/myWishList.sh'/>">Wish list</a></li>
				  <li><a href="<c:url value='/myPage.sh'/>">My page</a></li>
						 
					</c:when>
					
					<c:when test="${empty sessionScope.member_email  }">   
                   <li class="hidden-xs"><a href="<c:url value='/login.sh'/>">Login</a></li>
                   <li class="hidden-xs"><a href="<c:url value='/account.sh'/>">sign in</a></li>
                   </c:when> 
                   
                   
                  <c:when test="${!empty sessionScope.member_email }">
                  <li class="hidden-xs"><a href="<c:url value='/basket.sh'/>">My Cart</a></li>
<!--              <li class="hidden-xs"><a href="../member/checkout.jsp">Checkout</a></li> -->                  
                  <li class="hidden-xs"><a href="<c:url value='/myWishList.sh'/>">Wish list</a></li>
				  <li class="hidden-xs"><a href="<c:url value='/myPage.sh'/>">My page</a></li>
				  <li class="hidden-xs"><a href="<c:url value='/logout.sh'/>">Logout</a></li>
									 
				  </c:when>
                    </c:choose>
                   
             
                  
                   
                  
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header top  -->

    <!-- start header bottom  -->
    <div class="aa-header-bottom">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-bottom-area">
              <!-- logo  -->
              <div class="aa-logo">
               

   <!---------------------------------------------------------------- 로고 제목 수정 가능 ------------------------------------------------------------->
               <!--  Text based logo -->
<%--                 <a href="<c:url value='/main.sh'/>"> --%>
<!--                   <span class="fa fa-shopping-cart"></span> -->
<!--                    <p>daily<strong>Shop</strong> <span>Your Shopping Partner</span></p> -->
<!--                 </a> -->
<!--                 img based logo -->
                <a href="<c:url value='/main.sh'/>"> <img src="<c:url value='/resources/img/logo_proto_1.jpg'/>"  ></a>
              </div>
              <!-- / logo  -->
               <!-- ----------------------------------------------------------cart box ------------------------------------------------->
              <!-- / cart box -->
             
              <!-------------------------------------------------------- search box------------------------------------------------- -->
              <div class="aa-search-box">
                <form action="search.sh">
                  <input type="text" name="search" id="search" placeholder="검색기능 ">
                  <button type="submit"><span class="fa fa-search"></span></button>
                </form>
              </div>
              <!-- / search box -->             
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header bottom  -->
  </header>
  <!-- / header section -->
  <!-------------------------------------------------------------- menu ------------------------------------------>
  <section id="menu">
    <div class="container">
      <div class="menu-area">
        <!-- Navbar -->
        <div class="navbar navbar-default" role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>          
          </div>
          <div class="navbar-collapse collapse">
            <!-- Left nav -->
            <ul class="nav navbar-nav">
              <li><a href="main.sh">Home</a></li>
              <li><a href="productList.sh">Shop <span class="caret"></span></a>
                <ul class="dropdown-menu">                
                  <li><a href="productList.sh">30ml</a></li>
                  <li><a href="productList50.sh">50ml</a></li>
                </ul>
              </li>
              <li><a href="<c:url value='/recoTest.sh'/>">Test</a></li>
                    
              <!--  블로그 부분 삭제! -->
              <li><a href="notice.sh">Service</a></li>
              
<!--              <li><a href="#">Pages <span class="caret"></span></a> -->
<!--                <ul class="dropdown-menu">                 -->
<!--                  <li><a href="productList.sh">Shop Page</a></li> -->
<!--                  <li><a href="productDetail.sh">Shop Single</a></li>                 -->
<!--                  <li><a href="../404.jsp">404 Page</a></li>                 -->
<!--                </ul> -->
<!--              </li> -->
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>       
    </div>
  </section>
  <!-- / menu -->
  
  
</body>
</html>