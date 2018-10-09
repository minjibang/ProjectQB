<%-- 
	@JSP:adminClassSidebar.jsp
	@DATE:2018-10-08
	@Author:김현이
	@Desc:관리자 클래스 상세보기 사이드바(스토리보드 8 of 41)
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--sidebar start  -->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">Sam Soffes</h5>
          <!-- 강사  -->
          <li class="sub-menu">
            <a href="#">
              <span>관리자 클래스 상세 보기 사이드바(나중에 지울 예정)</span>
             </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/teacher/teacherMain.do">
              <i class="fa fa-desktop"></i>
              <span>공지사항 & 시험일정</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-desktop"></i>
              <span>학생 & 성적관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-desktop"></i>
              <span>문제 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-desktop"></i>
              <span>시험 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/adminMain.do">
              <i class="fa fa-desktop"></i>
              <span>클래스 목록 보기(like 뒤로가기 버튼, 이걸 조금 밑으로 내려주기)</span>
              </a>
          </li>
	          
         </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
<!--sidebar end-->