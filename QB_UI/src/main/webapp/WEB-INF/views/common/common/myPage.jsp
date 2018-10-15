<%-- 
	@JSP:myPage.jsp
	@DATE:
	@Author:김현이
	@Desc:마이페이지(스토리보드 12,13,14 of 41)
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="${pageContext.request.contextPath}/css/myPage.css" rel="stylesheet">

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
			<%-- 탭 머리 시작--%>
				<div class="panel-heading">
                	<ul class="nav nav-tabs nav-justified">
                  		<li class="active">
                   		<a data-toggle="tab" href="#personalInfo">개인정보 수정</a>
                  		</li>
                  		<li>
                    	<a data-toggle="tab" href="#unregister" class="contact-map">회원 탈퇴</a>
                  		</li>
                	</ul>
              	</div>
			<%-- 탭 머리 종료 --%>
			<%-- 탭 몸통 시작 --%>
				<div class="panel-body">
                <div class="tab-content">
                <%--개인정보 수정 탭 시작 --%>
                  <div id="personalInfo" class="tab-pane active">
                    <div class="row">
                      <div class="col-lg-8 col-lg-offset-2 detailed mt">
                        <h4 class="mb">개인정보 수정</h4>
                        <%-- 개인정보 수정 폼 시작 --%>
                        <form role="form" class="form-horizontal formArrayHyunyi" method="post" action="myPage.do">
                        <%-- 아이디 --%>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">아이디</label>
                            <div class="col-lg-8">
                              <input type="text" placeholder="id" class="form-control" name="member_id" readonly value="${memberDto.member_id}">
                            </div>
                          </div>
                          <%-- 기존 비밀번호 --%>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">기존 비밀번호</label>
                            <div class="col-lg-8">
                              <input type="password" placeholder="password" class="form-control">
                            </div>
                          </div>
                          <%-- 비밀번호 변경 --%>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">비밀번호 변경
                             <input type="checkbox" class="ez-checkbox" id="passwordChange" style="height: auto" >
                            </label>
                           
                            <div class="col-lg-8">
                              <input type="password" placeholder="password" class="form-control" id="passwordChangeChk" name="member_pwd" >
                            </div>
                          </div>
                          	<div id="pwddiv"></div> <%-- 비밀번호 유효성 결과 출력 --%>
                        <%-- 비밀번호 확인 --%>  	
                          <div class="form-group">
                            <label class="col-lg-3 control-label">비밀번호 확인</label>
                            <div class="col-lg-8">
                              <input type="password" placeholder="password" id="passwordChangeChk" class="form-control">
                            </div>
                          </div>
                          <div id="pwdcheckdiv"></div> <%-- 비밀번호 일치 결과 출력 --%>
                         <%-- 이름 --%> 
                          <div class="form-group">
                            <label class="col-lg-3 control-label">이름</label>
                            <div class="col-lg-8">
                              <input type="text" placeholder="name" class="form-control" name="member_name" readonly value="${memberDto.member_name}">
                            </div>
                          </div>  
                          <%-- 핸드폰 --%>      
                        <div class="form-group">
                            <label class="col-lg-3 control-label">핸드폰</label>
                            <div class="col-lg-8">
                              <input type="text" placeholder="HP" id="country" class="form-control" name="member_phone" value="${memberDto.member_phone}">
                            </div>
                          </div>
                          <%-- 이메일 변경 --%>
                          <div class="form-group">
                            <label class="col-lg-3 control-label"><p style="display: inline-block">이메일 변경</p>
                              <input type="checkbox" class="ez-checkbox" id="emailChangeChk" style="height: auto">
                            </label>
                            <div class="col-lg-8">
                                  <input type="text" placeholder="email" id="member_email" class="form-control inlineTextField" name="member_email" value="${memberDto.member_email}">
                                  <button class="btn btn-theme myPageBtnControl" type="button" id="emailCodeRquestBtn">인증번호 요청</button> 
                            </div>
                          </div>
                          <%-- 인증번호 --%>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">인증번호</label>
                            <div class="col-lg-8">
                                  <input type="text" placeholder="인증번호" class="form-control inlineTextField" id="emailCodeCheck">
                                  <button class="btn btn-theme myPageBtnControl" type="button" id="emailCodeCheckBtn">인증번호 확인</button>
                            </div>
                          </div>
                          <%-- 정보 수정&취소 버튼 --%>
                          <div class="form-group">
                            <div class="col-lg-11 infoBtnDiv">
                                <button class="btn btn-theme" type="submit" id="infoModifiy">정보 수정</button>
                                <button class="btn btn-theme04" type="reset" id="cancel">취소</button>
                            </div>
                          </div>
                        </form>
                        <%-- 개인정보 수정 폼 종료 --%>
                      </div>
                      <!-- /col-lg-8 -->
                    </div>
                    <!-- /row -->
                  </div>
                  <%-- 개인정보 수정 탭 종료 --%>
                  <%-- 회원 탈퇴 탭 시작 --%>
                    <div id="unregister" class="tab-pane">
                    <div class="row">
                      <div class="col-lg-8 col-lg-offset-2 detailed mt">
                        <h4 class="mb">회원 탈퇴</h4>
                        <%--회원탈퇴 폼 시작 --%>
                        <form role="form" class="form-horizontal formArrayHyunyi" action="myPageDrop.do">
                          <%-- 아이디 --%>
                          <div class="form-group">  
                            <label class="col-lg-3 control-label">아이디</label>
                            <div class="col-lg-8">
                              <input type="text" placeholder="id" class="form-control" readonly value="${memberDto.member_id}">
                            </div>
                          </div>
                          <%-- 비밀번호 --%>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">비밀번호</label>
                            <div class="col-lg-8">
                              <input type="password" placeholder="password" class="form-control">
                            </div>
                          </div>
                          <%-- 회원탈퇴&취소 버튼 --%>
                          <div class="form-group">
                            <div class="col-lg-11 infoBtnDiv">
                                <button class="btn btn-theme" type="button" id="infoModifiy">회원 탈퇴</button>
                                <button class="btn btn-theme04" type="button" id="cancel">취소</button>
                            </div>
                          </div>
                        </form>
                        <%-- 회원탈퇴 폼 종료 --%>
                      </div>
                      <!-- /col-lg-8 -->
                    </div>
                    <!-- /row -->
                  </div>
                  <%-- 회원 탈퇴 탭 종료 --%>      
                </div>
                <!-- /tab-content -->
              </div>
              <%-- 탭 몸통 종료--%>
			
			</div><!-- row content-panel -->
		</div><!-- col-lg-12 mt -->
	</section><!-- wrapper site-min-height -->
