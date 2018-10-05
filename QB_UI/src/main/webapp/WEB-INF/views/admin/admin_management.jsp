<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<div class="col-lg-12"></div>
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
					<div class="panel-body">
						<div class="tab-content">
							<div id="overview" class="tab-pane active">
								<div class="row">
									<div class="col-md-12">
										<table id="myTable">

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
														<td class="autho">test</td>
														<td><a
															href="deptUpdateForm.htm?deptno=${n.deptno}&dname=${n.dname}&loc=${n.loc}"
															class="btn btn-secondary">수정</a> <!-- <a href="deptUpdateForm.htm" class="btn btn-secondary">수정</a> -->
															<a href="deptDelete.htm?deptno=${n.deptno}"
															class="btn btn-secondary">삭제</a></td>
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