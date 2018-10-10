<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#main-content {
	padding: 100px;
}

.table_heading {
	padding: 25px;
	background-color: #60EEEE;
}

button.add {
	float: right;
	right: 15px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}

button.modalButton {
	float: right;
	right: 15px;
	margin-top: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
}

#lgCatModalPop {
	height: 250px;
}

#mdCatModalPop, #smCatModalPop {
	height: 300px;
}


#lgCatAddForm, #mdCatAddForm, #smCatAddForm {
	margin-top: 10px;
}

.form-control{
	width:100%;
}

</style>



	<section id="main-content">
		<section class="wrapper site-min-height">
<!--############     모달창 시작          #############-->

			<!-- 대분류 추가 모달창 시작-->
			<div class="modal fade" id="lgCatModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div id="lgCatModalPop" class="modal-content">
						<div class="modal-header">
							대분류 추가
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<div class="modal-body">
							<div id="lgCatAddForm" class="form-group">
								<label for="lgCatAdd">대분류 이름</label> <input type="text"
									class="form-control" name="lgCatAdd"
									placeholder="대분류 이름을 입력해주세요.">
								<button type="submit" class="btn btn-info modalButton">등록</button>
								<button type="button" class="btn btn-secondary modalButton">취소</button>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 대분류 추가 모달창 끝 -->

			<!-- 중분류 추가 모달창 시작 -->
			<div class="modal fade" id="mdCatModal" role="dialog">
				<div class="modal-dialog">
					<!--  Modal content -->
					<div id="mdCatModalPop" class="modal-content">
						<div class="modal-header">
							중분류 추가
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<div class="modal-body">
							<label><span class="hidden-xs">상위 대분류 선택</span> </label>
							<div class="form-inline">
								<select class="form-control">
									<option>대분류를 선택해주세요.</option>
									<option>대분류1</option>
									<option>대분류2</option>
									<option>대분류3</option>
									<option>대분류4</option>
								</select>
							</div>

							<div id="mdCatAddForm" class="form-group">

								<label for="mdCatAdd">중분류 이름</label> <input type="text"
									class="form-control" name="mdCatAdd"
									placeholder="중분류 이름을 입력해주세요.">
								<button type="submit" class="btn btn-info modalButton">등록</button>
								<button type="button" class="btn btn-secondary modalButton">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div> 
			<!-- 중분류 추가 모달창 끝 -->

			<!-- 소분류 추가 모달창 시작 -->
			<div class="modal fade" id="smCatModal" role="dialog">
				<div class="modal-dialog">
					<!--  Modal content -->
					<div id="smCatModalPop" class="modal-content">
						<div class="modal-header">
							소분류 추가
							<button type="button" class="close" data-dismiss="modal">×</button>
						</div>
						<div class="modal-body">
							<label><span class="hidden-xs">상위 중분류 선택</span> </label>
							<div class="form-inline">
								<select class="form-control">
									<option>중분류를 선택해주세요.</option>
									<option>중분류1</option>
									<option>중분류2</option>
									<option>중분류3</option>
									<option>중분류4</option>
								</select>
							</div>

							<div id="smCatAddForm" class="form-group">

								<label for="smCatAdd">소분류 이름</label> <input type="text"
									class="form-control" name="smCatAdd"
									placeholder="소분류 이름을 입력해주세요.">
								<button type="submit" class="btn btn-info modalButton">등록</button>
								<button type="button" class="btn btn-secondary modalButton">취소</button>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 소분류 추가 모달창 끝 -->

			<div class="col-lg-4">
				<h2 class="table_heading" align="center">대분류</h2>
				<button type="button" class="btn btn-info add" data-toggle="modal"
					data-target="#lgCatModal">대분류 추가</button>
				<table id="table_lgCategory" class="display">

					<thead>
						<tr>
							<th>대분류코드</th>
							<th>대분류 [언어]</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list1}" var="lgCategoryList">
						<tr>
							<td>${lgCategoryList.lg_category_code}</td>
							<td>${lgCategoryList.lg_category_name}</td>
							<td>
								<button type="button" class="btn btn-info"><i class="fa fa-pencil"></i></button>
								<button type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>


			</div>

			<div class="col-lg-4">
				<h2 class="table_heading" align="center">중분류</h2>
				<button type="button" class="btn btn-info add" data-toggle="modal"
					data-target="#mdCatModal">중분류 추가</button>
				<table id="table_mdCategory" class="display">

					<thead>
						<tr>
							<th>대분류코드</th>
							<th>중분류코드</th>
							<th>중분류 [과목]</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list2}" var="mdCategoryList">
						<tr>
							<td>${mdCategoryList.lg_category_code}</td>
							<td>${mdCategoryList.md_category_code}</td>
							<td>${mdCategoryList.md_category_name}</td>
							<td>
								<button type="button" class="btn btn-info"><i class="fa fa-pencil"></i></button>
								<button type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="col-lg-4">
				<h2 class="table_heading" align="center">소분류</h2>
				<button type="button" class="btn btn-info add" data-toggle="modal"
					data-target="#smCatModal">소분류 추가</button>
				<table id="table_smCategory" class="display">

					<thead>
						<tr>
							<th>중분류코드</th>
							<th>소분류코드</th>
							<th>소분류 [주제]</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list3}" var="smCategoryList">
						<tr>
							<td>${smCategoryList.md_category_code}</td>
							<td>${smCategoryList.sm_category_code}</td>
							<td>${smCategoryList.sm_category_name}</td>
							<td>
								<button type="button" class="btn btn-info"><i class="fa fa-pencil"></i></button>
								<button type="button" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /container -->
		</section>
		<!-- /wrapper -->
	</section>
	<!-- /MAIN CONTENT -->
	<!--main content end-->

	<script>

	</script>
