<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="${pageContext.request.contextPath}/css/FindIdPwd.css" rel="stylesheet">






<div id="login-page">
	<div class="container">
		<form class="form-login2" action="${pageContext.request.contextPath}/index/pwdSearch.do" method="post">
			<h2 class="form-login-heading">PASSWORD Search</h2>
			<div class="login-wrap">
				<input type="text" id="member_id" name="member_id" class="form-control" placeholder="ID" autofocus required><br>
				<input type="text" id="member_email" name="member_email" class="form-control authText" placeholder="Email" required>
				<button type="button" class="btn btn-theme authBtn" id="mailtoBtn"><i class="fa fa-envelope"></i> Send&nbsp;Mail</button><br><br>
				<input type="text" id="ok" class="form-control" placeholder="Authorization Code"><br> 
				<button type="submit" class="btn btn-theme confirm" ><i class="fa fa-unlock"></i>Confirm</button>
				<hr>
			
			<div id="remember">
				<a class="" href="${pageContext.request.contextPath}/login.jsp"> &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-home"></i> Login </a> / 
				<a class="" href="${pageContext.request.contextPath}/index/idSearch.do"><i class="fa fa-key"></i> Forgot ID ? </a>
			</div>
			</div>
			<br>
		</form>
	</div>
	
	</div>

<!-- js placed at the end of the document so the pages load faster -->

<script>
	
	

	$.backstretch("${pageContext.request.contextPath}/img/login-bg.jpg", {
		speed : 500
	});
	
	var mailtoNum;
	var result;

	$('#mailtoBtn').click(function(){
		$.ajax({
            type : 'post',
            url : '${pageContext.request.contextPath}/index/mail.do',
            data : {mailto:$('#member_email').val()},
            success : function(data) {
            	alert(data);
				mailtoNum=data;
            	this.mailtoNum=mailtoNum;
				
            },
            error : function(error) {
               alert(error+"status:"+error.status);
               console.log(error);
               console.log(error.status);
            }
            
         });
	});
</script>

