<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--sidebar start  -->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">Sam Soffes</h5>
          <!-- 관리자 -->
          <li class="sub-menu">
            <a href="#">
              <span>관리자</span>
             </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/adminMain.do">
              <i class="fa fa-desktop"></i>
              <span>클래스 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/adminMember.do">
              <i class="fa fa-desktop"></i>
              <span>회원 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/adminCategory.do">
              <i class="fa fa-desktop"></i>
              <span>문제분류 관리</span>
              </a>
          </li>
          <!-- 관리자 end -->
          <!-- 강사  -->
          <li class="sub-menu">
            <a href="#">
              <span>강사</span>
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
	          <!-- if 관리자-->
	          <li class="sub-menu">
	            <a href="${pageContext.request.contextPath}/admin/adminClassInfo.do">
	              <i class="fa fa-desktop"></i>
	              <span>클래스 관리</span>
	              </a>
	          </li>
	          <!-- if관리자 end -->
          <!-- 강사 end -->
          <!-- 학생 -->
          <li class="sub-menu">
            <a href="#">
              <span>학생</span>
             </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-desktop"></i>
              <span>성적 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-desktop"></i>
              <span>지난 시험 보기</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-desktop"></i>
              <span>오답노트</span>
              </a>
          </li>
          <!-- 학생 end -->
        <!-- sidebar menu end-->
      </div>
    </aside>
<!--sidebar end-->