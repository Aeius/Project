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
    
<script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>

   
   <script type="text/javascript">
   // submit 버튼 동작을 위한 전역변수 선언
   var 
   checkEmailResult = false, // 이메일 유효성 검사
   checkEmailNull2Result = false, // 이메일 입력 여부 검사
   emailCheckDup = false, // 이메일 중복 검사
   checkPasswordResult  = false,  // 비밀번호 유효성 검사
   checkPasswordConfirmResult = false,  // 비밀번호 확인 검사
   emailCheckConfirmResult = false, // 이메일 인증 번호 확인 검사
   checkNameResult = false, // 이름 유효성 검사
   checkPhoneResult = false, // 휴대폰 유효성 검사
   checkAddressNullResult = false, // 주소 입력 여부 검사
   checkAddressNull2Result = false,
   checkAddressNull3Result = false,
   checkAddressNull4Result = false;
   
	
   function checkEmail(member_email) { // 이름 검증
	      /*
	       * 이메일 검증에 사용할 정규표현식 작성
	       * 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능
	       */
	       var emailRegex = /^[A-Za-z0-9_-]{5,20}$/;
	      var regex = new RegExp(emailRegex);

	      
	      // 이메일 입력 항목 우측의 span 태그 ID 값을 통해 해당 요소(Element) 가져오기
	      var element = document.getElementById('emailNull');
	      
	      // 입력받은 이메일 값에 대한 정규표현식 패턴 검사
	      // => 생성된 RegExp 객체의 exec() 메서드를 호출하여 이메일값을 파라미터로 전달
	      if(regex.exec(member_email)) {
	         element.innerHTML = ' ☆사용 가능한 이메일입니다';
	         checkEmailResult = true; // 전역변수값을 true 로 변경
	      } else {
	         element.innerHTML = ' ☆5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다';
	         checkEmailResult = false; // 전역변수값을 false 로 변경
	      }
	      
	   }
 
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
//	          element.innerHTML = '길이 체크 통과!';
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
	         $('#member_password').focus();
	         element.innerHTML = ' ☆비밀번호는 8~16자리 영문자,숫자,특수문자 조합 입니다.';
	         element.style.color = 'red';
	         checkPasswordResult = false; // 전역변수값을 false 로 변경
	      }
	      
	   }
	   

	   function checkPasswordConfirm(member_passwordCheck) { // 패스워드 일치 확인
	      // 패스워드 확인 항목 우측의 span 태그 ID 값을 지정하여 해당 태그 Element 가져오기
	      var element = document.getElementById('passwordConfirmResult');
	      
	      if(member_passwordCheck == $('#member_password').val()) { // 패스워드 확인 내용 일치 시
	         element.innerHTML = '☆패스워드 일치';
	         checkPasswordConfirmResult = true; // 전역변수값을 true 로 변경
	      } else {
	         $('#member_passwordCheck').focus();
	         element.innerHTML = '☆패스워드 불일치';
	         checkPasswordConfirmResult = false; // 전역변수값을 false 로 변경
	         
	      }
	      
	   }
   
   
   function checkName(member_name) { // 이름 검증
      /*
       * 이름 검증에 사용할 정규표현식 작성
       * 이름은 한글, 영어 대소문자 1~15자리 사용 가능
       */
       var nameRegex = /^[가-힣A-Za-z]{1,15}$/;
      var regex = new RegExp(nameRegex);

      
      // 전화번호 입력 항목 우측의 span 태그 ID 값을 통해 해당 요소(Element) 가져오기
      var element = document.getElementById('nameNull');
      
      // 입력받은 전화번호 값에 대한 정규표현식 패턴 검사
      // => 생성된 RegExp 객체의 exec() 메서드를 호출하여 이름값을 파라미터로 전달
      if(regex.exec(member_name)) {
         element.innerHTML = ' ☆사용 가능한 이름입니다';
         checkNameResult = true; // 전역변수값을 true 로 변경
      } else {
         element.innerHTML = ' ☆한글, 영문자 사용가능! 숫자, 특수문자 사용불가합니다.';
         checkNameResult = false; // 전역변수값을 false 로 변경
      }
      
   }
   
   
   function checkPhoneNum(member_phone) { // 휴대폰번호 검증
      /*
       * 전화번호 검증에 사용할 정규표현식 작성
       * 1) 010 또는 011 로 시작
       * 2) 0~9 숫자만 가능하며 11자리 까지 작성가능
       */
       var phoneRegex = /^(010|011)[0-9]{1,10}$/;
      var regex = new RegExp(phoneRegex);

      
      // 전화번호 입력 항목 우측의 span 태그 ID 값을 통해 해당 요소(Element) 가져오기
      var element = document.getElementById('phoneNull');
      
      // 입력받은 전화번호 값에 대한 정규표현식 패턴 검사
      // => 생성된 RegExp 객체의 exec() 메서드를 호출하여 전화번호값을 파라미터로 전달
      if(regex.exec(member_phone)) {
         element.innerHTML = ' ☆사용 가능한 번호입니다';
         checkPhoneResult = true; // 전역변수값을 true 로 변경
      } else {
         element.innerHTML = ' ☆사용 불가능한 번호입니다(010/011 휴대번호 및 숫자만 사용합니다)';
         checkPhoneResult = false; // 전역변수값을 false 로 변경
      }
      
   }
   
   
   //---------------------------------------------------------- submit 이벤트 처리 -------------------------------------------------------------      
   function checkForm() {
	 //--------------------이용약관 동의-------------------------
       if(document.getElementById("policy1yes").checked==false){
           alert("약관에 동의하셔야 가입하실 수 있습니다.")
           document.getElementById("policy1yes").focus();
           return false;}


       if(document.getElementById("policy2yes").checked==false){
           alert("약관에 동의하셔야 가입하실 수 있습니다.")
           document.getElementById("policy2yes").focus();
           return false;}
	   
      //---------------------------------------------------------- 이메일 -------------------------------------------------------------   
	   if($('#member_email').val() == ""){ // 이메일 공백시 포커스 및 span 태그 내용 가져오기
	         $('#member_email').focus();
	         var element = document.getElementById('emailNull');
	         element.innerHTML = ' ☆이메일을 입력해 주세요';
	         element.style.color = 'red';
	         return false;
	      }
      
      if($('#member_email2').val() != "") { // 이메일 도메인 공백 아닐시
         checkEmailNull2Result = true; // 전역변수값을 true 로 변경
         
         var element = document.getElementById('emailNull');
         element.innerHTML = ' ';
         
      } else {
      // 이메일 도메인 확인 항목 span 태그 값을 지정하여 해당 태그 Element 가져오기
         $('#member_email2').focus();
         var element = document.getElementById('emailNull');
         element.innerHTML = ' ☆이메일 도메인을 선택해 주세요';
         element.style.color = 'red';
         checkEmailNull2Result = false; // 전역변수값을 false 로 변경
         return false;
      }
      
      //---------------------------------------------------------- 이메일 인증번호 -------------------------------------------------------------    
      if($('#emailCheckNumInput').val() == ""){ // 비밀번호 공백시 포커스 및 span 태그 내용 가져오기
          $('#emailCheckNumInput').focus();
          var element = document.getElementById('emailCheckResult');
          element.innerHTML = ' ☆인증번호를 입력해 주세요';
          element.style.color = 'red';
          return false;
	    }

      //---------------------------------------------------------- 비밀번호 -------------------------------------------------------------   
      if($('#member_password').val() == ""){ // 비밀번호 공백시 포커스 및 span 태그 내용 가져오기
            $('#member_password').focus();
            var element = document.getElementById('passwordNull');
            element.innerHTML = ' ☆비밀번호를 입력해 주세요';
            element.style.color = 'red';
            return false;
      } else{
         var element = document.getElementById('passwordNull');
         element.innerHTML = ' ';
         
      }
      
      if($('#member_passwordCheck').val() == ""){ // 비밀번호확인 공백시 포커스 및 span 태그 내용 가져오기
         $('#member_passwordCheck').focus();
         var element = document.getElementById('passwordCheckNull');
         element.innerHTML = ' ☆비밀번호를 확인해 주세요';
         element.style.color = 'red';
         return false;
      } else{
         var element = document.getElementById('passwordCheckNull');
         element.innerHTML = ' ';
   
      }
 
      //---------------------------------------------------------- 이름 -------------------------------------------------------------         
      
      if($('#member_name').val() == ""){ // 전화번호 공백시 포커스 및 span 태그 내용 가져오기
         $('#member_name').focus();
         var element = document.getElementById('nameNull');
         element.innerHTML = ' ☆이름을 입력해 주세요';
         element.style.color = 'red';
         return false;
      }
      
      //---------------------------------------------------------- 전화번호 -------------------------------------------------------------      
      
      if($('#member_phone').val() == ""){ // 전화번호 공백시 포커스 및 span 태그 내용 가져오기
         $('#member_phone').focus();
         var element = document.getElementById('phoneNull');
         element.innerHTML = ' ☆전화번호를 입력해 주세요';
         element.style.color = 'red';
         return false;
      }
      
      //---------------------------------------------------------- 주소검색 -------------------------------------------------------------   
      if($('#member_post').val() != "") { // 우편번호 공백 아닐시

         checkAddressNullResult = true; // 전역변수값을 true 로 변경
         var element = document.getElementById('addressNull');
         element.innerHTML = ' ';
      } else {
         $('#member_post').focus();
         // 우편번호 확인 항목 우측의 span 태그 ID 값을 지정하여 해당 태그 Element 가져오기
         var element = document.getElementById('addressNull');
         element.innerHTML = ' ☆우편번호를 입력해 주세요';
         element.style.color = 'red';
         checkAddressNullResult = false; // 전역변수값을 false 로 변경
         return false;
      }
      
      if($('#member_address').val() != "") { // 주소 확인 내용 일치 시

         checkAddressNull2Result = true; // 전역변수값을 true 로 변경
         var element = document.getElementById('addressNull');
         element.innerHTML = ' ';
      } else {
         $('#member_address').focus();
         // 주소 확인 항목 우측의 span 태그 ID 값을 지정하여 해당 태그 Element 가져오기
         var element = document.getElementById('addressNull');
         element.innerHTML = ' ☆주소를 입력해 주세요';
         element.style.color = 'red';
         checkAddressNull2Result = false; // 전역변수값을 false 로 변경
         return false;
      }
      
      if($('#member_extraAddress').val() != "") { // 주소 확인 내용 일치 시

         checkAddressNull3Result = true; // 전역변수값을 true 로 변경
         var element = document.getElementById('addressNull');
         element.innerHTML = ' ';
      } else {
         $('#member_extraAddress').focus();
         // 주소 확인 항목 우측의 span 태그 ID 값을 지정하여 해당 태그 Element 가져오기
         var element = document.getElementById('addressNull');
         element.innerHTML = ' ☆주소를 입력해 주세요';
         element.style.color = 'red';
         checkAddressNull3Result = false; // 전역변수값을 false 로 변경
         return false;
      }
      

      if($('#member_extraAddress2').val() != "") { // 주소 확인 내용 일치 시

         checkAddressNull4Result = true; // 전역변수값을 true 로 변경
         var element = document.getElementById('addressNull');
         element.innerHTML = ' ';
      } else {
         $('#member_extraAddress2').focus();
         // 주소 확인 항목 우측의 span 태그 ID 값을 지정하여 해당 태그 Element 가져오기
         var element = document.getElementById('addressNull');
         element.innerHTML = ' ☆상세주소를 ☆입력해 주세요';
         element.style.color = 'red';
         checkAddressNull4Result = false; // 전역변수값을 false 로 변경
         return false;
      }
      
      // 유효성 검사 및 모든항목 해당 이벤트 사항 일치 확인이 완료되었을 경우에만 
      // 회원가입을 수행하고 그렇지 않으면 메세지 출력 후 작업 중단
      // => 유효성 검사 결과와 일치 확인 결과를 전역변수로 저장 작업 필요

//       alert(checkEmailResult + "이메일 체크");
//       alert(checkEmailNull2Result + "이메일 널체크" );
//       alert(emailCheckDup+ "이메일 중복 체크");
//       alert(emailCheckConfirmResult+ "이메일 인증 확인 체크");
//       alert(checkPasswordResult+ "비밀번호 유효성 체크");
//       alert(checkPasswordConfirmResult+ "비밀번호 확인 체크");
//       alert(checkNameResult+ "이름 체크");
//       alert(checkPhoneResult+ "휴대폰 체크");

       if(checkEmailResult && 
         checkEmailNull2Result &&
         emailCheckDup &&
         emailCheckConfirmResult &&
         checkPasswordResult && 
         checkPasswordConfirmResult && 
         checkNameResult && 
         checkPhoneResult && 
         checkAddressNullResult &&
         checkAddressNull2Result &&
         checkAddressNull3Result &&
         checkAddressNull4Result) {
            return true;
         } else {
            alert('입력 항목을 확인하세요!');
            return false;
         }   
   }
   
   //---------------------------------------------------------- 도메인 onchange 이벤트 처리 -------------------------------------------------------------    
   function domainSelect(domain) {
//       alert(domain);
      // 선택된 도메인을 이메일 주소 입력 중 도메인 입력란에 표시
       $('#member_email2').val(domain);
   }
   
   
   //---------------------------------------------------------- 이메일 중복 체크 -------------------------------------------------------------   
   
   $(document).ready(function() {
      $('#dupEmailCheckBtn').click(function(){
      $('#dupResult').html("이메일 입력 또는 이메일 도메인 선택해주세요").css('color','red');
      if($('#member_email2').val() != "" && $('#member_email').val() !=""){
//          alert("아이디중복체크 버튼 클릭");
         $.ajax('<c:url value="/checkId.sh" />',{
            data:{member_email:$('#member_email').val()+$('#member_email2').val()},
            success:function(rdata){ // 리턴된 값 비교
               if(rdata=="emailDup"){
                  rdata="이메일 중복 입니다.";
                  emailCheckDup = false;
               }else{
                  rdata="이메일 사용 가능합니다.";
                  emailCheckDup = true;
               }
            
               $('#dupResult').html(rdata).css('color','red');
            }
         });
      }
      });
   });
   
 //---------------------------------------------------------- 이메일 인증번호 전송 -------------------------------------------------------------   
   
   $(document).ready(function() {
	  
	      $('#emailCheckNum').click(function(){
 	    	  if($('#member_email').val() != "" && $('#member_email2').val() != ""){
	           $('#emailCheckResult').html("이메일 전송 중입니다. 잠시만 기다려 주세요").css('color','red');
	           
	         $.ajax('<c:url value="/sendCheckMail.sh" />',{
	            data:{member_email:$('#member_email').val()+$('#member_email2').val()},
	            success:function(rdata){ // 리턴된 값 비교
	                 $('#emailCheckResult').html("인증번호 전송완료. 인증번호를 입력해주세요").css('color','red');
	            	
	            	 authNum = rdata;
	               $('#authNum').val(authNum); // 리턴된 난수 값 저장
	            }
	         });
 	      	}
	      });
	   });
 
 
   //---------------------------------------------------------- 이메일 인증번호 확인 -------------------------------------------------------------    
   $(document).ready(function() {
	   $('#emailCheckResult').html("인증번호를 입력해주세요").css('color','red');
	      $('#emailCheckNumConfirm').click(function(){
	    	if($('#emailCheckNumInput').val() != "" && $('#authNum').val() != "" ){
	      $.ajax('<c:url value="/mailCheckNumConfirm.sh" />',{
	            data:{user_authNum:$('#emailCheckNumInput').val(), // 사용자가 입력한 인증번호
	            	  authNum:$('#authNum').val()}, // 사용자에게 전달 했던 인증번호
	            success:function(rdata){ // 리턴된 값 비교
	                 
	                   if( rdata == "checkOk"){
	                	   $('#emailCheckResult').html("인증완료").css('color','red');
	                	   emailCheckConfirmResult = true; // 전역변수값을 true 로 변경
	                   }else{
	                	   $('#emailCheckResult').html("인증실패").css('color','red');
	                	   emailCheckConfirmResult = false; // 전역변수값을 false 로 변경
	                   }
	           	 }
	         });
	      	}
	      });
	   });
  
