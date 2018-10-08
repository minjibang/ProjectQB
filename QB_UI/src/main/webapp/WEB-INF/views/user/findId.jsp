<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <header class="header black-bg">
<a href="index.do" class="logo"><b>DASH<span>IO</span></b></a>
</header>      
 -->
<!DOCTYPE html>
<html lang="en">


  
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->

    


  <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
  <div id="login-page">
    <div class="container">
      <form class="form-login2" action="index.html">
        <h2 class="form-login-heading">ID Search</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" placeholder="User Name" autofocus>
          <br>
          <input type="text" class="form-control" placeholder="Email">
          <br>
            <div align="right">
                <span id="">인증번호 유효기간 &nbsp; &nbsp;</span>
                <button class="btn btn-theme" id="auth" >Authorization Code Send</button>  
            </div>
            <br>
            <input type="text" class="form-control" placeholder="Authorization Code">
            <br>
            
            <a data-toggle="modal" href="login.html#myModal" class="btn btn-theme" id="modal_confirm"> Confirm</a>
            <hr>
          
            <div id="remember">
            <a class="" href="#">
              	정보 기억남? 그럼 이거 클릭 Login
              </a>
            <br>
            <a class="" href="pwdSearch.do">
              pw모름? 그럼 이거 클릭 pw
              </a>
            </div>
            <br>
        </div>
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Alert</h4>
              </div>
              <div class="modal-body">
                <p>입력하신 정보와 일치하는 ID입니다.</p>
                  <P>ID 정보</P>
                </div>
              <div class="modal-footer">
                  <button class="btn btn-theme" type="button">LOGIN</button>
                 <button class="btn btn-theme" type="button">PASSWORD SEARCH</button>
              </div>
            </div>
          </div>
        </div>
        <!-- modal -->
      </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  
  <script>
    $.backstretch("img/login-bg.jpg", {
      speed: 500
    });
  </script>


