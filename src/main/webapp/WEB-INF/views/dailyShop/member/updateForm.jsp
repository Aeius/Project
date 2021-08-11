<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>PERFUMESHIP</title>
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// ---------------------------------------------------------- 우편번호 검색 API ----------------------------------------------------------
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("member_extraAddress2").value = extraAddr;
            
            } else {
                document.getElementById("member_extraAddress2").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            document.getElementById("member_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("member_extraAddress").focus();
        }
    }).open();
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
		element.innerHTML = '사용 가능한 번호입니다.';
		checkPhoneResult = true; // 전역변수값을 true 로 변경
	} else {
		element.innerHTML = '사용 불가능한 번호입니다(010/011 휴대번호만 입력 가능합니다)';
		checkPhoneResult = false; // 전역변수값을 false 로 변경
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
 <jsp:include page="../inc/mypageNav.jsp"></jsp:include>
  <!-- / catg header banner section -->

 <!-- Cart view section -->
   <!-- product category -->
  <section id="aa-product-category">
    <div class="container">
      <div class="row">

			<div style="float: left;">
			<aside class="aa-sidebar">
            <!-- single sidebar -->
            <div class="aa-sidebar-widget">
            <br>
             <h3>회원 정보</h3>
              <ul class="aa-catg-nav">
                <li><a href="<c:url value='/myPage.sh'/>">내 정보</a></li>
                <li><a href="<c:url value='/changePassword.sh'/>">비밀번호 변경</a></li>
                <li><a href="<c:url value='/delete.sh'/>">회원 탈퇴</a></li>
              </ul>
            </div>
            </aside>
			</div>
			
        <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
          <div class="aa-myaccount-register">       
                    <br>
                 <h2>내 정보</h2>
                 <form action="<c:url value='updatePro.sh'/>" class="aa-login-form" method="post">
                    <label for="">Email</label>
                    <input type="text" value="${member.member_email}" readonly name="member_email"style="width: 60%;">
                    <label for="">이름</label>
                    <input type="text" placeholder="이름" value="${member.member_name}" name="member_name"style="width: 60%;" required>
                    <label for="">전화번호</label>
                    <input type="text" placeholder="01012345678" value="${member.member_phone}" id="member_phone" name="member_phone"style="width: 60%;" maxlength="11" onblur="checkPhoneNum(this.value)" required>
                    <div id="phoneNull" style="font-size: 14px; width: 60%"></div>
                    <label for="">주소</label>
                    <input type="text" id="member_post" name ="member_post" placeholder="우편번호" value="${member.member_post}" style="width: 15%;margin-right: 4px;" required>
                    <input type="text" id="member_address" name="member_address" placeholder="도로명주소" value="${member.member_address}" style="width: 31%;margin-right: 7px;" required>
                    <button type="button" class="aa-browse-btn" style="float: inherit;" onclick="execDaumPostcode()">주소 검색</button>
                    <input type="text" id="member_extraAddress" name="member_extraAddress" placeholder="지번주소" value="${member.member_extraAddress}" style="width: 60%;">
                    <input type="text" id="member_extraAddress2" name="member_extraAddress2" placeholder="상세주소" value="${member.member_extraAddress2}" style="width: 60%;">
                    <button type="submit" class="aa-browse-btn" style="display: inherit;float: initial;">수정</button>   
                    <div>
                   	<br><br><br><br>
                    </div>                 
                  </form>
                </div>
       		 </div>
       		</div>
        </div>
        <!-------------------------------------------- -사이드바 영역 --------------------------------------------------------------------- -->
  </section>
  <!-- / product category -->
	<div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
	 
	</div>

 <!-- / Cart view section -->

  <!-- footer -->  
 <jsp:include page="../inc/footer.jsp"></jsp:include>
  <!-- / footer -->

  </body>
</html>