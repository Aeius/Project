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
   var checkPasswordResult = false, 
   checkPasswordConfirmResult = false, 
   checkEmailNullResult = false, 
   checkEmailNull2Result = false, 
   checkNameResult = false, 
   checkPhoneResult = false,
   checkAddressNullResult = false,
   checkAddressNull2Result = false,
   checkAddressNull3Result = false,
   checkAddressNull4Result = false;
   

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
//          element.innerHTML = '길이 체크 통과!';
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
      // => 생성된 RegExp 객체의 exec() 메서드를 호출하여 전화번호값을 파라미터로 전달
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
       * 2) 전화번호 사이는 - 기호 또는 공백이 포함될 수도 있고 포함되지 않을 수도 있음
       * 3) 두번째 자리는 3자리 또는 4자리 숫자
       * 4) 마지막 자리는 4자리 숫자로 끝
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
         element.innerHTML = ' ☆사용 불가능한 번호입니다(010/011 휴대번호만 입력 가능합니다)';
         checkPhoneResult = false; // 전역변수값을 false 로 변경
      }
      
   }
   
   
   

   //---------------------------------------------------------- submit 이벤트 처리 -------------------------------------------------------------      
   function checkForm() {

      //---------------------------------------------------------- 이메일 -------------------------------------------------------------   
      if($('#member_email').val() != "") { // 이메일 공백 아닐시
         checkEmailNullResult = true; // 전역변수값을 true 로 변경
         
         var element = document.getElementById('emailNull');
         element.innerHTML = ' ';
         
      } else {
      // 이메일 확인 항목 span 태그 값을 지정하여 해당 태그 Element 가져오기
         $('#member_email').focus();
         var element = document.getElementById('emailNull');
         element.innerHTML = ' ☆이메일을 입력해 주세요';
         element.style.color = 'red';
         checkEmailNullResult = false; // 전역변수값을 false 로 변경
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

      if(checkPasswordResult && 
         checkPasswordConfirmResult && 
         checkEmailNullResult && 
         checkEmailNull2Result && 
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
   
   // 도메인 onchange 이벤트 처리
   function domainSelect(domain) {
//       alert(domain);
      // 선택된 도메인을 이메일 주소 입력 중 도메인 입력란에 표시
       $('#member_email2').val(domain);
   }
   
   // 아이디 중복 체크
   
   $(document).ready(function() {
      $('#dupEmailCheckBtn').click(function(){
      $('#dupResult').html("이메일 입력 또는 이메일 도메인 선택해주세요").css('color','red');
      if($('#member_email2').val() != "" && $('#member_email').val() !=""){
//          alert("아이디중복체크 버튼 클릭");
         $.ajax('<c:url value="/checkId.sh" />',{
            data:{member_email:$('#member_email').val()+$('#member_email2').val()},
            success:function(rdata){
               if(rdata=="emailDup"){
                  rdata="이메일 중복 입니다.";
               }else{
                  rdata="이메일 사용 가능합니다.";
               }
            
               $('#dupResult').html(rdata).css('color','red');
            }
         });
      }
      });
   });
      
</script>
<script type="text/javascript">


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
              <div class="col-md-6">
                <div class="aa-myaccount-register">                 
                 <h4>회원가입</h4>
                 <form action='<c:url value="memberJoinPro.sh" />' id="fr" class="aa-login-form" method="post" onsubmit="return checkForm()">
                    <label for="">Email<span id="emailNull"> * </span></label>
                    <input type="text" id="member_email" name="member_email" placeholder="이메일을 입력해주세요" maxlength="20">
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
                   
                <button type="button" class="aa-browse-btn">인증번호 받기</button>
                 <button type="button" class="aa-browse-btn">인증번호 확인</button>
                  
                   <input type="text" placeholder="인증번호를 입력해주세요">
               
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