</section><!-- main-content -->

<script>
var idcheck = false;
var pwdcheck = false;
var pwdcheck2 = false;
var mailcheck = false;

var mailtonumber;

$('#emailCodeRquestBtn').click(function() {
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/index/mail.do',
		data : {
			mailto : $('#member_email').val()
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

function confirmPwd() {
	var pwd = document.getElementById("passwordChange");
	var pwddiv = document.getElementById("pwddiv");

	var p1 = /[0-9]/;
	var p2 = /[a-zA-Z]/;
	var p3 = /[~!@#$%^&*()]/;

	if (!p1.test(passwordChange.value) || !p2.test(passwordChange.value) || !p3.test(passwordChange.value)
			|| passwordChange.value.length < 8) {

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
	var pwd = document.getElementById("passwordChange");
	var pwdcheck = document.getElementById("passwordChangeChk");
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

	var pwd = document.getElementById("passwordChange");
	var pwdcheck = document.getElementById("passwordChangeChk");
	var mailnumber = document.getElementById("emailCodeCheck");
	
	console.log("======"+pwd);
	console.log("======"+mailnumber);

	if (pwdcheck == false || pwdcheck2 == false) {
		document.getElementById("passwordChange").focus();
		return false;
	}else if(mailcheck == false){
		alert("메일인증을 해주세요.");
		document.getElementById("emailCodeCheck").focus();
		return false;
	}else if(mailnumber.value != mailtonumber){
		alert("인증번호가 일치하지 않습니다.");
		document.getElementById("emailCodeCheck").focus();
		return false;
	}
	else {
		var joinconfirm = confirm("정보를 수정하시겠습니까?");
		if(joinconfirm == true){
			return true;
		}else{
			return false;
		}
	}
}

</script>