</script>


   <!-- 다음 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_post').value = data.zonecode;
                document.getElementById("member_address").value = roadAddr;
                document.getElementById("member_extraAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("member_extraAddress2").value = extraRoadAddr;
                } else {
                    document.getElementById("member_extraAddress2").value = '';
                }
                
            }
        }).open();
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
 <img src="<c:url value='/resources/img/banner_add/test_banner.png'/>" alt="banner_img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2 style ="font-family: serif;">Welcome!</h2>
        <h4 style ="font-family: serif; color: #EAEAEA; font-weight: bold;">Premium Niche Perfume Taylor</h4>
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
                <div class="aa-myaccount-register">                 
                 <h4>회원가입</h4>
                 <form action='<c:url value="memberJoinPro.sh" />' id="fr" class="aa-login-form" method="post" onsubmit="return checkForm()">
                 
      <h4> 사이트 이용약관</h4>
<textarea rows="10" cols="75" style="border: none;">	
PerfumeShip 웹사이트(이하 '본 사이트')에 오신 것을 환영합니다.


제1조(목적)
이 약관은퍼퓸쉽(PerfumeShip)가 운영하는 퍼퓸쉽(PerfumeShip)사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)
① “몰”이란 퍼퓸쉽(PerfumeShip) 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ ‘회원’이라 함은 “몰”에 (삭제) 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정)
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 봄봄 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경)
① “몰”은 다음과 같은 업무를 수행합니다.
  1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
  2. 구매계약이 체결된 재화 또는 용역의 배송
  3. 기타 “몰”이 정하는 업무
② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단)
① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.

제6조(회원가입)
① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
  1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
  2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
  3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등)
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.
② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
  1. 가입 신청 시에 허위 내용을 등록한 경우
  2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
  3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
  4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.
④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(회원에 대한 통지)
① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

제9조(구매신청)
① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. (삭제)
  1. 재화 등의 검색 및 선택
  2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
  3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인
  4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
  5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
  6. 결제방법의 선택
② “몰”이 제3자에게 구매자 개인정보를 제공•위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유‧이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.

제10조 (계약의 성립)
① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
  1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
  2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
  3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우
② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.

제11조(지급방법)
“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
3. 온라인무통장입금
4. 전자화폐에 의한 결제
5. 수령 시 대금지급
6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제
8. 기타 전자적 지급 방법에 의한 대금 지급 등

제12조(수신확인통지․구매신청 변경 및 취소)
① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.

제13조(재화 등의 공급)
① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다.

제14조(환급)
“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.

제15조(청약철회 등)
① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.
② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
  1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
  2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
  3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
  4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제16조(청약철회 등의 효과)
① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.
② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.
④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.

제17조(개인정보보호)
① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.
② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.
③ “몰”은 이용자의 개인정보를 수집•이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.
④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용•제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
⑨ “몰”은 개인정보의 수집•이용•제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집•이용•제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집•이용•제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.

