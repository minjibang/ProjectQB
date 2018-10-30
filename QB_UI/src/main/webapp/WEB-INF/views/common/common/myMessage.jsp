
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<link href="${pageContext.request.contextPath}/css/adminMessage.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/lib/onet-js/myMessage.js"></script> 
<!-- 쪽지보기 모달창 -->
<div class="modal fade" id="MessageModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">쪽지 확인</h4>
			</div>
			<div class="modal-body">
				<!-- /col-lg-12 -->
				<div id="messageform">
					<div class="mail-sender">
						<div class="row">
							<div class="col-md-8">
								<img src="img/ui-zac.jpg" alt=""> <strong>Zac Doe</strong>
								<span>[zac@youremail.com]</span> to <strong>me</strong>
							</div>

							<div class="col-md-4">
								<p class="date">10:15AM 02 FEB 2014</p>
							</div>
						</div>
					</div>
					<div class="view-mail">
						<p>As he bent his head in his most courtly manner, there was a
							secrecy in his smiling face, and he conveyed an air of mystery to
							those words, which struck the eyes and ears of his nephew
							forcibly. At the same time, the thin straight lines of the
							setting of the eyes, and the thin straight lips, and the markings
							in the nose, curved with a sarcasm that looked handsomely
							diabolic.</p>
						<p>"Yes," repeated the Marquis. "A Doctor with a daughter.
							Yes. So commences the new philosophy! You are fatigued. Good
							night!"</p>
						<p>It would have been of as much avail to interrogate any
							stone face outside the chateau as to interrogate that face of
							his. The nephew looked at him, in vain, in passing on to the
							door.</p>
						<p>"Good night!" said the uncle. "I look to the pleasure of
							seeing you again in the morning. Good repose! Light Monsieur my
							nephew to his chamber there!--And burn Monsieur my nephew in his
							bed, if you will," he added to himself, before he rang his little
							bell again, and summoned his valet to his own bedroom.</p>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<button class="btn btn-large btn-primary" id="messageBtn">답장하기</button>
						<button class="btn btn-theme04" type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>

		</div>
	</div>
