/*
  	@JS:myPage.js
	@JSP:myPage.jsp
	@DATE:2018-10-16
	@Author:양회준
	@Desc:마이페이지(스토리보드 12,13,14 of 41) - 개인정보 수정 및 탈퇴
*/

//양회준 10.16 - 비밀번호변경 활성 비활성 체크박스

$("#passwordChangeChk").change(function(){
	if(this.checked){
		$("#modify_member_pwd").removeAttr("name");
		$("#passwordChange").attr("disabled", false);
		$("#passwordChangeConfirm").attr("disabled", false);
		$("#pwddiv").show();
		$("#pwdcheckdiv").show();
	}else{
		$("#modify_member_pwd").attr("name", "member_pwd");
		$("#passwordChange").attr("disabled", true);
		$("#passwordChangeConfirm").attr("disabled", true);
		$("#pwddiv").hide();
		$("#pwdcheckdiv").hide();
	}
});

//양회준 10.16 - 이메일변경 활성 비활성 체크박스
$("#emailChangeChk").change(function(){
	if(this.checked){
		$("#member_email").attr("readonly", false);
		$("#emailCodeCheck").attr("disabled", false);
		$("#emailCodeRquestBtn").attr("disabled", false);
		$("#emailCodeCheckBtn").attr("disabled", false);
	}else{
		$("#member_email").attr("readonly", true);
		$("#emailCodeCheck").attr("disabled", true);
		$("#emailCodeRquestBtn").attr("disabled", true);
		$("#emailCodeCheckBtn").attr("disabled", true);
	}
});

//양회준 10.16 - 개인정보 수정 비밀번호 확인
$('#infoModifiy').click(function() {
	if(($("#passwordChangeChk").is(":checked")==true)&&($("#emailChangeChk").is(":checked")==true)){
		if(pwdcheck==false || pwdcheck2==false){
			alert("비밀번호를 다시 설정해 주십시오.");
		}else if(mailcheck==false || mailNumberChk==false){
			alert("이메일 인증이 안되었습니다.");
		}else{
			modifySubmit();
		}
	}else if($("#passwordChangeChk").is(":checked")==true){
		if(pwdcheck==false || pwdcheck2==false){
			alert("비밀번호를 다시 설정해 주십시오.");
		}else{
			modifySubmit();
		}		
	}else if($("#emailChangeChk").is(":checked")==true){
		if(mailcheck==false || mailNumberChk==false){
			alert("이메일 인증이 안되었습니다.");
		}else{
			modifySubmit();
		}
	}else{
		modifySubmit();
	}
});

function modifySubmit(){
	$.ajax({
		type: 'post',
		url : 'memberDrop.do',
		data : {
				"member_id" : $("#modify_member_id").val(), 
				"member_pwd" : $("#modify_member_pwd").val()
				},
		success : function(data) {
			if (data == 0){
				alert("비밀번호가 입력되지 않았거나 일치하지 않습니다.");
			} else {
				if(confirm("정말 수정하시겠습니까?")){
					document.getElementById('memberModifyFrm').submit();
				}else{
					
				}
			}			
		},
		error : function(error) {
			alert("전송 실패");
			console.log(error);
			console.log(error.status);
		}
	});
}
//양회준 10.16 - 회원탈퇴 비밀번호 확인
$('#memberDropBtn').click(function() {	
	$.ajax({
		type: 'post',
		url : 'memberDrop.do',
		data : {
				"member_id" : $("#drop_member_id").val(), 
				"member_pwd" : $("#drop_member_pwd").val()
				},
		success : function(data) {
			if (data == 0){
				alert("비밀 번호가 입력되지 않았거나 일치하지 않습니다.");
			} else {
				if(confirm("정말 탈퇴하시겠습니까?")){
					document.getElementById('memberDropFrm').submit();
				}else{
					
				}				
			}			
		},
		error : function(error) {
			alert("전송 실패");
			console.log(error);
			console.log(error.status);
		}
	});
});

//비밀번호 유효성 검사
var pwdcheck = false;
var pwdcheck2 = false;

function confirmPwd() {
	var pwd = document.getElementById("passwordChange");
	var pwddiv = document.getElementById("pwddiv");

	var p1 = /[0-9]/;
	var p2 = /[a-zA-Z]/;
	var p3 = /[~!@#$%^&*()]/;

	if (!p1.test(pwd.value) || !p2.test(pwd.value) || !p3.test(pwd.value)
			|| pwd.value.length < 8) {

		pwddiv.innerHTML = "비밀번호는 8자 이상 숫자, 영문자, 특수문자를 포함해야 합니다.";
		pwddiv.style.color = '#ff6600';
		pwdcheck = false;
	} else {
		pwddiv.innerHTML = "안전한 비밀번호입니다.";
		pwddiv.style.color = 'dodgerblue';
		pwdcheck = true;

	}
}
function confirmPwd2() {
	var pwd = document.getElementById("passwordChange");
	var pwdcheck = document.getElementById("passwordChangeConfirm");
	var pwdcheckdiv = document.getElementById("pwdcheckdiv");

	if (pwd.value != pwdcheck.value) {
		pwdcheckdiv.innerHTML = "비밀번호가 일치하지 않습니다.";
		pwdcheckdiv.style.color = '#ff6600';
		pwdcheck2 = false;
	} else {
		pwdcheckdiv.innerHTML = "일치합니다.";
		pwdcheckdiv.style.color = 'dodgerblue';
		pwdcheck2 = true;
	}
}
//인증번호 메일 보내기
var mailcheck = false;
var mailNumberChk = false;
var mailtonumber;
$('#emailCodeRquestBtn').click(function() {
	$.ajax({
		type : 'post',
		url : $('#contextPath').val()+"/index/mail.do",
		data : {
			mailto : $('#member_email').val()
		},
		success : function(data) {
			alert(data);
			mailtonumber = data;
			mailcheck = true;
		},
		error : function(error) {
			alert("인증 메일 전송 실패"+error.status);
			console.log(error);
			console.log(error.status);
		}
	});
});

//인증번호 확인
$('#emailCodeCheckBtn').click(function() {
	var mailnumber = document.getElementById("emailCodeCheck");		
	if(mailnumber.value != mailtonumber){
		alert("인증번호가 일치하지 않습니다.");
		document.getElementById("emailCodeCheck").focus();
		mailNumberChk = false;
	}
	else {
		alert("인증번호가 확인되었습니다.");
		mailNumberChk = true;
	}
});
