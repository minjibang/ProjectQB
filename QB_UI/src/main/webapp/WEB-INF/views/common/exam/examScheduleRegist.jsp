<%-- 
	@JSP:examScheduleUpdate.jsp
	@DATE:2018-10-14
	@Author:양회준
	@Desc:강사-시험 일정 등록/수정(스토리보드 28 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="${pageContext.request.contextPath}/css/examScheduleUpdate.css"
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
                    <div class="col-md-2" id="examScheduleUpdateMember">
	                    <div class="invite-row">
	                      <h4 class="pull-left">응시대상자</h4>
	                    </div>
                  	<div class="checkName">
						<div class="form-panel">
	                      <label>
	                        <input type="checkbox"  id="checkall">전체선택
	                      </label>
	                      	<c:forEach items="${classMemberList}" var="classMemberList">
	                        <ul class="chat-available-user" id ="checkboxNameUl">
	                          <div class="checkbox" id="checkboxName">
	                            <label>
	                            	<input type="checkbox"  name="chk" value="chk">(${classMemberList.member_id })${classMemberList.member_name}
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
                      <form action="examInfoInsert.do" id="examScheduleRegistForm" class="form-horizontal style-form" method="post" onsubmit="return check()">
                         <input type="hidden" id="exam_paper_name" name="exam_info_name" value="${param.exam_paper_name}"/>                         
                         <input type="hidden" id="exam_paper_num" name="exam_paper_num" value="${param.exam_paper_num}"/> 
                         <input type="hidden" id="class_num" name="class_num" value="${class_num}"/>
                         <input type="hidden" id="class_name" name="class_name" value="${class_name}"/> 

                        <div class="form-group">
                          <label class="control-label col-md-2">날짜</label>
                            <div class="col-md-5 col-xs-11">
                            <p><input type="text" class="form-control form-control-inline" name="exam_info_date" id="exam_info_date"  size="16" readonly required></p>
                             
                              <span class="help-block">날짜를 선택하세요</span>
                            </div>

                        </div>
                        <div class="form-group">
                          <label class="control-label col-md-2">시간</label>
                            <div class="col-md-4">
                              <div class="input-group bootstrap-timepicker">
                                <input style="z-index:0;" type="text" class="form-control timepicker-default" id="exam_info_start" name="exam_info_start" onchange="checktime()" required>
                                 <span class="input-group-btn">
                                   <button class="btn btn-theme04" type="button" style="z-index:0;"><i class="fa fa-clock-o" style="z-index:0;"></i></button>
                                </span>
                              </div>
                              <label class="control-label">부터</label>
                            </div>
                            <div class="col-md-4">
                              <div class="input-group bootstrap-timepicker">
                                <input style="z-index:0;" type="text" class="form-control timepicker-default" id="exam_info_end" name="exam_info_end" onchange="checktime()" required>
                                  <span class="input-group-btn">
                                    <button class="btn btn-theme04" type="button" style="z-index:0;"><i class="fa fa-clock-o"></i></button>
                                  </span>
                              </div>
                              <label class="control-label">까지</label>
                            </div>
                            <div id="timeinfo"></div>
                          </div>
                        <!--timepicker group end-->
                          <div class="form-group">
                            <label class="control-label col-md-2"  style="margin-right:15px;" id="examtimelabel">시험시간</label>
                            <input style="width:20%;" id="exam_info_time" class="form-control"  type="text" name="exam_info_time"  readonly >
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-2">종료알림</label>
                              <label class="control-label col-md-5">5분</label>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-2">응시대상</label>
                              <div class="col-md-10 col-xs-11">
                                <input type="text" class="form-control" placeholder="응시대상을 입력하세요" id="exam_info_member" name="exam_info_member" required>
                              </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-2">설명</label>
                              <div class="col-md-10 col-xs-10">
                                <textarea rows="3" class="form-control" placeholder="설명을 입력하세요" id="exam_info_desc" name="exam_info_desc" required></textarea>
                              </div>
                          </div>
                          <br>
                          <br>
                          <br>
                                              <div class="col-md-12">
                      <div class="col-md-2">
                      </div>
                      <div class="col-md-3">
                        <button type="button" class="btn btn-second btn-lg" onclick="location.href='${pageContext.request.contextPath}/teacher/examManagement.do'">취소</button>
                      </div>
                      <div class="col-md-2">
                      </div>
                      <div class="col-md-4">

                        <button class="btn btn-primary btn-lg btn-block" id="examManagementBtn">시험 일정 등록</button>
                      </div>
                    </div>
                        </form>
                        <%-- 폼 양식 끝 --%>

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

    <!-- /container -->
  </section>
  <!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

<script>





function check(){
	var timeinfodiv = document.getElementById("timeinfo");
	
	var datecheck = false;
	var start = $('#exam_info_start').val();
	var end = $('#exam_info_end').val();
	
	var start_hour = start.substring(0,2);
	var end_hour=end.substring(0,2);
	
	var start_m=start.substring(3);
	var end_m = end.substring(3);

	
	if(start_hour > end_hour){
		timeinfodiv.innerHTML = "시간설정을 다시 해주세요.";
		timeinfodiv.style.color = 'red';
		
		return false;
	}else if(start_hour == end_hour){
		if(start_m > end_m){
			timeinfodiv.innerHTML = "시간설정을 다시 해주세요.";
			timeinfodiv.style.color = 'red';
			return false;
		}else if(start_m== end_m){
			timeinfodiv.innerHTML = "시간설정을 다시 해주세요.";
			timeinfodiv.style.color = 'red';
			return false;
		}
	}else if(start=="" && end==""){
		timeinfodiv.innerHTML = "시간설정을 해주세요.";
		timeinfodiv.style.color = 'bule';
		return false;
		
	}else {
		var insertconfirm = confirm("시험등록 하시겠습니까?");
		if(insertconfirm == true){
			return true;
		}else{
			return false;
		}
	}
	

}
</script>