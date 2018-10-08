<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap-datepicker/css/datepicker.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/daterangepicker.css" />
  
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->

<!-- DataTables 관련 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">





</head>
<body>
	<section id="container"> <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
	<!--header start--> <!-- 헤더 부분 --> <tiles:insertAttribute name="header" />
	<!--header end--> <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
	<!--sidebar start--> <!-- 사이드바 부분 --> <tiles:insertAttribute
		name="sidebar" /> <!--sidebar end--> <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
	<!--main content start--> <!-- 컨텐츠 부분 --> <tiles:insertAttribute
		name="content" /> <!--main content end--> <!--footer start--> <!-- 푸터부분 -->
	<tiles:insertAttribute name="footer" /> <!--footer end--> </section>


<!-- js placed at the end of the document so the pages load faster -->
  <script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${pageContext.request.contextPath}/lib/jquery.scrollTo.min.js"></script>
  <script src="${pageContext.request.contextPath}/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/moment.min.js"></script>
  <script src="${pageContext.request.contextPath}/lib/advanced-form-components.js"></script>
  
	<!-- 테이블 관련  -->

	<script>
	 	$(document).ready(function() {
			$('#AdminTable').DataTable({
				"columnDefs" : [ {
					"width" : "15%",
					"targets" : 3
				} ]
			});
		});
	
	 <!-- 재훈 - 관리자 문제분류관리 페이지 데이터테이블 시작-->
	 	$(document).ready( function () {
	 	    $('table.display').DataTable({
	 	    	"columnDefs": [
	 	    	    { "width": "20%", "targets": 0,
	 	    	      "width": "50%", "targets": 1,
	 	    	      "width": "30%", "targets": 2
	 	    	    }
	 	    	  ]
	 	    });
	 	});
	 
	 <!-- 재훈 - 관리자 문제분류관리 페이지 데이터테이블 끝-->
	 
	 <!-- 영준 - 관리자 회원관리 페이지 데이터테이블 시작 -->
	 $(document).ready( function () {
	        $('#adminMemberTable').DataTable();
	    } 
	    );
	 <!-- 영준 - 관리자 회원관리 페이지 데이터테이블 끝 -->
	</script>
	
	

	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<!-- 테이블 관련 end -->
</body>
</html>