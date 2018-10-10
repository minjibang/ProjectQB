<%-- 
	@JSP:adminMember.jsp
	@DATE:2018-10-08
	@Author:유영준
	@Desc:회원 관리 페이지(스토리보드 10 of 41)
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.dataTables_length, .dataTables_info{
	display: none;
}
.dataTables_paginate, .dataTables_filter{
	display: none;
}


</style>
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12"></div>
			<!-- /col-lg-12 -->
			<div class="showback">
				<div class="row content-panel">
					<div class="panel-heading">
					<h3><span>회원 검색</span></h3>
						<!-- selectBox -->
						<select name="member_role" style="width:130px; height:30px;">
							<option value="">회원 권한 선택</option>
							<option value="student">학생</option>
							<option value="teacher">강사</option>
							<option value="member">일반회원</option>
						</select>
						<select name="class" style="width:130px; height:30px;">
							<option value="">클래스 선택</option>
							<option value="java109">자바 109기</option>
							<option value="python110">파이썬 110기</option>
							<option value="arduino111">아두이노 111기</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;또는&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="member" style="width:130px; height:30px;">
							<option value="">개인정보 선택</option>
							<option value="member_name">이름</option>
							<option value="member_id">아이디</option>
							<option value="member_email">이메일</option>
						</select>
						<div class="col-sm-2 col-xs-2 pull-right">
						<input type="text" class="form-control" placeholder="검색어를 입력">
						</div>
					</div>
					<div class="col-sm-4 col-xs-4 pull-right">
					<div class="col-sm-4 col-xs-4 pull-right">
                  <button class="btn btn-info btn-block">
                   		 검색
                  </button>
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
													<th><input type="checkbox" value="">전체 선택</th>
													<th class="class_name">클래스</th>
													<th class="member_id">아이디</th>
													<th class="member_name">이름</th>
													<th class="member_email">이메일</th>
													<th class="member_phone">핸드폰</th>
													<th class="member_enable">관리</th>
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
														<td><button class="edit-modal btn btn-info">
														<span data-toggle="modal" data-target="#UpdateModal"></span>수정</button> <!-- <a href="deptUpdateForm.htm" class="btn btn-secondary">수정</a> -->
															<button class="delete-modal btn btn-danger">
															<span data-toggle="modal" data-target="#DeleteModal"></span>삭제</button></td>
													</tr>
													</c:forEach>
													</tbody>
										</table>
										<button class="insert-member btn btn-info">선택 회원 일괄 학생 등록</button>
										<button class="delete-member btn btn-danger">선택 회원 일괄 삭제</button>
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
			<!-- /row -->
		</div>
		<!-- /container -->
	<!-- /wrapper -->
</section>
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->
