<%-- 
	@JSP:apiInfo.jsp
	@DATE:
	@Author:우한결
	@Desc:

 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath}/css/apiInfo.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/lib/fullcalendar/bootstrap-fullcalendar.css"
	rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
/* 	var string = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getJMList?jmCd=1320&serviceKey=bE%2BMHNWc5Mt6LzYVw%2BLeZmthCrGWctkYd%2F6FOUod7Vz4BTcOaljwRzx2fuRqduyJormhYl%2BAgvIU2sZcA%2FQW%2Bw%3D%3D&_type=json";
	var today = new Date();
	var full_today = today.getFullYear() +"-"+ (today.getMonth() + 1) +"-"+ today.getDate();

		if(data.body){
			console.log("body");
		}else if(data.response){
			console.log("response");
			console.log("data.response.body >> "+data.response.body);
			console.log("일부 >> " + data.response.body.items.item);
		}
		var start ="";
		start += "<table><tr><th>회차 </th><th>시험일자</th><th>필기시험원서접수시작 </th><th>필기시험원서접수시작 </th><th>필기시험 합격(예정)자 발표일자 </th><th>응시자격 서류제출 및 필기시험 합격자 결정시작일자 </th>"
		$.each(data.response.body.items.item, function(index, obj){
			start += "<tr><td>" + obj.implplannm + "</td><td>" +obj.jmfldnm+ "</td><td>"+ obj.docregstartdt+"</td><td>" + obj.docregenddt  + "</td><td>"+ obj.docPassDt+ "</td></tr>";
			
		});
		start += "</table>";
		$('.API_table_div').append(start);
 */
});
</script>
<style>
.fc-header-center h2{
	color:#424242;
}
</style>
<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
				<div style="text-align:center; margin:10px; padding:10px;">
					<h1>
						<a href="http://www.q-net.or.kr/crf021.do?id=crf02103&gSite=Q&gId=&CST_ID=CRF_Stns_06">큐넷 자격증 시험일정</a>
					</h1>
				</div>
				<!-- <div class="API_table_div"></div> -->
				<!-- <div id="calendar" style="background-color:#D8D8D8;">
				
				</div> -->
				<div class="col-lg-12 mt">

							<div id="calendar" class="has-toolbar" style="margin:10px; padding:10px;"></div>

				</div>
				<hr>
				<span style="margin:10px; padding:10px;">&#8226; 더 자세한 사항을 보고 싶다면 <a href="http://www.q-net.or.kr/crf021.do?id=crf02103&gSite=Q&gId=&CST_ID=CRF_Stns_06">큐넷 시험 일정</a>를 클릭하여 확인하세요</span>
			</div>
			<!-- row content-panel -->
		</div>
		<!-- col-lg-12 mt -->
	</section>
	<!-- wrapper site-min-height -->
</section>
<!-- main-content -->

<%-- javascript --%>
<input type="hidden" id="contextPath"
	value="${pageContext.request.contextPath}">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="${pageContext.request.contextPath}/lib/fullcalendar/fullcalendar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/lib/calendar-conf-events.js"></script>