제18조(“몰“의 의무)
① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다.
② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제19조(회원의 ID 및 비밀번호에 대한 의무)
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.

제20조(이용자의 의무)
이용자는 다음 행위를 하여서는 안 됩니다.
1. 신청 또는 변경시 허위 내용의 등록
2. 타인의 정보 도용
3. “몰”에 게시된 정보의 변경
4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위

제21조(연결“몰”과 피연결“몰” 간의 관계)
① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.
② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.

제22조(저작권의 귀속 및 이용제한)
① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.

제23조(분쟁해결)
① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다.
② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시•도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제24조(재판권 및 준거법)
① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.

부 칙(시행일) 이 약관은 2021년 8월 11일부터 시행합니다.
                   	</textarea>
 	<br>
                   	<br>
                   	<br> 
                   	 본인은 위 약관에 동의합니다.   	<input type="checkbox" name="policy1yes" id="policy1yes">
                   		<br>
                   	<br>
                   	<br>
                   	
                   	      
        
        
<h4> 개인정보 취급 약관</h4>        
                   	
<textarea rows="8" cols="75" style="border: none;">	                   	
■ 수집하는 개인정보 항목
회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID(email) , 비밀번호 , 자택 주소 , 휴대전화번호 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록
ο 개인정보 수집방법 : 홈페이지(회원가입)

