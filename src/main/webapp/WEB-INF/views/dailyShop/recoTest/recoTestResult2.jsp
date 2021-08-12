<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">

<head>
 <title>PerfumeShip</title>
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
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
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
		<img src="resources/img/recoTest/result2.JPG" style= "width:350px; height: 400px;" >
				  	
	 	<br>
	 	<br>
	  	<br>
	  	<p style="font-size: 1.7em; ">존바바토스아티산 퓨어 EDT</p>
 		<br>
 	 	<br>
 	 	
 	 	

	  	<p style="font-style: italic;"> "맑고 순수한 시트러스향의 매력,  <br>
	  	 내추럴함과 고급스러운 느낌을 더한 디자인"</p>
	  	<br>
	  	<br>
	  	
		<br>
		
		<br>
		멕시코 베라크루즈의 지상낙원이라 불리는 할라파(Xalapa)를 모티브로 했으며<br>
		따뜻한 햇살 아래 휴식을 취하는 모습을 담아냈습니다.<br>
		<br>
		퓨어는 맑고 순수한 시트러스한 향이 매력적입니다.<br>
		시트러스한 레몬과 오렌지 향에 흰 붓꽃의 풍성한 플로럴 향취가 조화되며<br>
		부드러운 우디 향으로 포근하게 마무리됩니다.	<br>
		<br>
		
	
		<br>
		<br>
		<br>
		
		<button onclick="location.href='<c:url value='recoTest.sh'/>'">다시하기</button>  	
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="location.href='<c:url value='/search.sh?search=아티산 퓨어'/>'">제품 보러가기</button>	 
			 
	
			   
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
