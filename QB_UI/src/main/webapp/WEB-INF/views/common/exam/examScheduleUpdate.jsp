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
	src="${pageContext.request.contextPath}/lib/onet-js/examScheduleUpdate.js"></script> 
<section id="main-content">
  <section class="wrapper-low">
  
    <div class="row mt">
      <div class="col-lg-12 mt">
        <div class="row content-panel">
          <div class="panel-body">
              <div id="updateExam" class="tab-pane">
                <div class="row">
                  <div class="col-md-12">
                   <form action="examInfoIUpdate.do" id="examScheduleRegistForm" class="form-horizontal style-form" method="post" onsubmit="return check()">         
                  	<h2><strong>시험 일정 수정</strong></h2>
                    <div class="col-md-2" id="examScheduleUpdateMember">
	                    <div class="invite-row">
	                      <h4 class="pull-left">응시대상자</h4>
	                    </div>
                  	<div class="checkName">
						<div class="form-panel">
	                      <label>
	                        <input type="checkbox"  id="checkall">전체선택
	                      </label>
	                      	<c:forEach items="${classMemberListUpdate}" var="classMemberListUpdate">
	                        <ul class="chat-available-user" id ="checkboxNameUl">                      
	                          <div class="checkbox" id="checkboxName">
	                            <label>
	                            <c:forEach items="${classExamMemberList}" var="classExamMemberList">
	                            <c:when  test="${classMemberListUpdate.member_id}==${classExamMemberList.member_id}">
	                           
	                            	<input type="checkbox"  name="chk" id="chk" value="${classMemberList.member_id}" checked>(${classMemberListUpdate.member_id })${classMemberListUpdate.member_name}
	                           </c:when>
	                            <c:when test="${classMemberListUpdate.member_id}!=${classExamMemberList.member_id}">
	                            	<input type="checkbox"  name="chk" id="chk" value="${classMemberList.member_id}" >(${classMemberListUpdate.member_id })${classMemberListUpdate.member_name}
	                            </c:when>
	                            </c:forEach>
	                            </label>
	                            
	                          </div>
	                     
	                        </ul>
	                        </c:forEach>
	                         <c:forEach items="${classExamMemberList}" var="classExamMemberList">
	                             <input type="text" value="${classExamMemberList.member_id}">
	                             </c:forEach>
	                      </div>
                     </div>
                  </div>
                  <div class="col-md-10">
                     <div class="col-md-4 detailed">
                        <div>
                          <iframe src = "index.html" style="width:100%;height:330px;"></iframe>
                        </div>
                        <h3>시험명 : ${param.exam_info_name}</h3>
                     
                     </div>
                    <div class="col-md-8 detailed">
                    <%-- 폼 양식 시작 --%>        
                   
                           <input type="hidden" value="${param.exam_info_name}" id="exam_info_name" name="exam_info_name"/>
                         <input type="hidden" id="exam_info_num" name="exam_info_num" value="${param.exam_info_num}"/>  
                          <input type="hidden" id="memberarray2" name="memberarray2" />
                       <c:forEach items="${classExamList}" var="classExamList">
                        <div class="form-group">
                          <label class="control-label col-md-2">날짜</label>
                            <div class="col-md-5 col-xs-11">
                             <input type="text" class="form-control form-control-inline" name="exam_info_date" id="exam_info_date"  size="16"  value="${classExamList.exam_info_date}" readonly required>
                              <span class="help-block">날짜를 선택하세요</span>
                            </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-md-2">시간</label>
                            <div class="col-md-4">
                              <div class="input-group bootstrap-timepicker">
                                <input style="z-index:0;" type="text" class="form-control timepicker-default" id="exam_info_start" name="exam_info_start" onchange="checktime()" value="${classExamList.exam_info_start}" required>
                                 <input type="hidden" value="${classExamList.exam_info_start}" id="start_time_hidden"/>
                                 <span class="input-group-btn">
                                   <button  style="z-index:0;" class="btn btn-theme04" type="button"><i class="fa fa-clock-o"></i></button>
                                </span>
                              </div>
                              <label class="control-label">부터</label>
                            </div>
                            <div class="col-md-4">
                              <div class="input-group bootstrap-timepicker">
                                <input style="z-index:0;" type="text" class="form-control timepicker-default" id="exam_info_end" name="exam_info_end" onchange="checktime()" value="${classExamList.exam_info_end}"required>
                                  <span class="input-group-btn">
                                    <button style="z-index:0;"  class="btn btn-theme04" type="button"><i class="fa fa-clock-o"></i></button>
                                  </span>
                              </div>
                              <label class="control-label">까지</label>
                            </div>
                            <div id="timeinfo"></div>
                          </div>
                        <!--timepicker group end-->
                          <div class="form-group">
                            <label class="control-label col-md-2"  style="margin-right:15px;" id="examtimelabel">시험시간</label>
                            <input style="width:20%;" id="exam_info_time" class="form-control"  type="text" name="exam_info_time"  value="${classExamList.exam_info_time}" readonly >
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-2">종료알림</label>
                              <label class="control-label col-md-5">5분</label>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-2">응시대상</label>
                              <div class="col-md-10 col-xs-11">
                                <input type="text" class="form-control" placeholder="응시대상을 입력하세요" id="exam_info_member" name="exam_info_member"  value="${classExamList.exam_info_member}" required>
                              </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-md-2">설명</label>
                              <div class="col-md-10 col-xs-10">
                                <textarea rows="3" class="form-control" placeholder="설명을 입력하세요" id="exam_info_desc" name="exam_info_desc" required>${classExamList.exam_info_desc}</textarea>
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

                        <button class="btn btn-primary btn-lg btn-block" id="examUpdateBtn">시험 일정 수정</button>
                      </div>
                   </div>
                    </c:forEach>
                     </div></div>
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

        <!-- /col-lg-12 -->

      <!-- /row -->

    <!-- /container -->
  </section>
  <!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->

<script>


function check(){
	
	/*체크박스 값 설정*/

	var memberarray = new Array();
	$("input:checkbox[name=chk]:checked").each(function(){
		memberarray.push($(this).val());
	});
    console.log("memberarray>>"+memberarray+"<<");
    
    document.getElementById("memberarray2").setAttribute('value',memberarray);
    console.log("memberarray2>>"+$('#memberarray2').val()+"<<");
    
	/*체크박스 값 설정 끝*/
	
	var date2 = $('#exam_info_date').val();
	console.log("date값>>"+date2);
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
		
	} else if($('#exam_info_date').val()==""){
		alert("날짜를 입력하세요");
		return false;
	}else if(memberarray==""){
		alert("학생을 선택하세요.");
		return false;
	}else {
		var insertconfirm = confirm("시험일정을 수정하시겠습니까?");
		if(insertconfirm == true){
			return true;
		}else{
			return false;
		}
	}
	

}
</script>