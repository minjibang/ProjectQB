<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="${pageContext.request.contextPath}/lib/onet-js/adminClassInfo.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--main content start-->
<script
	src="${pageContext.request.contextPath}/lib/onet-js/jquery-ui.js"></script>
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12">
				<!-- 모달 -->
				
				
				<!-- UpdateModal -->
				<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">회원 정보 수정</h4>
							</div>
							<div class="modal-body">
								<!-- <div class="form-panel"> -->
								<div>
									<div class="form">
										<form class="cmxform form-horizontal style-form"
											id="commentForm" method="get" action="">
											<div class="form-group">
												<label for="cid" class="control-label col-lg-2">아이디</label>
												<div class="col-lg-10">
													<input class="form-control" id="cid" name="member_id"
														 type="text" readonly />
													<!-- col-lg-10 끝 -->
												</div>
												<!-- form-group 끝 -->
											</div>
											<div class="form-group">
												<label for="cname" class="control-label col-lg-2">이름</label>
												<div class="col-lg-10">
													<input class="form-control" id="cname" type="text"
														name="member_name" readonly/>
												</div>
											</div>
											<div class="form-group">
												<label for="cemail" class="control-label col-lg-2">이메일</label>
												<div class="col-lg-10">
													<input class="form-control" id="cemail" name="member_email" type="email" placeholder="이메일을 입력해주세요" required/>
												</div>
											</div>
											<div class="form-group">
												<label for="curl" class="control-label col-lg-2">핸드폰</label>
												<div class="col-lg-10">
													<input class="form-control" id="curl" type="text"
														name="member_phone" placeholder="번호를 입력해주세요" required/>
												</div>
											</div>
											<div class="form-group">
												<label for="cclass" class="control-label col-lg-2">클래스</label>
												<div class="col-lg-10">
												
													<select name="class_name" id="class_name" class="form-control">
													<c:forEach items="${classList}" var="classList">
														<option>${classList.class_name}</option>
														</c:forEach>
													</select>
													
												</div>
											</div>
											<div class="form-group ">
												<label for="curl" class="control-label col-lg-2">권한
													설정</label>
												<div class="col-lg-10">
													<input type="checkbox" id="agree_s" name="agree"
														onclick="oneCheckbox(this)" value="ROLE_STUDENT" />학생
													&nbsp;&nbsp; <input type="checkbox" id="agree_t"
														name="agree" onclick="oneCheckbox(this)"
														value="ROLE_TEACHER" />강사
												</div>
											</div>
											<div class="modal-footer">
												<div class="form-group">
													<div class="col-lg-offset-2 col-lg-10">
														<button class="btn btn-theme" type="button"
															id="classUpdateMemberBtn">수정</button>
														<button class="btn btn-theme04" type="button"
															data-dismiss="modal">취소</button>
													</div>
												</div>
											</div>
										</form>
										<!-- form 끝 -->
									</div>
									<!-- form-panel 끝 -->
								</div>
								<!-- modal-body 끝 -->
							</div>
							<!-- modal-content 끝 -->
						</div>
						<!-- modal-dialog 끝 -->
					</div>
					<!-- UpdateModal 끝 -->
				</div>


				<!-- DeleteModal -->
				<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">삭제 확인</h4>
							</div>
							<div class="modal-body">정말 삭제하겠습니까?</div>
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class="btn btn-theme" data-toggle="modal"
											data-dismiss="modal" id="classDeleteMemberBtn">확인</button>
										<button class="btn btn-theme04" type="button"
											data-dismiss="modal">취소</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				<!-- /col-lg-12 -->
				<div class="col-lg-12 mt">
					<div class="row content-panel">
						<div class="panel-heading">
							<ul class="nav nav-tabs nav-justified">
								<li class="active"><a data-toggle="tab" href="#overview">클래스
										구성원</a></li>
								<li><a data-toggle="tab" href="#contact"
									class="contact-map">클래스 관리</a></li>
							</ul>
						</div>
						<!-- /panel-heading -->
						<div class="panel-body">
							<div class="tab-content">
								<div id="overview" class="tab-pane active">
									<div class="row">
										<div class="col-md-12" id="AdminTableForm">
											<table id="AdminTable">
												<thead>

													<tr>
														<th class="class_name">클래스</th>
														<th class="member_id">아이디</th>
														<th class="member_name">이름</th>
														<th class="member_email">이메일</th>
														<th class="member_phone">핸드폰</th>
														<th class="role_code">권한</th>
														<th class="management">관리</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${classMemberList}" var="classMemberList">
														<tr id="tr${classMemberList.member_id}">
															<th class="class_name" id="class_name_val">${classMemberList.class_name}</th>
															
															<th class="member_id">${classMemberList.member_id}</th>

															<th class="member_name">${classMemberList.member_name}</th>
															<th class="member_email">${classMemberList.member_email}</th>
															<th class="member_phone">${classMemberList.member_phone}</th>
															<td class="role_code">${classMemberList.role_desc}</td>
															<td>
																<button type="button" class="btn btn-info"
																	id="updatebtn" name="updatebtn" data-toggle="modal"
																	data-target="#UpdateModal"
																	value="${classMemberList.member_id}">

																	<i class="fa fa-pencil"> </i>
																</button>

																<button type="button" class="btn btn-danger"
																	id="deletebtn" data-toggle="modal" name="deletebtn"
																	data-target="#DeleteModal"
																	value="${classMemberList.member_id}">
																	<i class="fa fa-trash-o"></i>
																</button>
																<input type="hidden" id="hidden_class_num2" value='${param.class_num}'>

															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- /col-md-6 -->
									</div>
									<!-- /OVERVIEW -->
								</div>
								<!-- /tab-pane -->
								<c:forEach items="${classlist}" var="classlist">
								<div id="contact" class="tab-pane">
									<div class="row">
										<div class="col-md-612">
											<div class="row mt">


												<div class="col-lg-8 col-lg-offset-2 detailed mt">
													<h4 class="mb">클래스 수정</h4>
												
													<form role="form" class="form-horizontal"
														id="class_update_form">
														
														<div class="form-group">
															<label class="control-label col-md-3">클래스</label>
															<div class="col-md-6">
																<input class="form-control" id="updatetab_class_name"  type="text" value='${classlist.class_name}' onblur="confirmName()" required/>
																<input id="hiddenName" value="${classlist.class_name}" type="hidden"/>
																<div id="namediv"></div>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3">교육 기간</label>
															<div class="col-md-6">
																<div class="input-group input-large"
																	data-date="01/01/2014" data-date-format="mm-dd-yyyy">
																	<input type="text" class="form-control dpd1"
																		name="from" id="from" value='${classlist.class_start_date}' required/> <span class="input-group-addon">To</span>
																	<input type="text" class="form-control dpd2" name="to" id="to" value='${classlist.class_end_date}' required/>
																
																</div>
																
															<%-- 	<div class="input-group input-large">
															<input type="text" class="form-control dpd1" name="from" id="from" value='${classlist.class_start_date}' required>
															<span class="input-group-addon"> 에서 </span> 
															<input type="text" class="form-control dpd2" name="to" id="to" value='${classlist.class_end_date}' required>
																
														</div> --%>
																<span class="help-block">Select date range</span>
															</div>
														</div>
														<div class="form-group">
															<label class="control-label col-md-3">강사</label>
															<div class="col-md-6 col-xs-12">
																<input class="form-control" id="teacher_name" type="text" value='${classlist.teacher_name}' required/>
															</div>
														</div>
														<div class="col-md-9 col-xs-12" id="AdminUpdateBtn" >
															<button class="btn btn-theme" type="button" id="classUpdateBtn">수정</button>
															</div>
															<input type="hidden" id="hidden_class_num" value='${param.class_num}'>
														

													</form>
													</div>
												</div>

											</div>
										</div>
									</div>
									<!-- /row -->
								</c:forEach>
								</div>
								

							</div>
							<!-- /tab-content -->
						</div>
						<!-- /panel-body -->
					</div>
					<!-- /col-lg-12 -->
				</div>
				<!-- /row -->
			</div>
		</div>
		<!-- /container -->
	</section>
	<!-- /wrapper -->
</section>



<!-- /MAIN CONTENT -->
<!--main content end-->