<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

</script>
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12"></div>
			<!-- /col-lg-12 -->
			<div class="col-lg-12 mt">
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
				
					</div>
					
					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div class="col-md-12">
										<table id="myTable">

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
												
													<tr>
														<td class="classname">자바 109기</td>
														<td class="id">af1982</td>
														<td class="name">김샘플</td>
														<td class="email">a@a.com</td>
														<td class="phone">010-1111-1111</td>
														<td class="autho">일반회원</td>
														<td><button class="edit-modal btn btn-info">
														<span class="glyphicon glyphicon-edit"></span>수정</button> <!-- <a href="deptUpdateForm.htm" class="btn btn-secondary">수정</a> -->
															<button class="delete-modal btn btn-danger">
															<span class="glyphicon glyphicon-trash"></span>삭제</button></td>
													</tr>
													<tr>
														<td class="classname">자바 109기</td>
														<td class="id">slei1</td>
														<td class="name">이샘플</td>
														<td class="email">b@b.com</td>
														<td class="phone">010-2222-2222</td>
														<td class="autho">일반회원</td>
														<td><button class="edit-modal btn btn-info">
														<span class="glyphicon glyphicon-edit"></span>수정</button> <!-- <a href="deptUpdateForm.htm" class="btn btn-secondary">수정</a> -->
															<button class="delete-modal btn btn-danger">
															<span class="glyphicon glyphicon-trash"></span>삭제</button></td>
													</tr>
													<tr>
														<td class="classname">아두이노 111기</td>
														<td class="id">ekkuying</td>
														<td class="name">박샘플</td>
														<td class="email">c@c.com</td>
														<td class="phone">010-3333-3333</td>
														<td class="autho">학생</td>
														<td><button class="edit-modal btn btn-info">
														<span class="glyphicon glyphicon-edit"></span>수정</button> <!-- <a href="deptUpdateForm.htm" class="btn btn-secondary">수정</a> -->
															<button class="delete-modal btn btn-danger">
															<span class="glyphicon glyphicon-trash"></span>삭제</button></td>
													</tr>
											
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
	</section>
	<!-- /wrapper -->
</section>
<!-- /MAIN CONTENT -->
<!--main content end-->