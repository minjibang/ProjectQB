<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
 <section id="main-content">
      <section class="wrapper site-min-height">
        <div class="row mt">
          <div class="col-lg-12 mt">
            <div class="row content-panel">
              <div class="panel-heading">
                <ul class="nav nav-tabs nav-justified">
                  <li class="active">
                    <a data-toggle="tab" href="#personalInfo">개인정보 수정</a>
                  </li>
                  <li>
                    <a data-toggle="tab" href="#unregister" class="contact-map">회원 탈퇴</a>
                  </li>
                </ul>
              </div>
              <!-- /panel-heading -->
              <div class="panel-body">
                <div class="tab-content">
                  <div id="personalInfo" class="tab-pane active">
                    <div class="row">
                      <div class="col-lg-8 col-lg-offset-2 detailed mt">
                        <h4 class="mb">개인정보 수정</h4>
                        <form role="form" class="form-horizontal formArrayHyunyi">
                          <div class="form-group">
                            <label class="col-lg-3 control-label">아이디</label>
                            <div class="col-lg-8">
                              <input type="text" placeholder="id" class="form-control" readonly>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">비밀번호</label>
                            <div class="col-lg-8">
                              <input type="password" placeholder="password" class="form-control">
                            </div>
                          </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">비밀번호 확인</label>
                            <div class="col-lg-8">
                              <input type="password" placeholder="password" class="form-control">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">이름</label>
                            <div class="col-lg-8">
                              <input type="text" placeholder="name" class="form-control" readonly>
                            </div>
                          </div>        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">핸드폰</label>
                            <div class="col-lg-8">
                              <input type="text" placeholder="HP" id="country" class="form-control">
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-3 control-label"><p style="display: inline-block">이메일 변경</p>
                              <input type="checkbox" class="ez-checkbox" id="emailChangeChk" style="height: auto">
                            </label>
                            <div class="col-lg-6">
                                  <input type="text" placeholder="email" class="form-control inlineTextField">
                            </div>
                            <div class="col-lg-2 inlineTextFieldBtn">
                                <button class="btn btn-theme" type="button" id="emailCodeRquestBtn">인증번호 요청</button> 
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">인증번호</label>
                            <div class="col-lg-6">
                                  <input type="text" placeholder="인증번호" class="form-control inlineTextField">
                            </div>
                            <div class="col-lg-2 inlineTextFieldBtn">
                                <button class="btn btn-theme" type="button" id="emailCodeCheckBtn">인증번호 확인</button> 
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-lg-11 infoBtnDiv">
                                <button class="btn btn-theme" type="button" id="infoModifiy">정보 수정</button>
                                <button class="btn btn-theme04" type="button" id="cancel">취소</button>
                            </div>
                          </div>
                        </form>
                      </div>
                      <!-- /col-lg-8 -->
                    </div>
                    <!-- /row -->
                  </div>
                  <!-- /tab-pane -->
                    <div id="unregister" class="tab-pane">
                    <div class="row">
                      <div class="col-lg-8 col-lg-offset-2 detailed mt">
                        <h4 class="mb">회원 탈퇴</h4>
                        <form role="form" class="form-horizontal formArrayHyunyi">
                          <div class="form-group">  
                            <label class="col-lg-3 control-label">아이디</label>
                            <div class="col-lg-8">
                              <input type="text" placeholder="id" class="form-control" readonly>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-lg-3 control-label">비밀번호</label>
                            <div class="col-lg-8">
                              <input type="password" placeholder="password" class="form-control">
                            </div>
                          </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">비밀번호 확인</label>
                            <div class="col-lg-8">
                              <input type="password" placeholder="password" class="form-control">
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-lg-11 infoBtnDiv">
                                <button class="btn btn-theme" type="button" id="infoModifiy">회원 탈퇴</button>
                                <button class="btn btn-theme04" type="button" id="cancel">취소</button>
                            </div>
                          </div>
                        </form>
                      </div>
                      <!-- /col-lg-8 -->
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