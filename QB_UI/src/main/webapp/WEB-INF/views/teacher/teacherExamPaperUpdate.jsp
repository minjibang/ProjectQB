<%-- 
	@JSP:teacherExamPaperUpdate.jsp
	@DATE:2018-10-08
	@Author:양회준
	@Desc:강사-시험 일정 등록/수정(스토리보드 28 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
  <link rel="stylesheet" type="text/css" href="lib/bootstrap-datepicker/css/datepicker.css" />
  <link rel="stylesheet" type="text/css" href="lib/bootstrap-daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" type="text/css" href="lib/bootstrap-timepicker/compiled/timepicker.css" />
  <link rel="stylesheet" type="text/css" href="lib/bootstrap-datetimepicker/datertimepicker.css" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->

  <style>
  /*회준*/
    .checkName{
      height:350px;
      overflow:auto;
    }
    
	.wrapper-low {
	    display: inline-block;
	    margin-top: 20px;
	    padding-left: 15px;
	    padding-right: 15px;
	    padding-bottom: 0px;
	    padding-top: 0px;
	    width: 100%;
	}
  </style>
  
    <section id="main-content">
      <section class="wrapper-low">
        <div class="row mt">
          <div class="col-lg-12 mt">
            <div class="row content-panel">
              <div class="panel-heading">
                <ul class="nav nav-tabs nav-justified">
                  <li class="active">
                    <a data-toggle="tab" href="#myExamPaper">내 시험지</a>
                  </li>
                  <li>
                    <a data-toggle="tab" href="#makeExamPaper" class="contact-map">시험지 만들기</a>
                  </li>
                  <li>
                    <a data-toggle="tab" href="#tempExamPaper">임시 저장된 시험지</a>
                  </li>
                  <li>
                    <a data-toggle="tab" href="#updateExam">시험 등록</a>
                  </li>
                  <li>
                    <a data-toggle="tab" href="#ExamSchedule">시험 일정</a>
                  </li>
                </ul>
              </div>
              <!-- /panel-heading -->

              <div class="panel-body">
                <div class="tab-content">
                  <div id="myExamPaper" class="tab-pane active">
                    <div class="row">
                      으으?
                    </div>
                  </div>

                  <div id="makeExamPaper" class="tab-pane">
                    <div class="row">
                      어어?
                    </div>
                    <!-- /tab-pane -->
                  </div>

                  <div id="tempExamPaper" class="tab-pane">
                    <div class="row">
                        lockdown
                    </div>
                    <!-- /tab-pane -->
                  </div>

                  <div id="updateExam" class="tab-pane">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="col-md-2">
                        <div class="invite-row">
                          <h4 class="pull-left">응시대상자</h4>
                        </div>
                      <div class="checkName">
                        <div class="form-panel">
                          <label>
                            <input type="checkbox" value="">
                              전체선택
                          </label>
                            <ul class="chat-available-user">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" value="">
                                  이두리
                                  </label>
                              </div>
                            </ul>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-10">
                          <div class="col-md-4 detailed">
                            <div>
                              <iframe src = "index.html" style="width:100%;height:330px;"></iframe>
                            </div>
                            <h3>시험명 : </h3>

                          </div>
                        <div class="col-md-8 detailed">
                          <form action="#" class="form-horizontal style-form">
                            <div class="form-group">
                              <label class="control-label col-md-2">날짜</label>
                                <div class="col-md-5 col-xs-11">
                                  <input class="form-control form-control-inline input-medium default-date-picker" size="16" type="text" value="">
                                  <span class="help-block">날짜를 선택하세요</span>
                                </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-md-2">시간</label>
                                <div class="col-md-4">
                                  <div class="input-group bootstrap-timepicker">
                                    <input type="text" class="form-control timepicker-default">
                                     <span class="input-group-btn">
                                       <button class="btn btn-theme04" type="button"><i class="fa fa-clock-o"></i></button>
                                    </span>
                                  </div>
                                  <label class="control-label">부터</label>
                                </div>
                                <div class="col-md-4">
                                  <div class="input-group bootstrap-timepicker">
                                    <input type="text" class="form-control timepicker-default">
                                      <span class="input-group-btn">
                                        <button class="btn btn-theme04" type="button"><i class="fa fa-clock-o"></i></button>
                                      </span>
                                  </div>
                                  <label class="control-label">까지</label>
                                </div>
                              </div>
                            <!--timepicker group end-->
                              <div class="form-group">
                                <label class="control-label col-md-2">시험시간</label>
                                  <label class="control-label col-md-5">1시간</label>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-md-2">종료알림</label>
                                  <label class="control-label col-md-5">5분</label>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-md-2">응시대상</label>
                                  <div class="col-md-10 col-xs-11">
                                    <input type="text" class="form-control" placeholder="응시대상을 입력하세요">
                                  </div>
                              </div>
                              <div class="form-group">
                                <label class="control-label col-md-2">설명</label>
                                  <div class="col-md-10 col-xs-10">
                                    <textarea rows="3" class="form-control" placeholder="설명을 입력하세요"></textarea>
                                  </div>
                              </div>
                              <br>
                              <br>
                              <br>
                              <!--select Exam Status-->
                            </form>
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="col-md-2">
                          </div>
                          <div class="col-md-3">
                            <button type="button" class="btn btn-second btn-lg">취소</button>
                          </div>
                          <div class="col-md-2">
                          </div>
                          <div class="col-md-4">
                            <button type="button" class="btn btn-primary btn-lg btn-block">시험 일정 등록</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- /tab-pane -->
                  <div id="ExamSchedule" class="tab-pane">
                    <div class="row">
                      <div class="col-md-6">
                        <div id="map"></div>
                        <h4>Location</h4>
                      </div>
                    </div>
                    <!-- /row -->
                  </div>
                  <!-- /tab-pane -->
                </div>
                <!-- /tab-content -->
              </div>
              <!-- /panel-body -->
            </div>
            <!-- /col-lg-12 -->
          </div>
          <!-- /row -->
        </div>
        <!-- /container -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        <div class="credits">
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
          Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
        </div>
        <a href="profile.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="lib/jquery.scrollTo.min.js"></script>
  <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="lib/common-scripts.js"></script>
  <!--script for this page-->
    <script src="lib/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
    <script type="text/javascript" src="lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="lib/bootstrap-daterangepicker/date.js"></script>
    <script type="text/javascript" src="lib/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script type="text/javascript" src="lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="lib/bootstrap-daterangepicker/moment.min.js"></script>
    <script type="text/javascript" src="lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
    <script src="lib/advanced-form-components.js"></script>
  <!-- MAP SCRIPT - ALL CONFIGURATION IS PLACED HERE - VIEW OUR DOCUMENTATION FOR FURTHER INFORMATION -->
  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
