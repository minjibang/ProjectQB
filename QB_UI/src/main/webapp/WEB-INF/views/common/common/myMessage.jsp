
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="${pageContext.request.contextPath}/css/adminMessage.css"
   rel="stylesheet">
<style>
.receiveBtn {
   color: blue;
}
.sendBtn{
   color:red;
}
</style>
<script
   src="${pageContext.request.contextPath}/lib/onet-js/myMessage.js"></script>
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
                        <img src="img/ui-zac.jpg" alt=""> <strong
                           class="messageSender"></strong> to <strong>Me</strong>
                     </div>

                     <div class="col-md-4">
                        <p class="date"></p>
                     </div>
                  </div>
               </div>
               <div class="view-mail">
                  <p class="messageText"></p>
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
</div>
<!-- 쪽지보기 모달창 끝 -->
<!-- 쪽지보기 모달창 2 시작 -->
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
                        <img src="img/ui-zac.jpg" alt="">
                        <strong>Me</strong><strong>to</strong>
                         <strong class="messageSender"></strong>
                     </div>

                     <div class="col-md-4">
                        <p class="date"></p>
                     </div>
                  </div>
               </div>
               <div class="view-mail">
                  <p class="messageText"></p>
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
</div>
<!-- 쪽지보기 모달창2 끝 -->
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
            </div>
            <!-- /panel-heading -->

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
                                      <button type="button" class="btn btn-danger sendMessageDelete" >삭제</button>
                                      <input type="hidden" id="sendDeleteHidden" name="sendDeleteHidden" />
                                       <table class="table table-inbox table-hover" id="sendMessageTable">
                                          <thead>
                                             <tr>
                                                <th><input type="checkbox" class="mail-checkbox" id="agreeAll2">전체선택</th>
                                                <th>보낸사람</th>
                                                <th>제목</th>
                                                <th>받는사람</th>
                                                <th>받은날짜</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:forEach items="${receiveMessage}" var="receiveMessage">
                                                <tr class="${receiveMessage.message_num}">
                                                   <td class="inbox-small-cells"><input name="chk2"
                                                      type="checkbox" class="mail-checkbox" style="margin-left:30px;" value="${receiveMessage.message_num}"></td>
                                                   <td class="view-message ">${receiveMessage.send_member_id}</td>
                                                   <td class="view-message receiveBtn" data-toggle="modal"
                                                      data-target="#MessageModal" id="${receiveMessage.message_num}" onclick=" message_content_row()">
                                                      ${receiveMessage.message_content}</td>
                                                   <td class="view-message  inbox-small-cells">나</td>
                                                   <td class="view-message  text-right">${receiveMessage.message_date}</td>
                                                </tr>
                                             </c:forEach>
                                             <!-- <tr class="read">
                                                      <td class="inbox-small-cells"><input
                                                         type="checkbox" class="mail-checkbox"></td>
                                                      <td class="view-message "><a
                                                         href="mail_view.html">학생2</a></td>
                                                      <td class="view-message "><a id="updatebtn"
                                                         data-toggle="modal" data-target="#MessageModal">Your
                                                            안녕하세요</a></td>
                                                      <td class="view-message  inbox-small-cells">나</td>
                                                      <td class="view-message  text-right">08:10 AM</td>
                                                   </tr> -->

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
                                      <button type="button" class="btn btn-danger receiveMessageDelete" >삭제</button>
                                      <input type="hidden" id="receiveDeleteHidden" name="receiveDeleteHidden" />	
                                       <table class="table table-inbox table-hover" id="receiveMessageTable">
                                          <thead>
                                             <tr>
                                                <th><input type="checkbox" class="mail-checkbox" id="agreeAll3">전체선택</th>
                                                <th>보낸사람</th>
                                                <th>제목</th>
                                                <th>받는사람</th>
                                                <th>보낸날짜</th>
                                             </tr>
                                          </thead>
                                          <tbody>
                                             <c:forEach items="${sendMessage}" var="sendMessage">
                                                <tr class="unread">
                                                   <td class="inbox-small-cells"><input name="chk3"
                                                      type="checkbox" class="mail-checkbox" style="margin-left:30px;" value="${sendMessage.message_num}"></td>
                                                   <td class="view-message "><a href="mail_view.html">나</a></td>
                                                   <td class="view-message sendBtn" data-toggle="modal"
                                                      data-target="#MessageModal">
                                                      ${sendMessage.message_content}</td>
                                                   <td class="view-message  inbox-small-cells">${sendMessage.receive_member_id}</td>
                                                   <td class="view-message  text-right">${sendMessage.message_date}</td>
                                                </tr>
                                             </c:forEach>
                                             <!-- <tr class="read">
                                                      <td class="inbox-small-cells"><input
                                                         type="checkbox" class="mail-checkbox"></td>
                                                      <td class="view-message "><a
                                                         href="mail_view.html">나</a></td>
                                                      <td class="view-message "><a id="updatebtn"
                                                         data-toggle="modal" data-target="#MessageModal">Your
                                                            안녕하세요</a></td>
                                                      <td class="view-message  inbox-small-cells">학생2</td>
                                                      <td class="view-message  text-right">08:10 AM</td>
                                                   </tr> -->

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
                                    <input type="hidden" id="messagemember" name="messagemember" />
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
                                                        <input type="checkbox" class="checkbox form-control"id="agree" name="chk" value="${classMemberList.member_id}"style="position:relative;"/>
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
                                                        <input type="checkbox" class="checkbox form-control"id="agree" name="chk" value="${classTeacherList.member_id}"style="position:relative;" checked/>
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
                                                   <se:authorize access="hasRole('ROLE_STUDENT')">
                                                <button type="button"  onclick="check()"class="btn btn-large btn-primary">전송</button>
                                                </se:authorize>
                                                <se:authorize access="hasRole('ROLE_TEACHER')">
                                                <button type="button"  onclick="check_t()"class="btn btn-large btn-primary">전송</button>
                                                </se:authorize>
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

