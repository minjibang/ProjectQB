
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">
			<!-- /col-lg-12 -->
			<div class="col-lg-12 mt">
				<div class="row content-panel">
					<div class="panel-heading">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a data-toggle="tab" href="#overview">받은
									쪽지</a></li>
							<li><a data-toggle="tab" href="#contact" class="contact-map">새
									쪽지</a></li>
						</ul>
					</div>
					<!-- /panel-heading -->
					<div class="panel-body">
						<div class="tab-content" >
							<div id="overview" class="tab-pane active">
								<div class="row">
									<section>
										<!-- page start-->

										<div class="col-sm-12">
											<div class="panel-body minimal" id="messageTable">
												<div class="mail-option">
													<div class="chk-all">
														<div class="pull-left mail-checkbox">
															<input type="checkbox" class="">
														</div>
														<div class="btn-group">
															<a data-toggle="dropdown" href="#" class="btn mini all">
																All <i class="fa fa-angle-down "></i>
															</a>
															<ul class="dropdown-menu">
																<li><a href="#"> None</a></li>
																<li><a href="#"> Read</a></li>
																<li><a href="#"> Unread</a></li>
															</ul>
														</div>
													</div>

													<div class="btn-group">
														<a data-toggle="dropdown" href="#" class="btn mini blue">
															Move to <i class="fa fa-angle-down "></i>
														</a>
														<ul class="dropdown-menu">
															<li><a href="#"><i class="fa fa-trash-o"></i>
																	Delete</a></li>
														</ul>
													</div>
													<ul class="unstyled inbox-pagination">
														<li><a class="np-btn" href="#"><i
																class="fa fa-angle-left  pagination-left"></i></a></li>
														<li><a class="np-btn" href="#"><i
																class="fa fa-angle-right pagination-right"></i></a></li>
													</ul>
												</div>
												<div class="table-inbox-wrap ">
													<div class="accordion" id="accordion2">
														<div class="accordion-group">
															<table class="table table-inbox table-hover">

																<tbody>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message "><a
																			href="mail_view.html">Google Inc.</a></td>
																		<td class="view-message "><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Your new
																				account is ready.</a></td>
																		<td class="view-message  inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message  text-right">08:10 AM</td>
																	</tr>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Mark Thompson</a></td>
																		<td class="view-message"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Last project
																				updates</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 15</td>
																	</tr>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Wonder Corp.</a></td>
																		<td class="view-message"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Thanks for
																				your registration</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 15</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show"><a
																			href="mail_view.html">Facebook</a></td>
																		<td class="view-message"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">New
																				Friendship Request</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 13</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Mark Webber</a></td>
																		<td class="view-message"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">The server is
																				down</a></td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 09</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Facebook</a></td>
																		<td class="view-message"><a
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">New message
																				from Patrick S.</a></td>
																		<td class="view-message inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message text-right">March 08</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star inbox-started"></i></td>
																		<td class="view-message dont-show">Paypal inc.</td>
																		<td class="view-message" class="accordion-toggle"
																			data-toggle="collapse" data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">New payment
																			received</td>
																		<td class="view-message inbox-small-cells"><i
																			class="fa fa-paperclip"></i></td>
																		<td class="view-message text-right">March 04</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">Andrea</td>
																		<td class="view-message view-message"
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Weekend
																			plans</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">March 04</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">David Green</td>
																		<td class="view-message view-message"
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Soccer
																			tickets</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">February 22</td>
																	</tr>
																	<tr class="">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="inbox-small-cells"><i
																			class="fa fa-star"></i></td>
																		<td class="view-message dont-show">Evelyn</td>
																		<td class="view-message view-message"
																			class="accordion-toggle" data-toggle="collapse"
																			data-parent="#accordion2"
																			href="adminMessage.jsp#collapseOne">Surprise
																			party</td>
																		<td class="view-message inbox-small-cells"></td>
																		<td class="view-message text-right">February 19</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>


											</div>
										</div>
									</section>


									<!-- /wrapper -->
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
														<button class="btn btn-theme" type="button"
															data-toggle="modal" data-target="#ClassUpdateModal">수정</button>
													</div>

												</form>
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
		</div>
		<div id="collapseOne" class="accordion-body collapse in">
			<div class="accordion-inner">
				<div class="row mt">
					<!-- /col-lg-12 -->
					<div class="col-lg-12 mt">
						<section class="panel">
							<div class="panel-body ">
								<div class="mail-sender">
									<div class="row">
										<div class="col-md-8">
											<img src="img/ui-zac.jpg" alt=""> <strong>Zac
												Doe</strong> <span>[zac@youremail.com]</span> to <strong>me</strong>
										</div>
										<div class="col-md-4">
											<p class="date">10:15AM 02 FEB 2014</p>
										</div>
									</div>
								</div>
								<div class="view-mail">
									<p>As he bent his head in his most courtly manner, there
										was a secrecy in his smiling face, and he conveyed an air of
										mystery to those words, which struck the eyes and ears of his
										nephew forcibly. At the same time, the thin straight lines of
										the setting of the eyes, and the thin straight lips, and the
										markings in the nose, curved with a sarcasm that looked
										handsomely diabolic.</p>
									<p>"Yes," repeated the Marquis. "A Doctor with a daughter.
										Yes. So commences the new philosophy! You are fatigued. Good
										night!"</p>
									<p>It would have been of as much avail to interrogate any
										stone face outside the chateau as to interrogate that face of
										his. The nephew looked at him, in vain, in passing on to the
										door.</p>
									<p>"Good night!" said the uncle. "I look to the pleasure of
										seeing you again in the morning. Good repose! Light Monsieur
										my nephew to his chamber there!--And burn Monsieur my nephew
										in his bed, if you will," he added to himself, before he rang
										his little bell again, and summoned his valet to his own
										bedroom.</p>
								</div>
								<div class="compose-btn pull-left">
									<button class="btn btn-sm ">
										<i class="fa fa-arrow-right"></i> 답장하기
									</button>
									<button class="btn btn-sm tooltips" data-original-title="Trash"
										data-toggle="tooltip" data-placement="top" title="">
										<i class="fa fa-trash-o"></i>
									</button>
								</div>
							</div>

						</section>
					</div>
				</div>
			</div>
		</div>



	</section>
</section>
<!-- /MAIN CONTENT -->