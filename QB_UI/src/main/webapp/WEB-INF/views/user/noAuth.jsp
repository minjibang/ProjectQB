<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.noAuthBack {
	text-align: center;
}
.authLogoutBtn{
	text-align: center;
}
.back{
	margin-top: 25%;
}
</style>
	<div class="back">
	<div class="noAuthBack">
	<h1>아직 등록된 클래스가 없습니다 !</h1>
		<h3>클래스가 등록될 때까지 기다려 주세요 !</h3>
		<br> 
		<div class="noAuthBtn">
		<a class="btn btn-theme confirm authLogoutBtn"
			href="${pageContext.request.contextPath}/logout">Logout</a>
	</div>
</div>
</div>







<script>
	$.backstretch("${pageContext.request.contextPath}/img/login-bg.jpg", {
		speed : 500
	});
</script>