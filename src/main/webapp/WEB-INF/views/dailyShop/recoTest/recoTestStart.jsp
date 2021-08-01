<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">

<head>
<style type="text/css">




/* 	position: fixed; */


/* .about-page .container .row .col-md-team2 #container_team2 section p{ */
/* margin: 0 auto !important; */
/* } */




.about-page .container .col-md-team2 #container_team2{
  background-image: url("resources/img/logo2.jpg");
  display: inline;
  float: left;
  width: 100%;
  height:80%;
  background-repeat:no-repeat;
  background-position:top right;
	background-size: cover;
	 background-attachment: fixed;
}



p {
	line-height: 30px; 
	font-size: 1.2em;
}


button{margin-top:100px;
		border-radius: 5px;
		width:330px;
		height:80px;
		outline:none;
		cursor:pointer;
		font-size:25px !important;
		font-weight:bold;
		background-color:#fff;
		background-color: rgba( 255, 255, 255, 0.2 );
		color:#000;
		border:1px solid #000;
		transition:0.5s;}
		
button:hover{background-color:#000;
			color:#fff;
			background-color: rgba( 25, 25, 25, 0.6);}


article{
	width: 150px; 
	height: 100px;
	margin: 0 auto; 
	padding: 10px;
	border: none;
}   

</style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">

<!--     <title>Pixie Template - About Page</title> -->


    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../css/fontawesome.css">
    <link rel="stylesheet" href="../css/tooplate-main.css">
    <link rel="stylesheet" href="../css/owl.css">
    <link rel="stylesheet" href="../css/flex-slider.css">
<!--
Tooplate 2114 Pixie
https://www.tooplate.com/view/2114-pixie
-->

  </head>

  <body>
      <!-- header -->
<jsp:include page="../inc/header.jsp"></jsp:include>
  <!-- / menu -->
  
    <!-- Page Content -->
    <!-- About Page Starts Here -->
     <div class="about-page">
<!--      col-md-6 -->

      <div class="container">
        <div class="row">
   
<!--           <div class="col-md-6"> -->
<!--             <div class="left-image"> -->
<!--             이미지 추가 부분 -->
<!--               <img src="mong.jpg" alt=""> -->
<!--             </div> -->
<!--           </div> -->
   
          <div class="col-md-team2">
            <div id="container_team2" style="text-align: center;" >
            <h4 style=" font-size: 3.2em; font-family: 궁서체 !important; text-align: left; font-color: #300026; margin-top:100px; 
			float: left;padding-left: 200px; padding-bottom:100px; ">What's your Pick</h4>
			
			
			<section style="float: left; padding-left: 200px; margin-bottom: 300px; ">

			   <br>
				<form action="<c:url value='recoTestQ1.sh'/>" method="get">
			  	<p style="text-align: left;">000의 프리미엄 퍼퓸 테일러가<br>
			  	당신에게 맞는 향수를 제안합니다.<br>
			  	후회 없는 선택을 함께해 보세요 </p>
			  	<br>
			  	<br>
			  	<br>
			  	<br>
			  	<button onclick="location.href='<c:url value='recoTestQ1.sh'/>'">Test Start</button>
				</form>	


			
			   
<!-- 			<article> -->
<!-- 				</article> -->


			<!-- 컨텐츠 -->


              </section>
             </div>
            </div>
          </div>
        </div>
      </div>
  
    <!-- About Page Ends Here -->


    <!-- Sub Footer Starts Here -->
     <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->
    <!-- Sub Footer Ends Here -->


  </body>

</html>
