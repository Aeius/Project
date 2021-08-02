<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<script type="text/javascript">
		if("${msg}" == "로그인을 실패했습니다.") {
			alert("${msg}");
			history.back();
		} else {
			alert("잘못된 접근입니다.");
			location.href = "./";
		}
	</script>

</body>
</html>