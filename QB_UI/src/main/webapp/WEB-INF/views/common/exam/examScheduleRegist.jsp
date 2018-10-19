<%-- 
	@JSP:examScheduleRegist.jsp
	@DATE:2018-10-18
	@Author:유영준
	@Desc:강사-시험 일정 등록(스토리보드 28 of 41) --> 시험 일정 등록 페이지 새로 생성함
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="${pageContext.request.contextPath}/css/examScheduleRegist.css"
	rel="stylesheet">
 <script
	src="${pageContext.request.contextPath}/lib/onet-js/examScheduleRegist.js"></script> 
<section id="main-content">
  <section class="wrapper-low">
  
    <div class="row mt">
      <div class="col-lg-12 mt">
      
        <div class="row content-panel">
          <div class="panel-body">
              <div id="updateExam" class="tab-pane">
                <div class="row">
                  <div class="col-md-12">
                  	<h2><strong>시험 일정 등록</strong></h2>
                    <div class="col-md-2" id="examScheduleRegistMember">
	                    <div class="invite-row">
	                      <h4 class="pull-left">응시대상자</h4>
	                    </div>
                  	<div class="checkName">
						<div class="form-panel">
	                      <label>
	                        <input type="checkbox" value="" id="checkall">전체선택
	                      </label>
	                      	<c:forEach items="${classMemberList}" var="classMemberList">
	                        <ul class="chat-available-user" id ="checkboxNameUl">
	                          <div class="checkbox" id="checkboxName">
	                            <label>
	                            	<input type="checkbox" value="" name="chk" value="chk">${classMemberList.member_name}
	                            </label>
	                          </div>
	                        </ul>
	                        </c:forEach>
	                      </div>
                     </div>
                  </div>
                  <div class="col-md-10">
                     <div class="col-md-4 detailed">
                        <div>
                          <iframe src = "index.html" style="width:100%;height:330px;"></iframe>
                        </div>
                        <h3>시험명 : ${param.exam_paper_name}</h3>
                        
                     </div>
                    <div class="col-md-8 detailed">
                    <%-- 폼 양식 시작 --%>
                      <form action="#" class="form-horizontal style-form">
                        <div class="form-group">
                          <label class="control-label col-md-2">날짜</label>
                            <div class="col-md-5 col-xs-11">
                              <input class="form-control form-control-inline input-medium default-date-picker" size="16" type="text" 
                              		 name="">
                              
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
                        
                        <%-- 폼 양식 끝 --%>
                    
                    <div class="col-md-12">
                      <div class="col-md-2">
                      </div>
                      <div class="col-md-3">
                        <button type="button" class="btn btn-second btn-lg" 
                        onclick="location.href='${pageContext.request.contextPath}/teacher/examManagement.do?class_num=${param.class_num}'">취소</button>
                      </div>
                      <div class="col-md-2">
                      </div>
                      <div class="col-md-4">
                        <button type="button" class="btn btn-primary btn-lg btn-block" 
                        onclick="location.href='${pageContext.request.contextPath}/teacher/examManagement.do?class_num=${param.class_num}'">시험 일정 등록</button>
                      </div>
                    </div>
                    </form>
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
   
    <!-- /container -->
  </section>
  <!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->