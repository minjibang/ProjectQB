<%-- 
   @JSP:examScheduleUpdate.jsp
   @DATE:2018-10-14
   @Author:양회준
   @Desc:강사-시험 일정 등록/수정(스토리보드 28 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<link
   href="${pageContext.request.contextPath}/css/examScheduleUpdate.css"
   rel="stylesheet">
 <script
   src="${pageContext.request.contextPath}/lib/onet-js/examScheduleUpdate.js"></script> 
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<section id="main-content">
  <section class="wrapper-low site-min-height">
  
    <div class="row mt">
      <div class="col-lg-12 mt">
        <div class="row content-panel">
          <div class="panel-body">
              <div id="updateExam" class="tab-pane">
                <div class="row">
                  <div class="col-md-12">
                   <form action="examInfoIUpdate.do" id="examScheduleRegistForm" class="form-horizontal style-form" method="post">         
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
                           <ul class="chat-available-user" id ="checkboxNameUl">       
                              <c:forEach items="${classMemberListUpdate}" var="classMemberListUpdate" varStatus='status'>
                           <c:forEach items="${classExamMemberList}" var="classExamMemberList">
                           <c:choose>
                           <c:when test="${classMemberListUpdate.member_id eq classExamMemberList}">               
                             <div class="checkbox" id="checkboxName">
                               <label>
                                  <input type="checkbox"  name="chk" id="chk" value="${classMemberListUpdate.member_id}" checked>(${classMemberListUpdate.member_id })${classMemberListUpdate.member_name}                           
                               </label>
                             </div>
                           </c:when>
                            </c:choose>
                           </c:forEach>
                           </c:forEach>
                             <c:forEach items="${examNotcheckMemberList}" var="examNotcheckMemberList">
                              <div class="checkbox" id="checkboxName">
                               <label>
                             <input type="checkbox"  name="chk" id="chk" value="${examNotcheckMemberList.member_id}">(${examNotcheckMemberList.member_id })${examNotcheckMemberList.member_name}        
                           </label>
                           </div>
                           </c:forEach>
                           </ul>
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
                      <se:authorize access="hasRole('ROLE_TEACHER')">
                        <button type="button" class="btn btn-second btn-lg" onclick="location.href='${pageContext.request.contextPath}/teacher/examManagement.do'">취소</button>
                        </se:authorize>
                          <se:authorize access="hasRole('ROLE_ADMIN')">
                        <button type="button" class="btn btn-second btn-lg" onclick="location.href='${pageContext.request.contextPath}/admin/examManagement.do'">취소</button>
                        </se:authorize>
                      <div class="col-md-2">
                      </div>
                      <div class="col-md-4">

                        <button class="btn btn-primary btn-lg btn-block" id="examUpdateBtn" type="button" onclick="check()">시험 일정 수정</button>
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
      	swal({
      		 title: "시험 일정을 수정하시겠습니까?",
			  icon: "info",
			  buttons: true,
			  dangerMode: true
		}).then((willDelete) => {
		  if (willDelete) {
			  
				swal({
				       title: "수정이 완료되었습니다.",
					   text: "",
					   icon:"success"
					}).then(function() {
						document.getElementById("examScheduleRegistForm").submit();
				});
		    
		  } else {
		  }
	});
   }
   

}
</script>