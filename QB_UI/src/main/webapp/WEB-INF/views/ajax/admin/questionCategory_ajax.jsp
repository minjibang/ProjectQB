<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:forEach items="${list1}" var="lgCategoryList">
		<tr class="trBottom">
			<td class="lg_category_code">${lgCategoryList.lg_category_code}</td>
			<td class="lg_category_name">${lgCategoryList.lg_category_name}</td>
			<td>
				<button type="button" class="btn btn-theme" id="updatebtnlg"
					name="updatebtnlg" data-toggle="modal" data-target="#UpdateModal"
					value="${lgCategoryList.lg_category_code}" onclick="upLg()">
					<i class="fa fa-pencil"></i>
				</button>
				<button type="button" class="btn btn-danger" id="deletebtnlg"
					name="deletebtnlg" data-toggle="modal" data-target="#DeleteModal">
					<i class="fa fa-trash-o"></i>
				</button>
			</td>
		</tr>
	</c:forEach>

