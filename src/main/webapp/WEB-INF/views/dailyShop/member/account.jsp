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
<script src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		$('#fr').submit(function() {

		
			if($('#member_email').val() == ""){
				alert("이메일을 입력해주세요");
				$('#member_email').focus();
				return false;
			}
		
			if($('#member_password').val() == ""){
				alert("패스워드를 입력해주세요");
				$('#member_password').focus();
				return false;
			}
		
			
			if($('#member_name').val() == ""){
				alert("이름을 입력해주세요");
				$('#member_name').focus();
				return false;
			}
			
			if($('#member_post').val() == "" && $('#member_address').val() == ""&& $('#member_extraAddress').val() == ""&& $('#member_extraAddress2').val() == ""){
				alert("이메일을 입력해주세요");
				$('#email').focus();
				return false;
			}
			
		});
		
		// 아이디 중복 체크
		// click() id="btn" 버튼을 클릭했을때
		// ajax() idCheck.jsp 갈때 id상자의 val() id파라미터 넘기면
		//                        아이디 중복여부 출력결과 가져옴
		// html()  id="dup" 안에 출력결과 넣기
		$('#btn').click(function () {
			$.ajax('idCheck.jsp',{
				data:{id:$('#id').val()},
				success:function(rdata){
					$('#dup').html(rdata).css('color','red');
				}
				
			});
		});
		
	});
</script>

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

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
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
    <img src="<c:url value='/resources/img/banner_add/logo4.gif'/>" alt="fashion img">
    <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Join</h2>
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
                 <form action='<c:url value="memberJoinPro.sh" />' id="fr" class="aa-login-form" method="post">
                    <label for="">Email<span>*</span></label>
                    <input type="email" id="member_email" name="member_email" placeholder="이메일을 입력해주세요">
                    <input type="button" class="aa-browse-btn" value="중복확인">
                    <label for=""><span>*</span></label><br>
                   
 					<button type="button" class="aa-browse-btn">인증번호 받기</button>
 					 <button type="button" class="aa-browse-btn">인증번호 확인</button>
                  
          			<input type="text" placeholder="인증번호를 입력해주세요">
					
                    <label for="">Password<span>*</span></label>
                    <input type="password" id="member_password" name = "member_password" placeholder="비밀번호를 입력해주세요">
                    <label for="">Password check<span>*</span></label>
                    <input type="password" placeholder="비밀번호 확인">
                    <label for="">이름<span>*</span></label>
                    <input type="text" id="member_name" name = "member_name"  placeholder="이름">
                    <label for="">전화번호<span>*</span></label>
                    <input type="text" id="member_phone" name = "member_phone"  placeholder="전화번호">
                 	
                 	<input type="button" class="aa-browse-btn" value="주소검색" onclick="execDaumPostcode()">
                    <label for=""><span>*</span> 주소를 입력해 주세요</label><br>
<!--                     <button type="button" class="aa-browse-btn" onclick="execDaumPostcode()">주소검색</button> -->
                    
                    <input type="text" id="member_post" name ="member_post" placeholder="우편번호">
                    
                    <input type="text" id="member_address" name="member_address" placeholder="도로명주소">
                  
                    <input type="text" id="member_extraAddress" name="member_extraAddress" placeholder="지번주소">
                    <input type="text" id="member_extraAddress2" name="member_extraAddress2" placeholder="상세주소">
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