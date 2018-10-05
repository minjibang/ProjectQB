<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12"></div>
			<!-- 모달 -->
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
												<input class=" form-control" id="cname" name="name"
													minlength="5" type="text" readonly />
											</div>
										</div>
										<div class="form-group ">
											<label for="cemail" class="control-label col-lg-2">E-Mail</label>
											<div class="col-lg-10">
												<input class="form-control " id="cemail" type="email"
													name="email" />
											</div>
										</div>
										<div class="form-group ">
											<label for="curl" class="control-label col-lg-2">핸드폰</label>
											<div class="col-lg-10">
												<input class="form-control " id="curl" type="text"
													name="url" />
											</div>
										</div>
										<div class="form-group ">
											<label for="ccomment" class="control-label col-lg-2">클래스</label>
											<div class="col-lg-10">
												<select name="classname">
													<option value="class">class1</option>
													<option value="class">class1</option>
													<option value="class">class3</option>
												</select>
											</div>
										</div>
										<div class="form-group ">
											<label for="curl" class="control-label col-lg-2">권한
												설정</label>
											<div class="col-lg-10">
												<input type="checkbox" id="agree_s" name="agree" />학생
												&nbsp;&nbsp; <input type="checkbox" id="agree_t"
													name="agree" />강사
											</div>
										</div>
										<div class="modal-footer">
											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button class="btn btn-theme" data-toggle="modal"
														data-target="#myModal2">Save</button>
													<button class="btn btn-theme04" type="button"
														data-dismiss="modal">Cancel</button>
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
						</div>
						<div class="modal-body">정말 삭제하겠습니까?</div>
						<div class="modal-footer">
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10">
									<button class="btn btn-theme" data-toggle="modal"
										data-dismiss="modal">Yes</button>
									<button class="btn btn-theme04" type="button"
										data-dismiss="modal">No</button>
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
							<li><a data-toggle="tab" href="#contact" class="contact-map">클래스
									관리</a></li>
						</ul>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body" >
						<div class="tab-content" >
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div class="col-md-10" id="AdminTableForm">
										<table id="AdminTable" >

											<thead>
												<tr>
													<th class="classname">클래스</th>
													<th class="id">아이디</th>
													<th class="name">이름</th>
													<th class="email">이메일</th>
													<th class="phone">핸드폰</th>
													<th class="autho">권한</th>
													<th class="management">관리</th>
												</tr>
											</thead>
											<tbody>

												<tr>
													<td class="classname">test</td>
													<td class="id">test</td>
													<td class="name">test</td>
													<td class="email">test</td>
													<td class="phone">test</td>
													<td class="autho">학생</td>
													<td>
														<button class="btn btn-primary btn-xs" id="updatebtn"
															data-toggle="modal" data-target="#UpdateModal">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-danger btn-xs" id="deletebtn"
															data-toggle="modal" data-target="#DeleteModal">
															<i class="fa fa-trash-o "></i>
														</button>
													</td>
												</tr>

											</tbody>
										</table>
									</div>
									<!-- /col-md-6 -->
								</div>
								<!-- /OVERVIEW -->
							</div>
							<!-- /tab-pane -->
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
															<input class="form-control" id="" type="text" />
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">교육 기간</label>
														<div class="col-md-6">
															<div class="input-group input-large"
																data-date="01/01/2014" data-date-format="mm/dd/yyyy">
																<input type="text" class="form-control dpd1" name="from">
																<span class="input-group-addon">To</span> <input
																	type="text" class="form-control dpd2" name="to">
															</div>
															<span class="help-block">Select date range</span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">강사</label>
														<div class="col-md-6 col-xs-12">
															<input class="form-control" id="" type="text" />
														</div>
													</div>
													<div class="col-md-9 col-xs-12" id="AdminUpdateBtn">
													<button class="btn btn-theme" type="button" >수정</button>
													</div>
													
												</form>


												<!--  <form class="form-horizontal  style-form" action="#">
               <div class="form-group">
                  <label class="control-label col-md-3">클래스</label>
                  <div class="col-md-4 col-xs-12">
                      <input class="form-control" id="" type="text"/>
                  </div>
                </div>
              
                <div class="form-group">
                  <label class="control-label col-md-3">교육 기간</label>
                  <div class="col-md-4">
                    <div class="input-group input-large" data-date="01/01/2014" data-date-format="mm/dd/yyyy">
                      <input type="text" class="form-control dpd1" name="from">
                      <span class="input-group-addon">To</span>
                      <input type="text" class="form-control dpd2" name="to">
                    </div>
                    <span class="help-block">Select date range</span>
                  </div>
                </div>
                
                  <div class="form-group">
                  <label class="control-label col-md-3">강사</label>
                  <div class="col-md-4 col-xs-12">
                      <input class="form-control" id="" type="text"/>
                  </div>
                </div>
              </form> -->
											</div>

										</div>
									</div>
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