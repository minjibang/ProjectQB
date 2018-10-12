<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/FindIdPwd.css" rel="stylesheet">




<div id="login-page">
	<div class="container">
		<form class="form-login2" action="">
			<h2 class="form-login-heading">ID Search</h2>
			<div class="login-wrap">
				<input type="text" id="membername" class="form-control" placeholder="User Name"	autofocus required> <br> 
				<input type="text" id="mailto" class="form-control authText" placeholder="Email" required>
				<button class="btn btn-theme authBtn" id="mailtoBtn"><i class="fa fa-envelope"></i> Send&nbsp;Mail</button><br><br>
				<input type="text" id="ok" class="form-control"	placeholder="Authorization Code" required><br> 
				<a href="" class="btn btn-theme" id="okBtn"><i class="fa fa-unlock"></i> Confirm</a>
				<hr>
				
				<!-- <a data-toggle="modal" href="#myModal" class="btn btn-theme"
					id="modal_confirm"><i class="fa fa-unlock"></i> Confirm</a> -->
				
			<div id="remember">
				<a class="" href="${pageContext.request.contextPath}/login.jsp"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-home"></i> Login</a> / 
				<a class="" href="${pageContext.request.contextPath}/index/pwdSearch.do"><i class="fa fa-key"></i> Forgot Password ?</a>
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
					<p>입력하신 정보와 일치하는 ID입니다.</p>
					<P>${param.member_id}</P>
				</div>
				<div class="modal-footer">
					<a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-theme" type="button"><i class="fa fa-home"></i> Login</a>
					<a href="${pageContext.request.contextPath}/index/pwdSearch.do" class="btn btn-theme" type="button"><i class="fa fa-key"></i> Password Search</a>
				</div>
			</div>
		</div>

		<!-- modal -->

	</div>
</div>
<!-- js placed at the end of the document so the pages load faster -->

<script>
	$.backstretch("${pageContext.request.contextPath}/img/login-bg.jpg", {
		speed : 500
	});
	
		var mailtoNum;
		var member_id;
		
		$('#mailtoBtn').click(function(){
			$.ajax({
	            type : 'post',
	            url : '${pageContext.request.contextPath}/index/mail.do',
	            data : {mailto:$('#mailto').val()},
	            success : function(data) {
	            	alert(data);
					mailtoNum=data;
	            	this.mailtoNum=mailtoNum;
					
	            },
	            error : function(error) {
	               alert("인증 메일 전송 실패");
	               console.log(error);
	               console.log(error.status);
	            }
	         });
		});
		
		$('#okBtn').click(function(){
    		if(mailtoNum==$('#ok').val()){
    			$.ajax({
    				type : 'post',
    				url : '${pageContext.request.contextPath}/index/idSearch.do',
    				data : {membername:$('#membername').val(), mailto:$('#mailto').val()},
    				dataType: 'json',
    				async:false,
    				success:function(data){
    					//alert(data.result);
    					
    				//member_id = data.result;
    				 
    				},
    				error : function(error) {
    		               alert("에러");
    		               console.log(error);
    		               console.log(error.status);
    		            }
    			});
    			
    		}else{
    			alert("입력란을 확인해주세요");
    			
    			$('#ok').val("");
    		}
    	});
		
		
		
		
	
</script>


