<%-- 
   @JSP:examPaperMake.jsp
   @DATE:2018-10-11
   @Author:김현이
   @Desc:강사-시험지 생성 페이지(스토리보드 24 of 41) --> 시험관리 탭에서 하나의 페이지로 따로 빼냈음
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="${pageContext.request.contextPath}/css/examPaperMake.css"
   rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<section id="main-content">
   <section class="wrapper">
      <div class="row mt">
         <div class="col-lg-12">
            <div class="row content-panel">
               <div class="panel-body">
                  <div class="row">
                     <div class="col-lg-6">
                        <h3>문항 검색</h3>
                        <input type="hidden" class="dpn1" value="${memberDto.member_id}" />
                        <input type="hidden" class="dpn_EPN" value="${pageContext.request.contextPath}" />
                        <div class="makeExamFirstRow">
                           <hr>
                           <select class="form-control makeExamSelectCategory" name="question_lg_category" id="question_lg_category">
                                 <option value="">대분류</option>
                              <c:forEach items="${list1}" var="lgCategoryList">
                                 <option value="${lgCategoryList.lg_category_code}">${lgCategoryList.lg_category_name}</option>
                              </c:forEach>
                           </select> 
                           <select class="form-control makeExamSelectCategory" name="question_md_category" id="question_md_category">
                                 <option value="">중분류</option>
                           </select> 
                           <select class="form-control makeExamSelectCategory" name="question_sm_category" id="question_sm_category">
                                 <option value="">소분류</option>
                           </select> 
                           <select class="form-control makeExamSelectCategory" name="level_type" id="level_type">
                              <option value="">난이도</option>
                              <c:forEach items="${levellist}" var="levellist">
                                 <option value="${levellist.level_code}">${levellist.level_name}</option>
                              </c:forEach>
                           </select> <select class="form-control makeExamSelectCategory" id="questiontype" name="questionType">
                              <option value="">문제타입</option>
                              <option value="">전체</option>
                              <option value="객관식">객관식</option>
                              <option value="단답형">단답형</option>
                           </select> <br> <input type="text"
                              class="form-control makeExamTextField"
                              placeholder="키워드를 입력하세요." id="keyword" name="keyword"> <input type="button"
                              class="btn btn-theme" value="검색" id="questionsearch">
                        </div>
                        <hr>
                     </div>
                     <div class="col-lg-6">
                        <h3>시험 출제 문항</h3>
                        <div class="makeExamFirstRow">
                           <hr>
                           <div id="makeExamFirstRowText">
                           <c:set var="sum" value="0"/>
                           <c:forEach items="${examquestion}" var="examquestion">
                           	<c:set var="sum" value="${sum + examquestion.exam_question_score }"/>
                           </c:forEach>
                              <div> 출제된 문항 수 : <span id="qnum">${fn:length(examquestion)}</span></div><br><div> 현재 총 배점 : <span id="qcore"><c:out value="${sum }"/></span> / 100 </div>
                           </div>
                        </div>
                        <hr>
                     </div>

                  </div>
                  <!-- div 윗 줄의 문항검색 부분  -->

					<!-- 화면의 왼쪽, 시험 출제 문항 부분이다  -->
                  <div class="row">
                     <div class="col-lg-6" id="leftMakeExamDiv">
                        <form aciton="" method="post" id="pickQuestionForm" onsubmit="return false;">
                           
                           
                           <!-- 문제 하나의 div 시작  -->
                           <div id="questions">
							
                           </div>
                           
                           
                        </form>
                     </div>

                     <!-- 화면의 오른 쪽, 시험 출제 문항 부분이다  -->
                     <div class="col-lg-6" id="rightMakeExamDiv">
                        <!--  시험문제 배치 드래그 앤 드롭-->
                        <form aciton="" method="post" id="makeExamForm">
                           <div class="task-content">
                              <ul id="sortable" class="task-list selectedBox">
                              <c:forEach items="${examquestion}" var="examquestion">
								<li>
								<div class='row'>
								
									<div class="col-lg-1 qnumdiv">
										 <input type="checkbox" value="${examquestion.question_num }"
											name="checkbox[]" id="question_num"/> aaa
										<!-- value에 문제고유번호 들어간다 -->
									</div>
									<div class="col-lg-3">
										${examquestion.md_category_name}<br> ${examquestion.sm_category_name }<br>
										난이도: ${examquestion.level_name}<br> 정답:
										${examquestion.question_answer }<br>
										정답률:${examquestion.question_correct_ratio}%<br> 출제자:
										${examquestion.member_id }<br>
									</div>
									<div class="col-lg-8" id="questiontitle">
										<b>${examquestion.question_name }</b><br> <br>
										<div class="questionImgDiv">
											<c:if test="${examquestion.question_img  ne null }">
												<img
													src="${pageContext.request.contextPath}/img/${examquestion.question_img }"
													alt="questionImg" class="questionImg" />
												<!-- 문제에 이미지가 있다면 questionImgDiv 밑에 추가 -->
											</c:if>
										</div>
										<br>
										<div>
											<c:forEach items="${examquestion_choice}" var="examquestion_choice">
												<c:if
													test="${examquestion_choice.question_num eq examquestion.question_num}">
													<p>${examquestion_choice.question_choice_num}.${examquestion_choice.question_choice_content}</p>
												</c:if>
											</c:forEach>
										</div>
									</div>
									<hr>
									<div class="col-lg-12 qscore">배점:&nbsp; 
										<input type="number" class="form-control questionScoreInputTag" id="insertedQScore" name="quantity" value="${examquestion.exam_question_score }" min="1" max="20" onchange="plusqcore()"/>
										<hr>
									</div>
								</div>
								
								</li>	
							  </c:forEach>
                              </ul>
                           </div>
                        </form>
                     </div>
                  </div>
                  <!-- div class="row" 끝 -->
                  <div class="row questionRowBtnDiv">
                     <div class="col-lg-6 pickQuestionBtnDiv">
                        <input type="button" class="btn btn-theme" value="선택출제"
                           id="pickQuestionBtn">
                     </div>
                     <div class="col-lg-6 makeExamBtnDiv">
                        <input type="button" class="btn btn-theme04" value="선택문제 삭제"
                           id="pickQuestionDeleteBtn">
                           
                           <input type="hidden" id="copyTempSave" value="">
                        <!-- 한결 - 10.10 시험지 미리보기 페이지 추가-->
                        <button class="btn btn-theme" data-target="#exam_preview"
                           data-toggle="modal" id="miriBtn">시험지 미리보기</button>
                        <div id="exam_preview" class="modal fade modal_preview">
                           <div class="modal-dialog" style="width: 70%;">
                              <!-- 임시 데이터  실제 데이터는 백그라운드에서 가져와 스크립트부분에서 append방식.-->
                              <div class="row mt">
                                 <div class="col-lg-12">
                                    <div class="">
                                       <div class="row content-panel">
                                          <div id="timerblock">
                                             <h3 class="mb exampaneldetailsubject">
                                                <i class="fa fa-angle-right"></i> 비트캠프109기-JAVA기본
                                             </h3>

                                          </div>

                                          <hr>
                                          
                                          
                                          <!-- 미리보기  -->
                                          <div class="panel-body">
                                             <div class="row content-panel exampaneldetailed">
                                                <div class="col-lg-6" id="examBox"
                                                   style="border-right: 1px solid black;">
                                                   
                                                   <div id="mirileft" style="text-align: left; padding-top: 10px;">
                                                      
                                                   </div>
                                                </div>
                                                <div class="col-lg-6">
                                                   <div id="miriright" style="text-align: left;">
                                                      
                                                   </div>
                                                   
                                                </div>

                                             </div>
                                             <button
                                                class="btn btn-large btn-primary exampaneldetailBtn"
                                                data-dismiss="modal">확인</button>
                                          </div>
                                          
                                          <!-- 미리보기  끝 -->
                                          
                                          
                                       </div>
                                    </div>
                                 </div>

                              </div>

                           </div>
                        </div>
                        <input type="button" class="btn btn-theme" value="시험지 수정"
                        id="makeExamSubmitModalBtn">
                     </div>
                  </div>
                  <!-- 모달창 -->
                  <!-- 시험지 수정 모달 -->
                  <div class="modal fade" id="makeExamSubmitModal" tabindex="-1"
                     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                     <div class="modal-dialog">
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-hidden="true">&times;</button>
                              <h4 class="modal-title" id="myModalLabel">시험지 생성</h4>
                              <input type="hidden" id="createEP" value="1"/>
                           </div>
                           <form action="" method="post">
                              <div class="modal-body">

                                 시험지 이름 <input type="text" class="form-control createEPaper"
                                    placeholder="시험지 이름을 입력하세요." id="exam_name" value="${exam_paper_name}-(수정)"><br> 시험지
                                 설명
                                 <textarea type="textarea" class="form-control createEPDesc"
                                    placeholder="시험지 설명을 입력하세요." id="exam_desc">${exam_paper_desc }</textarea>
                              </div>
                              <div class="modal-footer">
                                 <div class="form-group">
                                    <div class="col-lg-offset-2 col-lg-10">
                                          <input type="button" class="btn btn-theme" value="시험지 수정"
                                          onclick="updateExamBtn(${param.exam_paper_num })">
                                          <input type="button"
                                          class="btn btn-theme04" data-dismiss="modal" value="취소">
                                    </div>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- /wrapper -->
