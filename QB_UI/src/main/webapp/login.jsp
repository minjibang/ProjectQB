<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
  <!--external css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">

</head>

<body>
  <div id="login-page">
    <div class="container">
      <form class="form-login" action="join.html">
        <h2 class="form-login-heading">login now</h2>
        <div class="login-wrap">
            <label>ID</label>
          <input type="text" class="form-control" placeholder="User ID" autofocus>
          <br>
            <label>PASSWORD</label>
          <input type="password" class="form-control" placeholder="Password">
            <br>
            <!-- 정원 (나중에 삭제) -->
          <label class="pull-right">
            <a href="idSearch.do"> Forgot id?</a>
          </label>
          <label class="pull-right">
            <a href="pwdSearch.do"> Forgot Password?</a>
          </label>
          <label class="pull-right">
            <a href="noAuth.do"> 인증안된 회원</a>
          </label>
          <!-- ********************** -->
          <button class="btn btn-theme02 btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i>LOGIN</button>
          <br>
          <a href="memberjoin.do"><button type="button" class="btn btn-theme btn-block"><i class="fa fa-lock"></i> SIGN UP</button></a>
        </div>
      </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
  <script type="text/javascript" src="lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("img/login-bg.jpg", {
      speed: 500
    });
  </script>
</body>

</html>