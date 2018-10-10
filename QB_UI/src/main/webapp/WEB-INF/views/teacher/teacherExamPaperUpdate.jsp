<%-- 
	@JSP:teacherExamPaperUpdate.jsp
	@DATE:2018-10-08
	@Author:양회준
	@Desc:강사-시험 일정 등록/수정(스토리보드 28 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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