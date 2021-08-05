<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
	<script type="text/javascript">
	function checkPassword(member_password) { // 패스워드 입력값 검증
		// 8~16자리 영문자,숫자,특수문자(!@#$%) 조합 패턴 검사
		var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		var engUpperCaseRegex = /[A-Z]/;
		var engLowerCaseRegex = /[a-z]/;
		var digitRegex = /[0-9]/;
		var specRegex = /[!@#$%]/;
		
		var element = document.getElementById('checkPasswordResult');
		
		// 패스워드 구성요소에 대한 길이 및 종류 체크
		if(lengthRegex.exec(member_password)) {
// 			element.innerHTML = '길이 체크 통과!';
			// 각 요소별 체크를 통해 카운팅 결과에 따른 안전,보통,위험,사용불가 로 출력
			var safetyCount = 0;
			if(engUpperCaseRegex.exec(member_password)) safetyCount++;
			if(engLowerCaseRegex.exec(member_password)) safetyCount++;
			if(digitRegex.exec(member_password)) safetyCount++;
			if(specRegex.exec(member_password)) safetyCount++;
			
			switch (safetyCount) {
				case 4: 
					element.innerHTML = '안전';
					element.style.color = 'green';
					checkPasswordResult = true; // 전역변수값을 true 로 변경
					break;
				case 3: 
					element.innerHTML = '보통';
					element.style.color = 'orange';
					checkPasswordResult = true; // 전역변수값을 true 로 변경
					break;
				case 2: 
					element.innerHTML = '위험';
					element.style.color = 'red';
					checkPasswordResult = true; // 전역변수값을 true 로 변경
					break;
				case 1: 
					element.innerHTML = '사용불가';
					element.style.color = 'black';
					checkPasswordResult = false; // 전역변수값을 false 로 변경
					break;
			}
			
		} else {
			$('#new_password').focus();
			element.innerHTML = '비밀번호는 8~16자리 영문자,숫자,특수문자 조합 입니다.';
			element.style.color = 'red';
			checkPasswordResult = false; // 전역변수값을 false 로 변경
		}
	}
	
	function checkPasswordConfirm(member_passwordCheck) { // 패스워드 일치 확인
		// 패스워드 확인 항목 우측의 span 태그 ID 값을 지정하여 해당 태그 Element 가져오기
		var element = document.getElementById('passwordConfirmResult');
		
		if(member_passwordCheck == $('#new_password').val()) { // 패스워드 확인 내용 일치 시
			element.innerHTML = '패스워드 일치';
			checkPasswordConfirmResult = true; // 전역변수값을 true 로 변경
		} else {
			$('#new_password_check').focus();
			element.innerHTML = '패스워드 불일치';
			checkPasswordConfirmResult = false; // 전역변수값을 false 로 변경
		}
	}
	</script>
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
        <h2>Account Page</h2>
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
               <div class="col-md-6" style="width: 34%; margin: 0px 33%;">
                <div class="aa-myaccount-register">                 
                 <h4>비밀번호 변경</h4>
                 <form action='<c:url value="changePasswordPro.sh" />' id="fr" class="aa-login-form" method="post">
                    <label>현재 비밀번호 <input type="password" id="old_password" name="member_password" style="width: 62%; margin-left: 10%;"></label>
                    <label>새 비밀번호 <input type="password" id="new_password" name="member_password_new" style="width: 62%; margin-left: 14%;" maxlength="16" onkeyup="checkPassword(this.value)"></label>
                    <div id="checkPasswordResult" style="font-size: 14px; text-align:right;"></div>
                    <label>새 비밀번호 확인<input type="password" id="new_password_check" style="width: 62%; margin-left: 5%;" maxlength="16" onkeyup="checkPasswordConfirm(this.value)"></label>
                    <div id="passwordConfirmResult" style="font-size: 14px; text-align: right;"></div>
                    <div style="padding: 0 21%;">
                    <button type="submit" id="member_deleteBtn" class="aa-browse-btn">비밀번호 변경</button>
                    <button type="reset" class="aa-browse-btn" onclick="location.href='<c:url value="/myPage.sh"/>'">취소</button>                    
                    </div>
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