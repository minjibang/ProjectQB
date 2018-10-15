<%-- 
	@JSP:adminMember.jsp
	@DATE:2018-10-10
	@Author:유영준
	@Desc:회원 관리 페이지(스토리보드 10 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/adminMember.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/lib/onet-js/adminMember.js"></script>
<!-- main content start -->
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<!-- /col-lg-12 -->

				<!-- 모달창 -->
				<!-- UpdateModal -->
				<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">정보 수정</h4>
						</div>
						<div class="modal-body">
							<div class="form-panel">
								<div class=" form">
									<form class="cmxform form-horizontal style-form"
										id="commentForm" method="get" action="">
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-2">ID</label>
											<div class="col-lg-10">
											
											<input class="form-control" type="text"  name="member_id" maxlength="10" value="" readonly  id="member_id">
												
											</div>
										</div>
										<div class="form-group ">
											<label for="cname" class="control-label col-lg-2">이름</label>
											<div class="col-lg-10">
											
											<input class="form-control" type="text"  name="member_name" maxlength="10" value="" readonly  id="member_name">
												
											</div>
										</div>
										<div class="form-group ">
											<label for="cemail" class="control-label col-lg-2">E-Mail</label>
											<div class="col-lg-10">
												<input class="form-control" type="email"  name="member_email" maxlength="30" value="" id="member_email">
											</div>
										</div>
										<div class="form-group ">
											<label for="curl" class="control-label col-lg-2">핸드폰</label>
											<div class="col-lg-10">
												<input class="form-control" type="text"  name="member_phone" maxlength="15" value=""id="member_phone" >
											</div>
										</div>
										<div class="form-group ">
											<label for="ccomment" class="control-label col-lg-2">클래스</label>
												<div class="col-sm-4 col-xs-4 pull-left">
												<c:if test="${!empty classList}" >
													<select class="form-control" id="class_name">
													 <c:forEach var="classList" items="${classList}" varStatus="i">
														<option value="${classList.class_name}">${classList.class_name}</option>
													</c:forEach>
													</select>
												</c:if>
												</div>
											</div>
										<div class="form-group ">
											<label for="curl" class="control-label col-lg-2">권한
												설정</label>
											<div class="col-lg-10">
												<input type="checkbox" id="agree_s" name="agree" onclick="oneCheckbox(this)" value="ROLE_STUDENT"/>학생
												&nbsp;&nbsp; 
												<input type="checkbox" id="agree_t"
													name="agree" onclick="oneCheckbox(this)"  value="ROLE_TEACHER"/>강사
											</div>
										</div>
										<div class="modal-footer">
											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button class="btn btn-theme" type="button" id="updateMemberBtn">수정</button>
													<button class="btn btn-theme04" type="button"
														data-dismiss="modal">취소</button>
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
				<!-- DeleteModal -->
				<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">삭제 확인</h4>
								<!-- modal-header 끝 -->
							</div>
							<div class="modal-body">정말 삭제하시겠습니까?</div>
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class="btn btn-theme" data-toggle="modal"
											data-dismiss="modal">예</button>
										<button class="btn btn-theme04" type="button"
											data-dismiss="modal">아니오</button>
									</div>
								</div>
							</div>
							<!-- modal-content 끝 -->
						</div>
						<!-- modal-dialog 끝 -->
					</div>
					<!-- DeleteModal 끝 -->
				</div>
				
				<!-- 선택 회원 일괄 학생등록 Modal 시작 -->
				<div class="modal fade" id="InsertMemberModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">등록 확인</h4>
								<!-- modal-header 끝 -->
							</div>
							<div class="modal-body">정말 등록하시겠습니까?</div>
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class="btn btn-theme" data-toggle="modal"
											data-dismiss="modal">예</button>
										<button class="btn btn-theme04" type="button"
											data-dismiss="modal">아니오</button>
									</div>
								</div>
							</div>
							<!-- modal-content 끝 -->
						</div>
						<!-- modal-dialog 끝 -->
					</div>
					<!-- 선택 회원 일괄 학생등록 Modal 끝 -->
				</div>
				
				<!-- 선택 회원 일괄 삭제 Modal 시작 -->
				<div class="modal fade" id="DeleteMemberModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">삭제 확인</h4>
								<!-- modal-header 끝 -->
							</div>
							<div class="modal-body">정말 삭제하시겠습니까?</div>
							<div class="modal-footer">
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class="btn btn-theme" data-toggle="modal"
											data-dismiss="modal">예</button>
										<button class="btn btn-theme04" type="button"
											data-dismiss="modal">아니오</button>
									</div>
								</div>
							</div>
							<!-- modal-content 끝 -->
						</div>
						<!-- modal-dialog 끝 -->
					</div>
					<!-- 선택 회원 일괄 삭제 Modal 끝 -->
				</div>
				
				<!-- <div class="showback"> -->
				<div class="row content-panel">
					<div class="panel-heading">
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">
								<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;회원 관리
							</h4>
						</header>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body">
						<!-- <div class="tab-content"> -->
							<div class="row searchRowDiv">
							<!-- selectBox -->
							<select id="member_role" name="member_role" class="form-control searchControl">
								<option value="${role_code}">회원 권한 선택</option>
								<option value="${role_student}">학생</option>
								<option value="${role_teacher}">강사</option>
								<option value="${role_member}">일반회원</option>
							</select> 
							<select id="class_name" name="class_name" class="form-control searchControl">
								<option value="">클래스 선택</option>
								<option value="${class_name}">java 109</option>
								<option value="${class_name}">window 108</option>
								<option value="${class_name}">no_class</option>
						
							</select>
							
							<select id="member" name="member" class="form-control searchControl">
								<option value="">개인정보 선택</option>
								<option value="${member_name}">이름</option>
								<option value="${member_id}">아이디</option>
								<option value="${member_email}">이메일</option>
							</select>
							<input type="text" class="form-control searchControl" placeholder="검색어를 입력">
							<button class="btn btn-info btn-theme" id="memberSearchBtn">검색</button>
						</div>
								<div class="row">
									<div id="div_adminMember" class="col-md-12">
										<table id="adminMember_table" class="display">

											<thead>

												<tr>
													<th><input type="checkbox" id="checkall">&nbsp;&nbsp;전체 선택</th>
													<th class="class_name">클래스</th>
													<th class="member_id">아이디</th>
													<th class="member_name">이름</th>
													<th class="member_email">이메일</th>
													<th class="member_phone">핸드폰</th>
													<th class="member_enable">관리</th>
													<th class="member_enable">수정&삭제</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${memberList}" var="memberList">
													<tr>
														<td><input type="checkbox" name="chk"></td>
														<td class="class_name">${memberList.class_name}</td>
														<td class="member_id">${memberList.member_id}</td>
														<td class="member_name">${memberList.member_name}</td>
														<td class="member_email">${memberList.member_email}</td>
														<td class="member_phone">${memberList.member_phone}</td>
														<td class="member_enable">${memberList.member_enable}</td>
														<td><button type="button" class="btn btn-info"
																id="updatebtn" name="updatebtn" data-toggle="modal"
																data-target="#UpdateModal" value="${memberList.member_id}">
																<i class="fa fa-pencil"> </i>
															</button>
															<button type="button" class="btn btn-danger"
																id="deletebtn" name="deletebtn" data-toggle="modal"
																data-target="#DeleteModal" value="${memberList.member_id}">
																<i class="fa fa-trash-o"></i>
															</button></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div id="adminMemberBtnDiv">
											
											<button class="insert-member btn btn-theme"
													id="insertbtn" data-toggle="modal"
													data-target="#InsertMemberModal">선택 회원 일괄
											학생 등록</button>
											<button type="button" class="delete-member btn btn-theme04"
													id="deletebtn" data-toggle="modal" 
													data-target="#DeleteMemberModal">선택 회원 일괄 삭제</button>
										</div>
									</div>
									<!-- /col-md-6 -->
								</div>
								<!-- /OVERVIEW -->
							<!-- </div> -->
							<!-- /tab-pane -->
							<!-- <div id="contact" class="tab-pane">
								<div class="row">
									<div class="col-md-6">
										<div id="map"></div>
									</div>
									/col-md-6
									<div class="col-md-6 detailed">
										<h4>Location</h4>
										<div class="col-md-8 col-md-offset-2 mt">
											<p>
												Postal Address<br /> PO BOX 12988, Sutter Ave<br />
												Brownsville, New York.
											</p>
											<br>
											<p>
												Headquarters<br /> 844 Sutter Ave,<br /> 9003, New York.
											</p>
										</div>
										<h4>Contacts</h4>
										<div class="col-md-8 col-md-offset-2 mt">
											<p>
												Phone: +33 4898-4303<br /> Cell: 48 4389-4393<br />
											</p>
											<br>
											<p>
												Email: hello@dashiotheme.com<br /> Skype: UseDashio<br />
												Website: http://Alvarez.is
											</p>
										</div>
									</div>
									/col-md-6
								</div>
								/row
							</div> -->

						</div>
						<!-- /tab-content -->
					</div>
					<!-- /panel-body -->
				</div>
				<!-- /col-lg-12 -->
			</div>
			<!-- </div> -->
			<!-- /row -->
		</div>
		<!-- /container -->
		<!-- /wrapper -->
	</section>
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->