■ 개인정보의 수집 및 이용목적

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
ο 회원 관리
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용
접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

■ 개인정보의 보유 및 이용기간

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.                   	
 </textarea>                  	
                   	
                   	
                   	
                   	<br>
                   	<br>
                   	<br>
                   	
                   
                   본인은 위 약관에 동의합니다.   	<input type="checkbox" name="policy2yes" id="policy2yes">  
                   	
                   	
                   	<br>
                   	<br>
                   	<br>	
                    <label for="">Email<span id="emailNull"> * </span></label>
                    <input type="text" id="member_email" name="member_email" placeholder="이메일을 입력해주세요" maxlength="20" onblur="checkEmail(this.value)">
                    <input type="text" id="member_email2" name="member_email2" placeholder="이메일 도메인을 선택해 주세요" readonly="readonly">
                    <select name="selectDomain" onchange="domainSelect(this.value)">
               <!-- 셀렉트박스 도메인 선택 시 해당 값을 이메일의 도메인 입력란에 표시 -->
                  <option value="">도메인선택</option>   
                  <option value="@naver.com">naver.com</option>
                  <option value="@hanmail.net">hanmail.net</option>
                  <option value="@daum.net">daum.net</option>
                  <option value="@nate.com">nate.com</option>
                  <option value="@gmail.com">gmail.com</option>
                  <option value="@hotmail.com">hotmail.com</option>         
               </select>
