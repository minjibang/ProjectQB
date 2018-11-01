<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath}/css/Memberjoin.css"
	rel="stylesheet">

<div id="login-page">
	<div class="container">
		<form class="form-signup" action="insertmember.do" method="post"
			onsubmit="return check()">
			<h2 class="form-login-heading">회원 가입</h2>
			<div class="login-wrap">
				<label>ID</label> <input type="text" class="form-control"
					placeholder="아이디를 입력해주세요" autofocus name="member_id" id="member_id"
					onblur="confirmId()">
				<div id="iddiv"></div>
				<label>PASSWORD</label> <input type="password" class="form-control"
					placeholder="비밀번호를 입력해주세요" name="member_pwd" id="member_pwd"
					onblur="confirmPwd()">
				<div id="pwddiv"></div>
				<label>CHECK PASSWORD</label> <input type="password"
					class="form-control" placeholder="비밀번호를 한번 더 입력해주세요" autofocus
					id="member_pwd_check" onblur="confirmPwd2()">
				<div id="pwdcheckdiv"></div>
				<label>클래스 선택</label> <select class="form-control" name="class_name" id="class_name">
					<c:forEach items="${classList}" var="classList">
                         <option value="${classList.class_name}">${classList.class_name}</option>
                    </c:forEach>
				</select> <br> <label>이름</label> <input type="text"
					class="form-control" placeholder="이름을 입력해주세요"
					pattern="([a-z, A-Z, 가-힣]){2,}" autofocus name="member_name"
					required>
				<label>E-mail</label><br> <input type="text"
					class="form-control authText" placeholder="이메일을 입력해주세요"
					name="member_email" id="mailto">
				<button type="button" class="btn btn-theme authBtn" id="mailtoBtn">
					<i class="fa fa-envelope"></i> 인증번호 전송
				</button>
				<br> <br> <label>인증번호 입력</label> 
				<input type="text" class="form-control" placeholder="인증번호를 입력해주세요" id="textmail" autofocus>
				<br> <label>휴대전화</label> <input type="text" class="form-control" placeholder="휴대폰 번호를 입력해주세요" pattern="(010)-\d{3,4}-\d{4}" autofocus name="member_phone" required>
				<div>( - 를 포함한 010-0000-0000 의 형식으로 입력해주세요)</div>



				<button class="btn btn-theme btn-block" type="submit">
					<i class="fa fa-sign-in"></i> 회원 가입
				</button>
				<a class="pull-right"
					href="${pageContext.request.contextPath}/login.jsp">로그인 페이지</a>

			</div>
			<!-- Modal -->
			<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
				tabindex="-1" id="myModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Forgot Password ?</h4>
						</div>
						<div class="modal-body">
							<p>Enter your e-mail address below to reset your password.</p>
							<input type="text" name="email" placeholder="Email"
								autocomplete="off" class="form-control placeholder-no-fix">
						</div>
						<div class="modal-footer">
							<button data-dismiss="modal" class="btn btn-default"
								type="button">Cancel</button>
							<button class="btn btn-theme" type="button">Submit</button>
						</div>
					</div>
				</div>
			</div>
			<!-- modal -->
		</form>
	</div>
</div>
<!-- js placed at the end of the document so the pages load faster -->

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->

<script>
	$.backstretch("${pageContext.request.contextPath}/img/bg-test8.jpg", {
		speed : 500
	});
</script>
<script>
	var idcheck = false;
	var pwdcheck = false;
	var pwdcheck2 = false;
	var mailcheck = false;
	
	var mailtonumber;
	
	$('#mailtoBtn').click(function() {
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/index/mail.do',
			data : {
				mailto : $('#mailto').val()
			},
			success : function(data) {
				alert(data);
				mailtonumber = data;
				mailcheck = true;
			},
			error : function(error) {
				alert("인증 메일 전송 실패");
				console.log(error);
				console.log(error.status);
			}
		});
	});

	function confirmId() {
		var val = document.getElementById("member_id").value;
		var iddiv = document.getElementById("iddiv");
		if (val == "") {
			iddiv.innerHTML = "아이디를 입력해주세요";
			iddiv.style.color = 'green';
			idcheck = false;

		} else {
			$.ajax({
				url : 'joinCheckId.do',
				data : {
					'member_id' : val
				},
				dataType : 'json',
				success : function(data) {
					if (data.result == true) {
						iddiv.innerHTML = "사용가능한 아이디 입니다.";
						iddiv.style.color = 'blue';
						idcheck = true;
					} else {
						iddiv.innerHTML = "사용 불가능한 아이디 입니다.";
						iddiv.style.color = "red";
						idcheck = false;
					}
				}
			});
		}
	}
	function confirmPwd() {
		var pwd = document.getElementById("member_pwd");
		var pwddiv = document.getElementById("pwddiv");

		var p1 = /[0-9]/;
		var p2 = /[a-zA-Z]/;
		var p3 = /[~!@#$%^&*()]/;

		if (!p1.test(pwd.value) || !p2.test(pwd.value) || !p3.test(pwd.value)
				|| pwd.value.length < 8) {

			pwddiv.innerHTML = "비밀번호는 8자 이상 숫자, 영문자, 특수문자를 포함해야 합니다.";
			pwddiv.style.color = 'red';
			pwdcheck = false;
		} else {
			pwddiv.innerHTML = "안전";
			pwddiv.style.color = 'blue';
			pwdcheck = true;

		}
	}
	function confirmPwd2() {
		var pwd = document.getElementById("member_pwd");
		var pwdcheck = document.getElementById("member_pwd_check");
		var pwdcheckdiv = document.getElementById("pwdcheckdiv");

		if (pwd.value != pwdcheck.value) {
			pwdcheckdiv.innerHTML = "비밀번호가 일치하지 않습니다.";
			pwdcheckdiv.style.color = 'red';
			pwdcheck2 = false;
		} else {
			pwdcheckdiv.innerHTML = "일치";
			pwdcheckdiv.style.color = 'blue';
			pwdcheck2 = true;
		}

	}
	function check() {

		var pwd = document.getElementById("member_pwd");
		var pwdcheck = document.getElementById("member_pwd_check");
		var mailnumber = document.getElementById("textmail");
		
		console.log("======"+pwd);
		console.log("======"+mailnumber);

		if (idcheck == false) {
			document.getElementById("iddiv").innerHTML = "아이디 중복 검사를 통과하지 못하였습니다.";
			document.getElementById("iddiv").style.color = 'red';
			document.getElementById("member_id").focus();

			return false;
		}else if (pwdcheck == false || pwdcheck2 == false) {
			document.getElementById("member_pwd").focus();
			return false;
		}else if(mailcheck == false){
			alert("메일인증을 해주세요.");
			document.getElementById("textmail").focus();
			return false;
		}else if(mailnumber.value != mailtonumber){
			alert("인증번호가 일치하지 않습니다.");
			document.getElementById("textmail").focus();
			return false;
		}
		else {
			var joinconfirm = confirm("회원가입 하시겠습니까");
			if(joinconfirm == true){
				return true;
			}else{
				return false;
			}
		}
	}
</script>