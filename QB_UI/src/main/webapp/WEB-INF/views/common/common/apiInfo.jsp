<%-- 
	@JSP:apiInfo.jsp
	@DATE:
	@Author:우한결
	@Desc:

 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="${pageContext.request.contextPath}/css/apiInfo.css" rel="stylesheet">

<section id="main-content">
	<section class="wrapper site-min-height">
		<div class="col-lg-12 mt">
			<div class="row content-panel">
				<div>
					<h1>큐넷 자격증 시험일정</h1>
				</div>
				<div>
					<table>
						<tr>
							
							<td>
								
							</td>
							
						</tr>
					</table>
					
						
					
				</div>
					
			</div><!-- row content-panel -->
		</div><!-- col-lg-12 mt -->
	</section><!-- wrapper site-min-height -->
</section><!-- main-content -->

<%-- javascript --%>
<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>