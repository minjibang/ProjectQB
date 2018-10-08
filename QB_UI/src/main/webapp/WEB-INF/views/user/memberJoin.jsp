<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- Favicons -->



  <div id="login-page">
    <div class="container">
      <form class="form-signup" action="index.html">
        <h2 class="form-login-heading">SIGN UP</h2>
        <div class="login-wrap">
          <label>ID</label>
          <input type="text" class="form-control" placeholder="User ID" autofocus>
            <span class="pull-right"><button class="btn2 btn-theme05">중복 확인</button></span>
          <p>가입가능한 아이디 입니다.</p>
            <label>PASSWORD</label>
          <input type="password" class="form-control" placeholder="Password">
          <br>
            <label>CHECK PASSWORD</label>
          <input type="password" class="form-control" placeholder="Password" autofocus>
          <p style="color:red">비밀번호가 일치하지 않습니다</p>
            <label>CLASS</label>
          <select class="form-control">
                  <option>109기</option>
                  <option>110기</option>
                  <option>111기</option>
                  <option>112기</option>
                  <option>113기</option>
                </select>
          <br>
            <label>NAME</label>
          <input type="text" class="form-control" placeholder="Class" autofocus>
          <br>
            <label>E-mail</label>
          <input type="text" class="form-control" placeholder="Class" autofocus>
          <span class="pull-right"><button class="btn2 btn-theme05">인증번호 발송</button></span>
            <label>Certification Number</label>
          <input type="text" class="form-control" placeholder="Class" autofocus>
          <br>
            <label>PHONE</label>
          <input type="text" class="form-control" placeholder="Class" autofocus>
          <br>
            
            
          
            <button class="btn btn-theme btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
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
    $.backstretch("img/login-bg.jpg", {
      speed: 500
    });
  </script>