</section>
   <!-- /wrapper -->

<script>
$(document).ready(function(){
	
	$.ajax({
		url : "questionListView.do",
		type:'GET',
		dataType:"html",
		success:function(data){
			$('#questions').html(data);
		},
		error : function(error) {
			console.log("===========실패");
		}
	});
   $('#question_lg_category').change(function(){
      $('#question_md_category').children('option:not(:first)').remove();
      $('#question_sm_category').children('option:not(:first)').remove();
      <c:forEach items="${list2}" var="mdlist">
      if(document.getElementById("question_lg_category").value == "${mdlist.lg_category_code}"){
         $('#question_md_category').append("<option value=${mdlist.md_category_code}><div class='dpn' style='display:none;' value='${mdlist.lg_category_code}'></div>${mdlist.md_category_name}</option>")
      }
      </c:forEach>
   });
   
   $('#question_md_category').change(function(){
      $('#question_sm_category').children('option:not(:first)').remove();
      <c:forEach items="${list3}" var="smlist">
      if(document.getElementById("question_md_category").value == "${smlist.md_category_code}"){
         $('#question_sm_category').append("<option value=${smlist.sm_category_code}>${smlist.sm_category_name}</option>")
      }
      </c:forEach>
   });
   $('#questionsearch').click(function(){
	   var lgsearchtype = document.getElementById("question_lg_category").value;
	   var mdsearchtype = document.getElementById("question_md_category").value;
	   var smsearchtype = document.getElementById("question_sm_category").value;
	   var leveltype = document.getElementById("level_type").value;
	   var questiontype = document.getElementById("questiontype").value;
	   var keyword = $("#keyword").val();
	   
	   console.log(keyword);
	   
		$.ajax({
			  url : "questionSearch.do",
			  type:'GET',
			  data : {
				  'lgsearchtype' : lgsearchtype,
				  'mdsearchtype' : mdsearchtype,
				  'smsearchtype' : smsearchtype,
				  'leveltype' : leveltype,
				  'questiontype' : questiontype,
				  'keyword' : keyword
			  },
			  dataType:"html",
			  success:function(data){
				  $('#questions').html(data);
			  }
		   });
   });
})

</script>

<!-- /MAIN CONTENT -->
<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
<script src="${pageContext.request.contextPath}/lib/tasks.js"
   type="text/javascript"></script>
<script
   src="${pageContext.request.contextPath}/lib/onet-js/examPaperMake.js"
   type="text/javascript"></script>
   <script
   src="${pageContext.request.contextPath}/lib/onet-js/examPaperUpdate.js"
   type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script> <!-- layout.jsp 에서 cdn으로 걸은 jquery-3.3.1가 안 먹혀서 다시 걸음 -->