<!--                     <input type="button" class="aa-browse-btn" id="dupEmailCheckBtn" value="중복확인"> -->
                    <label for=""><input type="button" class="aa-browse-btn" id="dupEmailCheckBtn" value="중복확인"><span id = "dupResult"> </span></label><br>
                   
                <input type="button" class="aa-browse-btn" id="emailCheckNum" value="인증번호전송">
                 <input type="button" class="aa-browse-btn" id="emailCheckNumConfirm" name="emailCheckNumConfirm" value="인증번호확인">
                 
                 <input type="hidden" class="aa-browse-btn" id="authNum"> <!-- 이메일 인증 번호 전달한 값 저장 -->
                   
                   <input type="text" placeholder="인증번호를 입력해주세요" id="emailCheckNumInput" name="emailCheckNumInput" maxlength="5">
                    <label for=""><span id="emailCheckResult"></span></label><br>
                    
                    <label for="">Password<span id="passwordNull"> * </span></label>
                    <input type="password" id="member_password" name = "member_password" placeholder="비밀번호를 입력해주세요" maxlength="16"  onkeyup="checkPassword(this.value)">
                     <label for=""><span id="checkPasswordResult"></span></label><br>
                   
                    <label for="">Password check<span id="passwordCheckNull" > * </span></label>
                    <input type="password" id="member_passwordCheck" name = "member_passwordCheck" placeholder="비밀번호를 확인해주세요" maxlength="16" onkeyup="checkPasswordConfirm(this.value)">
                    <label for=""><span id="passwordConfirmResult"></span></label><br>
                  
                    <label for="">이름<span id="nameNull"> * </span></label>
                    <input type="text" id="member_name" name = "member_name"  placeholder="이름" maxlength="15" onblur="checkName(this.value)">
                   
                    <label for="">전화번호<span id="phoneNull"> * </span></label>
               
                    <input type="text" id="member_phone" name = "member_phone" placeholder="전화번호를 입력해주세요" maxlength="11" onblur="checkPhoneNum(this.value)">
                    
                    <label for="">우편번호<span id="addressNull"> * </span></label><br>
                    <input type="button" class="aa-browse-btn" value="주소검색" onclick="execDaumPostcode()">
                    
                    <input type="text" id="member_post" name ="member_post" placeholder="우편번호" readonly="readonly" >
                    <input type="text" id="member_address" name="member_address" placeholder="도로명주소" readonly="readonly" >
                    <input type="text" id="member_extraAddress" name="member_extraAddress" placeholder="지번주소" >
                    <input type="text" id="member_extraAddress2" name="member_extraAddress2" placeholder="상세주소"  >
                    <button type="submit" id="member_joinBtn" class="aa-browse-btn">가입</button>
                    <button type="reset" class="aa-browse-btn">취소</button>                    
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