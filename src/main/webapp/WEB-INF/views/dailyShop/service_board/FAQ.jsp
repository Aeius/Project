<%@page import="com.itwillbs.dao.FaqBoardDAOImpl"%>
<%@page import="com.itwillbs.dao.FaqBoardDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Cart view section -->
	<section id="checkout">

		<div class="container">
			<div class="row">
				<!--        <div class="col-md-12"> -->
				<div class="checkout-area">
					<div class="row">
						<!--               <div class="col-md-8"> -->
						<!-- 가로 길이 조절 -->
						<div class="checkout-left">

								<div class="panel-group" id="accordion">
									<c:forEach var="fbb" items="${faqList}">
									<div class="panel panel-default aa-checkout-billaddress">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseOne${fbb.faq_idx}"> <!-- href = collapse### 이랑 아래에 -->
													Q. 질문 ${fbb.faq_idx} ${fbb.faq_question}

												</a>
											</h4>
										</div>
										<div id="collapseOne${fbb.faq_idx}" class="panel-collapse collapse">
											<!-- id = collapse### 에서 ###을 맞춰줘야 해당 답변 펼쳐짐 (아무 단어나 넣어도 되는듯)-->

											<div class="panel-body">
												<div class="row">
													<div class="col-md-12">A. 답변 내용 ${fbb.faq_answer}
														</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- / footer -->
	<!-- /.row -->
</body>
</html>