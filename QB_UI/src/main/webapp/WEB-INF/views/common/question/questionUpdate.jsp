<%-- 
	@JSP:questionUpdate.jsp
	@DATE:2018-10-12
	@Author:양회준
	@Desc:내 문제 수정(스토리보드 33 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
	2018.10.12 회준 새 문제 만들기 UI 추가 
	questionManagement.jsp와 css파일 공유
--%>
<link href="${pageContext.request.contextPath}/css/questionManagement.css"
	rel="stylesheet">    
    
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="content-panel">
			<div class="panel-body">
						<div class="row">
								<div class="col-lg-12">
                  <h3 id="h3id">문제 수정</h3>
                  <hr>
                  <h4><i class="fa fa-angle-right"></i> 출제자 : 홍길동</h4>
                    <hr>
                    <div>
                    <h4 class="mb quesCategory"><i class="fa fa-angle-right"></i> 문제 분류</h4>
										<select class="form-control-static" name="">
											<option value="">대분류</option>
											<option value="">언어</option>
											<option value="">시험</option>
										</select> <select class="form-control-static"	name="">
											<option value="">중분류</option>
											<option value="">자바</option>
											<option value="">C</option>
											<option value="">C++</option>
										</select> <select class="form-control-static"	name="">
											<option value="">소분류</option>
											<option value="">변수</option>
											<option value="">배열</option>
											<option value="">객체</option>
										</select> <select class="form-control-static"	name="">
											<option value="">난이도</option>
											<option value="">기초</option>
											<option value="">기본</option>
											<option value="">심화</option>
										</select>
                  </div>
                  		<h4 class="quesCategory"><i class="fa fa-angle-right"></i> 문제 유형</h4>
												<span class="radio quesCategorybig">
													<label class="questionChoiceRadioButton">
													<input type="radio" name="optionsRadios"
													id="optionsRadios1" value="option1" checked onclick="questionType('questionChoice');">
														객관식
													</label>&nbsp;&nbsp;
													<label class="questionChoiceRadioButton">
													<input type="radio"  name="optionsRadios"
													id="optionsRadios2" value="option2" onclick="questionType('questionShortAnswer');">
														단답형
													</label>
												</span>
										<hr>
									<div class="form-group" id="questionMoonje">
                    <div class="row">
                    <div class="col-lg-6 ">
										<h4><i class="fa fa-angle-right"></i> 문제 내용 입력</h4>
										<textarea class="form-control" placeholder="문제 내용을 입력해주세요." rows="3"></textarea>
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                      <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 400px; max-height: 250px; line-height: 20px;"></div>
                      <span>
                        <span class="btn btn-theme02 btn-file">
                          <span class="fileupload-new"><i class="fa fa-paperclip"></i> image</span>
                          <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                          <input type="file" class="default" />
                        </span>
                        <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
                      </span>
                    </div>
                </div>
                <!--문제 종료-->

                <!--객관식 보기 시작-->
                <div id="questionChoice" style="display:'';" class="col-lg-6">
                  <h4><i class="fa fa-angle-right"></i> 객관식 정답 입력</h4>
                  <div class="radio" id="answerChoiceText">

                    <label class="questionChoiceRadioButton">
                    <input type="radio" name="optionsRadios" value="option1" checked>
                      1번 </label>&nbsp;&nbsp;

                    <label class="questionChoiceRadioButton">
                    <input type="radio"  name="optionsRadios" value="option2">
                      2번 </label>&nbsp;&nbsp;

                    <label class="questionChoiceRadioButton">
                    <input type="radio"  name="optionsRadios" value="option3">
                      3번 </label>&nbsp;&nbsp;

                    <label class="questionChoiceRadioButton">
                    <input type="radio"  name="optionsRadios" value="option4">
                      4번 </label>&nbsp;&nbsp;
                  </div>
                  <br>
                  <hr>
                  <h4><i class="fa fa-angle-right"></i> 객관식 보기 입력</h4>
                  <select class="form-control-static" name="">
                    <option value="">보기 개수</option>
                    <option value="">보기 1개</option>
                    <option value="">보기 2개</option>
                    <option value="">보기 3개</option>
                    <option value="">보기 4개</option>
                    <option value="">보기 5개</option>
                  </select>
                  <br><br>
                  <!-- 1번 보기 -->
                  <b>1.</b> <input type="text" class="form-control-inline" placeholder="1번 보기 내용을 입력해주세요." >
                  <span class="fileupload fileupload-new imageup" data-provides="fileupload">
                    <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
                    <span>
                      <span class="btn btn-theme02 btn-file">
                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> image</span>
                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                        <input type="file" class="default" />
                      </span>
                      <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
                    </span>
                  </span><br>
                  <!-- 2번 보기 -->
                  <b>2.</b> <input type="text" class="form-control-inline" placeholder="2번 보기 내용을 입력해주세요." >
                  <span class="fileupload fileupload-new" data-provides="fileupload">
                    <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
                    <span>
                      <span class="btn btn-theme02 btn-file">
                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> image</span>
                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                        <input type="file" class="default" />
                      </span>
                      <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
                    </span>
                  </span><br>
                  <!-- 3번 보기 -->
                  <b>3.</b> <input type="text" class="form-control-inline" placeholder="3번 보기 내용을 입력해주세요." >
                  <span class="fileupload fileupload-new" data-provides="fileupload">
                    <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
                    <span>
                      <span class="btn btn-theme02 btn-file">
                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> image</span>
                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                        <input type="file" class="default" />
                      </span>
                      <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
                    </span>
                  </span><br>
                  <!-- 4번 보기 -->
                  <b>4.</b> <input type="text" class="form-control-inline" placeholder="4번 보기 내용을 입력해주세요." >
                  <span class="fileupload fileupload-new" data-provides="fileupload">
                    <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
                    <span>
                      <span class="btn btn-theme02 btn-file">
                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> image</span>
                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                        <input type="file" class="default" />
                      </span>
                      <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
                    </span>
                  </span><br>
                  <!-- 5번 보기 -->
                  <b>5.</b> <input type="text" class="form-control-inline" placeholder="5번 보기 내용을 입력해주세요." >
                  <span class="fileupload fileupload-new" data-provides="fileupload">
                    <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 300px; max-height: 180px; line-height: 20px;"></div>
                    <span>
                      <span class="btn btn-theme02 btn-file">
                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> image</span>
                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                        <input type="file" class="default" />
                      </span>
                      <a href="" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
                    </span>
                  </span><br>
                </div>
                <!--객관식 보기 내용 입력 종료 -->

                <!--단답형 보기 시작-->
                <div id="questionShortAnswer" style="display:none;" class="col-lg-6">
                  <h4><i class="fa fa-angle-right"></i> 단답형 정답 입력</h4>
                  <!-- 1번 보기 --><input type="text" class="form-control" placeholder="정답을 입력해주세요.">
                </div>
                <!--단답형 내용 입력 종료 -->
              </div>
              <!--문제 내용, 정답, 보기 입력 grid 종료 -->
            </div>
            <!--문제 내용, 정답, 보기 입력 종료 -->
            <hr>
            <button type="button" class="btn btn-theme quesCategory">문제 수정</button>
            <button type="button" class="btn btn-theme04 pull-right quesCategory">삭제</button>
          </div>
          <!-- 문제만들기 패널 종료 -->
            <!-- /form-panel -->
            		</div>
				</div>
			</div>
		</section>
	<!-- /wrapper -->							
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->