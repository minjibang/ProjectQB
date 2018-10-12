<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/FindIdPwd.css" rel="stylesheet">





<div id="login-page">
	<div class="container">
		<form class="form-login2" action="index.html">
			<h2 class="form-login-heading">PASSWORD Search</h2>
			<div class="login-wrap">
				<input type="text" class="form-control" placeholder="ID" autofocus>
				<br> <input type="text" class="form-control authText"
					placeholder="Email">
				<button class="btn btn-theme authBtn" id="auth"><i class="fa fa-envelope"></i> Send&nbsp;Mail</button>
				<br> <br> <input type="text" class="form-control"
					placeholder="Authorization Code"> <br> <a
					data-toggle="modal" href="login.html#myModal" class="btn btn-theme"
					id="modal_confirm"><i class="fa fa-unlock"></i> Confirm</a>
				<hr>
			
			<div id="remember">
				<a class="" href="${pageContext.request.contextPath}/login.jsp"> &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-home"></i> Login </a> / 
				<a class="" href="${pageContext.request.contextPath}/index/idSearch.do"><i class="fa fa-key"></i> Forgot ID ? </a>
			</div>
			</div>
			<br>
		</form>
	</div>
	<!-- Modal -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
		tabindex="-1" id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Alert</h4>
				</div>
				<div class="modal-body">
					<p>입력하신 이메일로 임시 비밀번호가 전송 되었습니다. 확인 후 로그인 해 주세요.</p>
				</div>
				<div class="modal-footer">
					<a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-theme" type="button"><i class="fa fa-home"></i> Login</a>
					<a href="${pageContext.request.contextPath}/index/idSearch.do" class="btn btn-theme" type="button"><i class="fa fa-key"></i> ID Search</a>
				</div>
			</div>
		</div>

		<!-- modal -->

	</div>
</div>
<!-- js placed at the end of the document so the pages load faster -->

<script>
	$.backstretch("${pageContext.request.contextPath}/img/bg-test8.jpg", {
		speed : 500
	});
</script>

