<%-- 
	@JSP:adminMain.jsp
	@DATE:2018-10-06
	@Author:양회준
	@Desc:클래스 목록 페이지(스토리보드 7 of 41)
 --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<link href="${pageContext.request.contextPath}/css/adminMain.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/lib/onet-js/adminMain.js"></script>

<script
	src="${pageContext.request.contextPath}/lib/onet-js/jquery-ui.js"></script>

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="row mt">

			<!--  DATE PICKERS -->
			<div class="col-lg-12">
				<div class="row content-panel">
					<div class="panel-heading">
						<header class="panel-heading wht-bg">
							<h4 class="gen-case">
								<i class="fa fa-angle-right"></i>&nbsp;&nbsp;&nbsp;강의 목록
							</h4>
						</header>

					</div>
					<div class="panel-body">
						<div class="row searchRowDiv">
							<div class="col-lg-4">
								<button class="btn btn-theme" data-toggle="modal"
									data-target="#myModal" id="makeNewClassBtn">새 클래스 개설하기</button>
							</div>
							<div class="col-lg-8 searchRowRightDiv">
								<select class="form-control searchRightBtnDiv" id="searchType" name="searchType">
									<option value="">전체</option>
									<option value="n">클래스명</option>
									<option value="t">강사</option>
								</select> <input type="text" class="form-control searchRightBtnDiv"
									placeholder="검색어를 입력" id="keyword" name="keyword">
								<button type="button" class="btn btn-theme searchRightBtnDiv" id="searchBtn">검색</button>
							</div>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<form action="classInsert.do" class="form-horizontal style-form" method="post" onsubmit="return classCheck()">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">클래스 개설</h4>
									</div>
									<div class="modal-body">
												<div class="form-group">
													<label class="col-sm-2 col-sm-2 control-label">클래스명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															placeholder="클래스 명을 입력해주세요." id="class_name" name="class_name" onblur="confirmClass()">
															<div id="classdiv"></div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 col-sm-2 control-label">수강기간</label>
													<div class="col-md-10">
														<div class="input-group input-large">
															<input type="text" class="form-control dpd1" name="class_start_date" id="class_start_date" required>
															<span class="input-group-addon"> 에서 </span> 
															<input type="text" class="form-control dpd2" name="class_end_date" id="class_end_date" required>
																
														</div>
														<span class="help-block">기간을 선택하세요.</span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 col-sm-2 control-label">강사명</label>
													<div class="col-sm-10">
														<input type="text" class="form-control"
															placeholder="강사님 이름을 입력해주세요." id="teacher_name" name="teacher_name">
													</div>
												</div>
										
										<!-- /col-lg-12 -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">생성</button>
									</div>
									</form>
								</div>
							</div>
						</div>

						<div class="row mt">
							<div class="col-lg-12">
							
								<div id="classlistView">
							


								</div>
							</div>
						</div>

					</div>
				</div>
	</section>
	<!-- /wrapper-low -->
</section>

<script>
var classcheck = false;

$(document).ready(function(){
	
	
	var dateFormat = "yy-mm-dd",
    from = $( "#class_start_date" )
      .datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3,
        minDate:0
      })
      .on( "change", function() {
        to.datepicker( "option", "minDate", getDate( this ) );
      }),
    to = $( "#class_end_date" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 3
    })
    .on( "change", function() {
      from.datepicker( "option", "maxDate", getDate( this ) );
    });

  function getDate( element ) {
    var date;
    try {
      date = $.datepicker.parseDate( dateFormat, element.value );
    } catch( error ) {
      date = null;
    }

    return date;
  }
	
	$.ajax({
		url : "adminMainView.do",
		type:'GET',
		dataType:"html",
		success:function(data){
			$('#classlistView').html(data);
		},
		error : function(error) {
			console.log("===========실패");
		}
	});
	
	$('#searchBtn').click(function(){
		var searchtype = document.getElementById("searchType").value;
		var keyword = document.getElementById("keyword").value;
		
		console.log("========"+searchtype+"==========");
		
		$.ajax({
			url : "classSearch.do",
			type : 'GET',
			data : {
				  'searchtype' : searchtype,
				  'keyword' : keyword
			 },
			dataType : "html",
			success:function(data){
				$('#classlistView').html(data);
			},
			error : function(error) {
				console.log("===========실패");
			}
		});
	});

});
function classCheck() {
	if(classcheck == false){
		alert("클래스 명을 확인해주세요");
		document.getElementById("class_name").focus();
		return false;
	}else{
		var classconfirm = confirm("클래스 생성 하시겠습니까");
		if(classconfirm == true){
			return true;
		}else{
			return false;
		}
	}
}
function confirmClass() {
		
		var val = document.getElementById("class_name").value;
		var iddiv = document.getElementById("classdiv");
		if (val == "") {
			classdiv.innerHTML = "클래스를 입력해주세요";
			iddiv.style.color = 'green';
			idcheck = false;

		} else {
			$.ajax({
				url : 'classCheck.do',
				data : {
					'class_name' : val
				},
				dataType : 'json',
				success : function(data) {
					if (data.result == true) {
						classdiv.innerHTML = "사용가능한 클래스 입니다.";
						classdiv.style.color = 'blue';
						classcheck = true;
					} else {
						classdiv.innerHTML = "사용 불가능한 클래스 입니다.";
						classdiv.style.color = "red";
						classcheck = false;
					}
				}
			});
		}
	}
</script>