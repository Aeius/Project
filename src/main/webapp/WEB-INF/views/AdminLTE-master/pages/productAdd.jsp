<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <!-- head -->
  <jsp:include page="../inc/head.jsp" />
  <head>
  <script src='<c:url value="/resources/script/jquery-3.6.0.js" />'></script>
  <script type="text/javascript">
    // 입력제어
	$(document).ready(function() {
		$('#fr').submit(function() {
			if($('#product_name').val()==""){ // 이름 미입력
				alert("상품 이름을 입력하세요");
				$('#product_name').focus();
				return false;
			}
			if($('#product_size').val()=="" ){ // 용량 미입력
				alert("상품 용량을 입력하세요");
				$('#product_size').focus();
				return false;
			}
			if($('#product_size').val()!=30 && $('#product_size').val()!=50){
				alert("입력된 용량을 다시 확인해주세요 (30 또는 50)");
				$('#product_size').focus();
				return false;
			}
			if($('#product_price').val()==""){ // 가격 미입력
				alert("상품 가격을 입력하세요");
				$('#product_price').focus();
				return false;
			}
			if($('#product_stock').val()==""){ // 재고 미입력
				alert("상품 재고를 입력하세요");
				$('#product_stock').focus();
				return false;
			}
			if($('#product_main_image').val()==""){ // 상품 메인 사진 미선택
				alert("상품 메인 사진을 선택하세요");
				$('#product_main_image').focus();
				return false;
			}
			if($('#product_detail_image').val()==""){ // 상품 상세 사진 미선택
				alert("상품 상세 사진을 선택하세요");
				$('#product_detail_image').focus();
				return false;
			}
			if($('input:checkbox[name="product_category"]:checked').length==0){ // 카테고리 미선택 
				alert("카테고리를 선택해주세요");
				return false;
			}
		});
	});
    
    // 상품명 중복 확인
    function checkProductName(nameCheck) {
    	var element = document.getElementById('dupCheckResult');
    	$.ajax('<c:url value="/checkProductName.ad"/>',{
    		data:{ 
    			product_name : $('#product_name').val() 
   			},
			success:function(rdata){
				if(rdata == "nameDup") { // 동일이름 + 띄어쓰기
					element.innerHTML = "동일한 상품명이 존재합니다. 용량이 다른 경우에만 등록해주세요. (권장)";
					element.style.color = 'red';
				} else {
					element.innerHTML = "";
				}
			}
    	});
    	
		
	}
  </script>
  </head>
  
  <body class="skin-blue">
    <!-- Site wrapper -->
    <div class="wrapper">
      <!-- 상단바 -->
      <jsp:include page="../inc/top.jsp" />
      <!-- 사이드메뉴 -->
      <jsp:include page="../inc/side.jsp" />
      
	  <!-- ==========본문 시작========== -->
	  
      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
      <div class="box box-warning">
                <div class="box-header">
                  <h1 class="box-title">상품 등록하기</h1>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form role="form" id="fr" action='<c:url value="/productAddPro.ad" />' method="post" enctype="multipart/form-data">
					<!-- text input -->
                    <div class="form-group">
                      <label>상품 이름 입력</label> <span id="dupCheckResult"><!-- 중복 체크 결과 표시 영역 --></span> 
                      <input type="text" id="product_name" name="product_name" class="form-control" placeholder="상품 이름을 입력하세요" onkeyup="checkProductName(this.value)"/>
                    </div>
                    
                    <!-- text input -->
                    <div class="form-group">
                      <label>상품 용량 입력</label> <!-- 숫자만 입력 -->
                      <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="product_size" name="product_size" class="form-control" placeholder="상품 용량을 입력하세요 (숫자만 입력)"/>
                    </div>
                    
                    <!-- text input -->
                    <div class="form-group">
                      <label>상품 가격 입력</label> 
                      <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="product_price" name="product_price" class="form-control" placeholder="상품 가격을 입력하세요 (숫자만 입력)"/>
                    </div>
                    
                    <!-- text input -->
                    <div class="form-group">
                      <label>상품 재고 입력</label>
                      <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="product_stock" name="product_stock" class="form-control" placeholder="상품 재고를 입력하세요 (숫자만 입력)"/>
                    </div>
                    
                    <!-- file -->
                    <div class="form-group">
                      <label for="exampleInputFile">상품 메인 사진</label>
                      <input multiple="multiple" type="file" id="product_main_image" name="file">
                    </div>
                    <!-- 다중 파일 업로드시 multiple="multiple" 추가 / name="file" 이어야함 -->
                    <div class="form-group">
                      <label for="exampleInputFile">상품 상세 사진</label>
                      <input multiple="multiple" type="file" id="product_detail_image" name="file">
                    </div>
                    
                    <!-- textarea -->
                    <div class="form-group">
                      <label>상품 상세 내용 입력</label>
                      <textarea class="form-control" id="product_detail" name="product_detail" rows="5" placeholder="상품 상세 내용을 입력하세요"></textarea>
                    </div>
                    
                    <!-- checkbox -->
                    <div class="form-group">
                      <label>상품 카테고리 선택</label>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="파우더리"/>파우더리</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="플로럴"/>플로럴</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="우디"/>우디</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="아쿠아"/>아쿠아</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="프루티"/>프루티</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="시트러스"/>시트러스</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="스파이시"/>스파이시</label></div>
                      <div class="checkbox"><label><input type="checkbox" name="product_category" value="모던"/>모던</label></div>
                    </div>
                    
					<div class="box-footer">
                    <button type="submit" class="btn btn-primary">상품등록</button>
                  </div>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
      </div><!-- /.content-wrapper -->
      
      
      
      
      <!-- ==========본문 끝========== -->

      <jsp:include page="../inc/footer.jsp" />
    </div><!-- ./wrapper -->

    <jsp:include page="../inc/script.jsp" />
  </body>
</html>