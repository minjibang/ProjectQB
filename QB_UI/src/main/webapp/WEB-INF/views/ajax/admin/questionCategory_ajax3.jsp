<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list3}" var="smCategoryList">
		<tr>
			<td class="sm_category_code">${smCategoryList.sm_category_code}</td>
			<td class="sm_category_name">${smCategoryList.sm_category_name}</td>
			<td>
				<button type="button" class="btn btn-theme" id="updatebtnsm"
					name="updatebtnsm" data-toggle="modal" data-target="#UpdateSmModal" onclick="upSm()">
					<i class="fa fa-pencil"></i>
				</button>
				<button type="button" class="btn btn-danger" id="deletebtnsm"
					name="deletebtnsm" data-toggle="modal" data-target="#DeleteModalsm">
					<i class="fa fa-trash-o"></i>
				</button>
			</td>
		</tr>
	</c:forEach>

</body>
</html>