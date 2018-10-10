<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>Welcome BitCamp</title>

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Bootstrap core CSS -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--external css-->
<link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>

	<div id="login-page">
		<div class="container">
			<form class="form-login" action="index/login.do">
				<h2 class="form-login-heading">login now</h2>
				<div class="login-wrap">
					<label>ID</label> <input type="text" class="form-control"
						name="member_id" placeholder="User ID" autofocus required>
					<br> <label>PASSWORD</label> <input type="password"
						class="form-control" name="member_pwd" placeholder="Password"
						required> <br>
					<!-- 정원 (나중에 삭제) -->
					<label class="pull-right"> <a href="index/idSearch.do">
							Forgot id?</a>
					</label>
				
					<!-- 헤더 완료 후 링크 옮기기 -->
					<br>
					<br> <a href="common/mypage.do">마이페이지로 이동</a>&nbsp;&nbsp;&nbsp;
					<br>
					<br> <br>
					<br> <a href="teacher/teacherMain.do">강사 메인</a>
					<!-- 헤더 완료 후 링크 옮기기 -->

					<label class="pull-right"> <a href="index/pwdSearch.do">
							Forgot Password?</a>
					</label> <label class="pull-right"> <a href="noAuth.do"> 인증안된
							회원</a>
					</label>
					<!-- ********************** -->

					<button class="btn btn-theme02 btn-block" type="submit">
						<i class="fa fa-lock"></i>LOGIN
					</button>
					<br> <a href="index/memberjoin.do"><button type="button"
							class="btn btn-theme btn-block">
							<i class="fa fa-lock"></i> SIGN UP
						</button></a>
				</div>
				<a href="admin/adminClassInfo.do">admin</a>
			</form>
		</div>
	</div>
	<!-- js placed at the end of the document so the pages load faster -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.min.js"></script>
	<!--BACKSTRETCH-->
	<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
	<script type="text/javascript" src="lib/jquery.backstretch.min.js"></script>
	<script>
		$.backstretch("img/login-bg.jpg", {
			speed : 500
		});

		<c:choose>
		<c:when test="${param.result eq '0'}">
		swal("아이디 혹은 비밀번호가 틀렸습니다.", "", "error");
		</c:when>
		</c:choose>
	</script>

</body>

</html>