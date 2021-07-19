<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Aesthetic by freehtml5.co
	Twitter: http://twitter.com/fh5co
	URL: http://freehtml5.co
-->
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Beryllium &mdash; Free Website Template, Free HTML5 Template by FreeHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Merriweather:300,400|Montserrat:400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

		<!-- 네비게이션 부분 -->
		<jsp:include page="./inc/nav.jsp"/>

		<div class="gtco-section">
			<div class="gtco-container">
				<div class="row gtco-heading">
					<div class="col-md-7 text-left">
						<h2>Contact</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p>
					</div>
					<div class="col-md-3 col-md-push-2 text-center">
						<p class="mt-md"><a href="#" class="btn btn-special btn-block">Contact us</a></p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<form action="#">
							<div class="form-group">
								<label for="name">Name</label>
								<input type="text" class="form-control" id="name">
							</div>
							<div class="form-group">
								<label for="name">Email</label>
								<input type="text" class="form-control" id="email">
							</div>
							<div class="form-group">
								<label for="message"></label>
								<textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<input type="submit" class="btn btn btn-special" value="Send Message">
							</div>
						</form>
					</div>
					<div class="col-md-5 col-md-push-1">
						<div class="gtco-contact-info">
							<h3>Our Address</h3>
							<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
							<ul >
								<li class="address">198 West 21th Street, Suite 721 New York NY 10016</li>
								<li class="phone"><a href="tel://1234567890">1235 2355 980</a></li>
								<li class="email"><a href="#">info@yoursite.com</a></li>
								<li class="url"><a href="#">www.yoursite.com</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END Contact -->

		<div id="map"></div>

		

		<div class="gtco-section gto-features">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-4">
						<div class="feature-left">
							<i class="ti-zip icon"></i>
							<div class="copy">
								<h3>Architect</h3>
								<p>Lorem ipsum dolor sit ameteista, consectetur adipiscing is not elitistaris.</p>
								<p><a href="#" class="gtco-more">Learn more</a></p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="feature-left">
							<i class="ti-hummer icon"></i>
							<div class="copy">
								<h3>Planning</h3>
								<p>Lorem ipsum dolor sit ameteista, consectetur adipiscing is not elitistaris.</p>
								<p><a href="#" class="gtco-more">Learn more</a></p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="feature-left">
							<i class="ti-plug icon"></i>
							<div class="copy">
								<h3>Parks &amp; Events</h3>
								<p>Lorem ipsum dolor sit ameteista, consectetur adipiscing is not elitistaris.</p>
								<p><a href="#" class="gtco-more">Learn more</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		

		<!-- Start footer -->
		<jsp:include page="./inc/footer.jsp"/>
		<!-- END footer -->

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>

	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>

	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>

