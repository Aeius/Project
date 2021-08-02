<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">

<head>
<style type="text/css">


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
     <!-- wpf loader Two -->
    <div id="wpf-loader-two">          
      <div class="wpf-loader-two-inner">
        <span>Loading</span>
      </div>
    </div> 
    <!-- / wpf loader Two -->       
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
            <div id="container_team2_1" style="text-align: center; " >
<!--             <h4 style=" font-size: 3.2em; font-family: 궁서체 !important; text-align: left; font-color: #300026; margin-top:100px;  -->
<!-- 			float: left;padding-left: 200px; padding-bottom:100px; ">What's your Pick</h4> -->
			
			
			  <h3 style="font-size: 2.7em !important; font-family:궁서체 !important; 
			 text-align: center; font-color: #300026; margin-top:100px;  -->
			 padding-bottom:100px;"> We Recommend this;</h3>

			<section style="text-align: center; font-color: #300026; margin-top:100px;  
			 padding-bottom:100px; margin-bottom:100px;">
			
		 <p style="text-align: center;">
		</p>
	  	<!-- 상품 상세 이미지는 여기에 -->		  	
		<img src="resources/img/recoTest/result4.jpg" style= "width:300px; height: 400px;" >
				  	
	 	<br>
	 	<br>
	  	<br>
	  	<p style="font-size: 1.7em; ">펜할리곤스 윌리엄펜할리곤 EDP</p>
 		<br>
 	 	<br>

	  	<p style="font-style: italic;"> "타의 추종을 불허하는 향기, <br>
	  	펜할리곤스만의 특별함을 재확인할 수 있는 독특한 향기"</p>
	  	<br>
	  	<br>

		펜할리곤스만의 특별함을 재확인할 수 있는 독특한 향기로 가득한  <br>
		특별한 컬렉션에서 영국 귀족의 비밀을 찾아보세요.<br>
		<br>
		향조계의 전설이라고하는 베티버를 중심으로 하는 향기입니다.<br>
		베티버를 중심으로 공기중에 흩어지는 흙의 향기가 따듯하면서도 프레쉬한 느낌을 자아냅니다.<br>
		오리엔탈 느낌의 향기로 짜여져 있으면서도 아주 섬세하고 정교하게 조합된 향조입니다.<br>

		<br>
		<br>
		<br>
		
		<button onclick="location.href='<c:url value='recoTest.sh'/>'">다시하기</button>  	
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="location.href='<c:url value=''/>'">제품 보러가기</button>	 
			 
	
			   
<!-- 			<article> -->
<!-- 		     </article> -->


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
