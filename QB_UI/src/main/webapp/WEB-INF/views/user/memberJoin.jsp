<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.authNumberEmail { display: inline; width:74%;}
.authNumberButton {width:25%; height:35px;}
</style>


  <div id="login-page">
    <div class="container">
      <form class="form-signup" action="insertmember.do" method="post" onsubmit="return check()">
        <h2 class="form-login-heading">SIGN UP</h2>
        <div class="login-wrap">
          <label>ID</label>
          <input type="text" class="form-control" placeholder="User ID" autofocus name="member_id" id="member_id" onblur="confirmId()" required>
<!--             <span class="pull-right"><button class="btn2 btn-theme05" onclick="confirmId()">중복 확인</button></span> -->
          <div id="iddiv"></div>
            <label>PASSWORD</label>
          <input type="password" class="form-control" placeholder="Password" name="member_pwd" id="member_pwd">
          <br>
            <label>CHECK PASSWORD</label>
          <input type="password" class="form-control" placeholder="Password" autofocus id="member_pwd_check">
          
          <p style="color:red">비밀번호가 일치하지 않습니다</p>
            <label>CLASS</label>
          <select class="form-control" name="class_name">
                  <option>109기</option>
                  <option>110기</option>
                  <option>111기</option>
                  <option>112기</option>
                  <option>113기</option>
                </select>
          <br>
            <label>NAME</label>
          <input type="text" class="form-control" placeholder="Class" autofocus name="member_name">
          <br>
            <label>E-mail</label><br>
          <input type="text" class="form-control authNumberEmail" placeholder="Class" autofocus name="member_email" >
          <button class="btn2 btn-theme05 authNumberButton">인증번호 발송</button><br><br>
            <label>Certification Number</label>
          <input type="text" class="form-control" placeholder="Class" autofocus>
          <br>
            <label>PHONE</label>
          <input type="text" class="form-control" placeholder="Class" autofocus name="member_phone">
          <br>
            
            
          
            <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
            <a class="pull-right" href="login.jsp">로그인 페이지</a>
          
        </div>
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Forgot Password ?</h4>
              </div>
              <div class="modal-body">
                <p>Enter your e-mail address below to reset your password.</p>
                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
              </div>
              <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
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
    $.backstretch("${pageContext.request.contextPath}/img/login-bg.jpg", {
      speed: 500
    });
  </script>
  <script>
  	var idcheck = false;
  	
  	function confirmId(){
  		val = document.getElementById("member_id").value;
  		iddiv = document.getElementById("iddiv");
  		
  		$.ajax({
  			url : 'joinCheckId.do',
  			data : {
  				'member_id' : val
  			},
  			dataType : 'json',
  			success : function(data){
  				if(data.result == true){
  					console.log("etset");
  					iddiv.innerHTML = "사용가능한 아이디 입니다.";
  					iddiv.style.color = 'blue';
  					idcheck = true;
  				}
  				else{
  					iddiv.innerHTML = "사용 불가능한 아이디 입니다.";
  					iddiv.style.color = "red";
  					idcheck = false;
  				}
  			}
  		});
  	}
  	function check(){
  		if(idcheck == false){
  			document.getElementById("iddiv").innerHTML="아이디 중복 검사를 통과하지 못하였습니다.";
  			document.getElementById("iddiv").style.color='red';
  			document.getElementById("member_id").focus();
  			
  			return false;
  		}
  		
  		var pwd = document.getElementById("member_pwd");
  		var pwdcheck = document.getElementById("member_pwd_check");
  		if(pwd.value != pwconfirm.value){
  			alert("두 개의 비밀번호는 일치해야 합니다.");
  			pw.focus();
  			return false;
  		}
  		
  		var p1 =/[0-9]/;
  		var p2 =/[a-zA-Z]/;
  		var p3 =/[~!@#$%^&*()]/;
  		if(!p1.test(pwd.value) || !p2.test(pwd.value) || !p3.test(pwd.value) || pwd.value.length < 8){
  			alert("비밀번호는 8자 이상 숫자, 영문자, 특수문자를 포함해야 합니다.");
  			pw.focus();
  			
  			return false;
  		}
  	}
  </script>