</div><!-- 쪽지보기 모달창 끝 -->

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
					<div class="panel-heading">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a data-toggle="tab" href="#overview">받은
								쪽지</a></li>
							<li><a data-toggle="tab" href="#sendMessagetab"
								class="contact-map">보낸 쪽지</a></li>
							<li><a data-toggle="tab" href="#contact">새 쪽지</a></li>

						</ul>
					</div><!-- /panel-heading -->
					
					<div class="panel-body">
							<div class="tab-content">
							<!-- 받은 쪽지함 -->
								<div id="overview" class="tab-pane active">
									<section>
										<div class="col-sm-12">
											<div class="panel-body minimal" id="messageTable">
												<div class="table-inbox-wrap ">
													<div class="accordion" id="accordion2">
														<div class="accordion-group">
															<table class="table table-inbox table-hover" id="example">
																<thead>
																	<tr>
																		<th>선택</th>
																		<th>보낸사람</th>
																		<th>제목</th>
																		<th>받는사람</th>
																		<th>받은날짜</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="view-message "><a
																			href="mail_view.html">학생</a></td>
																		<td class="view-message "><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Your
																				new account is ready.</a></td>
																		<td class="view-message  inbox-small-cells">나</td>
																		<td class="view-message  text-right">08:10 AM</td>
																	</tr>
																	<tr class="read">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="view-message "><a
																			href="mail_view.html">학생2</a></td>
																		<td class="view-message "><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Your
																				안녕하세요</a></td>
																		<td class="view-message  inbox-small-cells">나</td>
																		<td class="view-message  text-right">08:10 AM</td>
																	</tr>
																
																</tbody>
															</table>
														</div>
													</div>
												</div>


											</div>
										</div>

									</section>

								</div>
								
								<!-- 보낸 쪽지 탭- -->
								<div id="sendMessagetab" class="tab-pane">
									<section>
										<div class="col-sm-12">
											<div class="panel-body minimal" id="messageTable">
												<div class="table-inbox-wrap ">
													<div class="accordion" id="accordion2">
														<div class="accordion-group">
															<table class="table table-inbox table-hover" id="example2">
																<thead>
																	<tr>
																		<th>선택</th>
																		<th>보낸사람</th>
																		<th>제목</th>
																		<th>받는사람</th>
																		<th>보낸날짜</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="unread">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="view-message "><a
																			href="mail_view.html">나</a></td>
																		<td class="view-message "><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Your
																				new account is ready.</a></td>
																		<td class="view-message  inbox-small-cells">학생</td>
																		<td class="view-message  text-right">08:10 AM</td>
																	</tr>
																	<tr class="read">
																		<td class="inbox-small-cells"><input
																			type="checkbox" class="mail-checkbox"></td>
																		<td class="view-message "><a
																			href="mail_view.html">나</a></td>
																		<td class="view-message "><a id="updatebtn"
																			data-toggle="modal" data-target="#MessageModal">Your
																				안녕하세요</a></td>
																		<td class="view-message  inbox-small-cells">학생2</td>
																		<td class="view-message  text-right">08:10 AM</td>
																	</tr>
																
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</section>
								</div>
								<!-- /tab-pane -->
								<div id="contact" class="tab-pane examstudent">
									<div class="row">
										<div class="row mt">
											<div id="updateExam" class="tab-pane">
											<form class="contact-form php-mail-form" role="form"
																action="sendTeacherMessage.do" method="POST" >
												<div class="row">
													<div class="col-md-12">
														<div class="col-md-2">
															<section class="panel" style="width:150px;">
																<div class="panel-body grey-panel">
																	<div>
																		<label class="btn btn-compose"> <i
																			class="fa fa-pencil"></i>전체선택 <input type="checkbox"
																			class="checkbox form-control" id="agreeAll" />
																		</label>
																	</div>
																	<ul class="nav nav-pills nav-stacked mail-nav">
																	<se:authorize access="hasRole('ROLE_TEACHER')">
																		<c:forEach items="${classMemberList}" var="classMemberList">
																		<li id="messageSelect"><div>
																		 <div class="checkbox" id="checkboxName" style="text-align: left;">
																		  <label>
																		  <input type="checkbox" class="checkbox form-control"id="agree" name="chk" value=""style="position:relative;"/>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25">${classMemberList.member_name}
																					</label>
																					</div>
																			</div></li>
																	</c:forEach>
																	</se:authorize>
																	<se:authorize access="hasRole('ROLE_STUDENT')">
																		<c:forEach items="${classTeacherList}" var="classTeacherList">
																		<li id="messageSelect"><div>
																		 <div class="checkbox" id="checkboxName" style="text-align: left;">
																		  <label>
																		  <input type="checkbox" class="checkbox form-control"id="agree" name="chk" value="${classTeacherList.member_id}"style="position:relative;"/>
																				<img
																					src="${pageContext.request.contextPath}/img/friends/fr-05.jpg"
																					class="img-circle" width="25">${classTeacherList.member_name}
																					</label>
																					</div>
																			</div></li>
																			<input type="hidden" id="teacher_id" name="teacher_id" value="${classTeacherList.member_id}"/>
																			
																	</c:forEach>
																	</se:authorize>
																	</ul>
																	
																</div>
															</section>

														</div>
														<div class="col-md-8">
																<div class="form-group">
																	<textarea class="form-control" name=message_content
																		id="message_content" placeholder="Your Message"
																		rows="5" data-rule="required"
																		data-msg="Please write something for us"></textarea>
																	
																</div>


																<div class="sent-message">Your message has been
																	sent. Thank you!</div>



																<button type="button"  onclick="check()"class="btn btn-large btn-primary">전송</button>
																<button class="btn btn-theme04" type="button">취소</button>


															
														</div>


													</div>
												</div>
												</form>
											</div>
											<!-- /row -->
											
										</div>

										<!-- /tab-content -->
									</div>
									<!-- /panel-body -->
								</div>

							</div>
							<!-- /tab-content -->
						</div>
						<!-- /panel-body -->
					
			</div><!-- row content-panel -->
		</div><!-- col-lg-12 mt -->
	</section><!-- wrapper site-min-height -->
</section><!-- main-content -->

<script>
function check(){
	
	var username='${member_id}';
	var message_content=$('#message_content').val();
	var receive_member_id=$('#teacher_id').val();
	
	
	var data=new Array();
	data[0]=username;
	data[1]=message_content;
	data[2]=receive_member_id;
	
	  websocket.send(data); 
	  
	  
      };


	

</script>
