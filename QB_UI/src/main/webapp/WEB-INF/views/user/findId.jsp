<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/css/FindIdPwd.css" rel="stylesheet">



<div id="login-page">
	<div class="container">
		<form class="form-login2" action="${pageContext.request.contextPath}/index/idSearch.do" method="post" onsubmit="return authNumberCheck()">
			<h2 class="form-login-heading">ID Search</h2>
			<div class="login-wrap">
				<input type="text" id="member_name" name="member_name" class="form-control" placeholder="User Name"	autofocus required><br> 
				<input type="text" id="member_email" name="member_email" class="form-control authText" placeholder="Email" required>
				<button type="button" class="btn btn-theme authBtn" id="mailtoBtn"><i class="fa fa-envelope"></i> Send&nbsp;Mail</button><br><br>
				<input type="text" id="ok" class="form-control" placeholder="Authorization Code" required><br> 
				<button type="submit" class="btn btn-theme confirm"><i class="fa fa-unlock"></i>Confirm</button>
				<hr>
				
				
				<div id="remember">
				<a class="" href="${pageContext.request.contextPath}/login.jsp"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-home"></i> Login</a> / 
				<a class="" href="${pageContext.request.contextPath}/index/pwdSearch.do"><i class="fa fa-key"></i> Forgot Password ?</a>
			</div>
			</div>
			<br>
		</form>
	</div>


	</div>
<!-- js placed at the end of the document so the pages load faster -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
            	swal({
			    	title:"EMAIL로 인증번호가 발송되었습니다.",
			    	text:/* "인증번호를 확인 후 입력해주시기 바랍니다." */data,
			    	icon:"info",
			    	button:"Confirm",
			    });    
            	mailtoNum=data;
            	this.mailtoNum=mailtoNum;
				
            },
            error : function(error) {
            	swal({
              	  title:"ERROR",
              	  text:error+"status:"+error.status,
              	  icon:"waraning",
              	  button:"Confirm",
                 });
               console.log(error);
               console.log(error.status);
            }
            
         });
	});
	
	/* 인증번호가 틀렸을 때 유효성 */
	function authNumberCheck(){
		var ok = $('#ok').val();
		console.log(ok)
		if(mailtoNum == ok){
			return true;
		}else{
			swal({
		    	title:"인증번호가 유효하지 않습니다.",
		    	text:"다시 시도해주세요",
		    	icon:"warning",
		    	button:"Confirm",
		    });
			$('#ok').focus();
			return false;
		}
	}
		
	/* 아이디 찾기 결과 */
	var result = "${result}";
	if(result != "" && result != "false"){
		swal({
	    	title:"해당 정보로 확인된 ID입니다.",
	    	text:/* "확인 후 로그인해주세요" */result,
	    	icon:"info",
	    	button:"Confirm",
	    });
	}else if(result == "false"){
		swal({
	    	title:"유효하지 않은 정보입니다.",
	    	text:"정보 확인 후 다시 시도해주세요",
	    	icon:"warning",
	    	button:"Confirm",
	    });
	}
	
	 history.replaceState({}, null, location.pathname);
	
	 /* <c:if test="${!empty result}">
		swal("본인의 아이디를 까먹지마세여","${result}","warning");
	</c:if>
		history.replaceState({}, null, location.pathname); */
		
</script>