$(document).ready(function(){

      $('.receiveBtn').click(function(){
         var tr = $(this).parent();
         var td = tr.children();
         var sendMan = td.eq(1).text();
         var text = td.eq(2).text();
         var date = td.eq(4).text();
         $('.messageSender').html(""+sendMan+"");
         $('.date').html(""+date+"");
         $('.messageText').html(""+text+"")
      });
      
      $('.sendBtn').click(function(){
         var tr = $(this).parent();
         var td = tr.children();
         var receiveMan = td.eq(3).text();
         var text = td.eq(2).text();
         var date = td.eq(4).text();
         $('.messageSender').html(""+receiveMan+"");
         $('.date').html(""+date+"");
         $('.messageText').html(""+text+"")
      });
      
      

      });
function check_t(){
   
   
    var messagememberarray = new Array();
      $("input:checkbox[name=chk]:checked").each(function(){
         
         messagememberarray.push($(this).val());
      });
       console.log("messagememberarray>>"+messagememberarray+"<<");
       
       document.getElementById("messagemember").setAttribute('value',messagememberarray);
       console.log("messagemember>>"+$('#messagemember').val()+"<<");
   
   
   if($('#message_content').val()==""){
        swal({
            title : "전송실패",
            text:"내용을 입력하세요.",
            icon : "warning",
            dangerMode: true
         });
   }else if(messagememberarray==""){
        swal({
            title : "전송실패",
            text:"받는사람을 확인하세요.",
            icon : "warning",
            dangerMode: true
         });
   }
   else{
    
   var username='${member_id}';
   var message_content=$('#message_content').val();
   var receive_member_id=$('#messagemember').val();
   
   
   var data=new Array();
   data[0]=username;
   data[1]=message_content;
   data[2]=receive_member_id;
    swal({
         title : "전송성공",
         icon : "success",
         dangerMode: true
      });
   document.getElementById("message_content").value='';
   websocket.send(data);
     
   }
      };

      function check(){
          
          if($('#agree').is(":checked")==false){
               swal({
                   title : "전송실패",
                   text:"받는사람을 확인하세요.",
                   icon : "warning",
                   dangerMode: true
                });
          }else if($('#message_content').val()==""){
               swal({
                   title : "전송실패",
                   text:"내용을 입력하세요.",
                   icon : "warning",
                   dangerMode: true
                });
          }
          
          else{
           
          var username='${member_id}';
          var message_content=$('#message_content').val();
          var receive_member_id=$('#teacher_id').val();
          
          
          var data=new Array();
          data[0]=username;
          data[1]=message_content;
          data[2]=receive_member_id;
           swal({
                title : "전송성공",
                icon : "success",
                dangerMode: true
             });
          document.getElementById("message_content").value='';
          websocket.send(data); 
            
          }
             };
             
             
   function message_content_row(){
      

      var message_num=window.event.target.id;
      var message_check={'message_check':1,
                     'message_num':message_num};
   
         $.ajax({
         url : "message_check.do",
         type : "get",
         dataType : "json",
         data : message_check,
         success : function(data){
            alert('message_check 성공');
            
            
         }
      });
      
      }
   
   $('.sendMessageDelete').click(function(){
	   var sendMessageDeleterarray = new Array();
	      $("input:checkbox[name=chk2]:checked").each(function(){
	     	  sendMessageDeleterarray.push($(this).val());
	      });
	       console.log("sendMessageDeleterarray>>"+sendMessageDeleterarray+"<<");
	       document.getElementById("sendDeleteHidden").setAttribute('value',sendMessageDeleterarray);
	   	   var data ={ 'sendDeleteHidden':$('#sendDeleteHidden').val()};
	   
	   	   $.ajax({
	           url : "sendMessageDelete.do",
	           type : "post",
	           dataType : "html",
	           data : data,
	           success : function(data){
	        	  if(data>0){
	            	  swal({
					       title: "삭제성공",
						   text: "선택된 받은쪽지가 삭제되었다",
						   icon:"info"
						}).then(function() {
						    window.location = "myMessage.do";
						});
	              }
	           }
	        });
	   
   });
   
   $('.receiveMessageDelete').click(function(){
	   var receiveMessageDeleterarray = new Array();
	      $("input:checkbox[name=chk3]:checked").each(function(){
	     	  receiveMessageDeleterarray.push($(this).val());
	      });
	       document.getElementById("receiveDeleteHidden").setAttribute('value',receiveMessageDeleterarray);
	   	   var data ={ 'receiveDeleteHidden':$('#receiveDeleteHidden').val()};
	   	   $.ajax({
	           url : "receiveMessageDelete.do",
	           type : "post",
	           dataType : "html",
	           data : data,
	           success : function(data){
	        	  if(data>0){
	            	  swal({
					       title: "삭제성공",
						   text: "선택된 받은쪽지가 삭제되었다",
						   icon:"info"
						}).then(function() {
						    window.location = "myMessage.do";
						});
	              }
	           }
	        });
	   
   });
   
   
</script>