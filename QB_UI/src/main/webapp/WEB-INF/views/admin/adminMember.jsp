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
														minlength="5" type="text" readonly />
													<!-- col-lg-10 끝 -->
												</div>
												<!-- form-group 끝 -->
											</div>
											<div class="form-group">
												<label for="cname" class="control-label col-lg-2">이름</label>
												<div class="col-lg-10">
													<input class="form-control" id="cname" type="text"
														name="member_name" />
												</div>
											</div>
											<div class="form-group">
												<label for="cemail" class="control-label col-lg-2">이메일</label>
												<div class="col-lg-10">
													<input class="form-control" id="cemail" type="email"
														name="member_email" />
												</div>
											</div>
											<div class="form-group">
												<label for="curl" class="control-label col-lg-2">핸드폰</label>
												<div class="col-lg-10">
													<input class="form-control" id="curl" type="text"
														name="member_phone" />
												</div>
											</div>
											<div class="form-group">
												<label for="cclass" class="control-label col-lg-2">클래스</label>
												<div class="col-lg-10">
													<select name="classname" class="form-control">
														<option value="class">java 109</option>
														<option value="class">window 108</option>
														<option value="class">class3</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="curl" class="control-label col-lg-2">권한
													설정</label>
												<div class="col-lg-10">
													<p>
														<input type="checkbox" id="role_student"
															name="role_student" />&nbsp;&nbsp;학생
													</p>
													<p>
														<input type="checkbox" id="role_teacher"
															name="role_teacher" />&nbsp;&nbsp;강사
													</p>
												</div>
											</div>
											<div class="modal-footer">
												<div class="form-group">
													<div class="col-lg-offset-2 col-lg-10">
														<button class="btn btn-theme" data-toggle="modal"
															data-target="">정보 수정</button>
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
				
				
				<!-- <div class="showback"> -->
				<div class="row content-panel">
					<div class="panel-heading">
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">
								<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;회원 관리
							</h4>
						</header>
						<div class="row memberSearchBtnDiv">
							<!-- selectBox -->
							<select id="" name="member_role" class="form-control adminMemberSelect">
								<option value="">회원 권한 선택</option>
								<option value="student">학생</option>
								<option value="teacher">강사</option>
								<option value="member">일반회원</option>
							</select> 
							<select id="" name="class" class="form-control adminMemberSelect">
								<option value="">클래스 선택</option>
								<option value="java109">자바 109기</option>
								<option value="python110">파이썬 110기</option>
								<option value="arduino111">아두이노 111기</option>
							</select>
							
							<select id="" name="member" class="form-control adminMemberSelect">
								<option value="">개인정보 선택</option>
								<option value="member_name">이름</option>
								<option value="member_id">아이디</option>
								<option value="member_email">이메일</option>
							</select>
							<input type="text" class="form-control memberSearchTextSize" placeholder="검색어를 입력">
							<button class="btn btn-info btn-theme" id="memberSearchBtn">검색</button>
								
						</div>
					</div>
					

					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
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
																id="updatebtn" data-toggle="modal"
																data-target="#UpdateModal">
																<i class="fa fa-pencil"> </i>
															</button>
															<button type="button" class="btn btn-danger"
																id="deletebtn" data-toggle="modal"
																data-target="#DeleteModal">
																<i class="fa fa-trash-o"></i>
															</button></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div id="adminMemberBtnDiv">
											<button class="insert-member btn btn-theme">선택 회원 일괄
											학생 등록</button>
											<button class="delete-member btn btn-theme04">선택 회원
											일괄 삭제</button>
										</div>
									</div>
									<!-- /col-md-6 -->
								</div>
								<!-- /OVERVIEW -->
							</div>
							<!-- /tab-pane -->
							<div id="contact" class="tab-pane">
								<div class="row">
									<div class="col-md-6">
										<div id="map"></div>
									</div>
									<!-- /col-md-6 -->
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
									<!-- /col-md-6 -->
								</div>
								<!-- /row -->
							</div>

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


