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
		<img src="resources/img/recoTest/result11.jpg" style= "width:300px; height: 400px;" >
				  	
	 	<br>
	 	<br>
	  	<br>
	  	<p style="font-size: 1.7em; ">클린 클래식 쿨코튼EDP</p>
 		<br>
 	 	<br>

	  	<p style="font-style: italic;"> 
	  	“파란 하늘과 바닷가의 산들바람을 닮은 깨끗하고 청량한 향!“ </p> 
	  	<br>
	  	<br>
	  	<br>
	  	상큼한 그린애플과 베르가못이 포근한 코튼 플라워와 만나 
	  	<br>상쾌하면서 편안한 느낌을 전합니다.<br> 
	  	
		갓 세탁한 면섬유에서 나는 부드럽고 깨끗한 느낌을 시원한 느낌으로 재해석한 <br>
		클린 클래식 쿨 코튼 오데퍼퓸을 만나보세요.<br>
		<br>
		<br>
		<br>
		
		<button onclick="location.href='<c:url value='recoTest.sh'/>'">다시하기</button>  	
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="location.href='<c:url value='/search.sh?search=쿨코튼'/>'">제품 보러가기</button>	 
			 
	
			   
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
