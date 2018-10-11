<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--sidebar start  -->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">Sam Soffes</h5>
          <!-- 학생 -->
          <li class="sub-menu">
            <a href="#">
              <span>학생</span>
             </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/student/studentMain.do">
              <i class="fa fa-calendar"></i>
              <span>공지사항 & 시험일정</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/student/studentGradeManage.do">
              <i class="fa fa-bar-chart-o"></i>
              <span>성적 관리</span>
             </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-copy"></i>
              <span>지난 시험 보기</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="#">
              <i class="fa fa-paste"></i>
              <span>오답노트</span>
              </a>
          </li>
          <!-- 학생 end -->
         </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
<!--sidebar end-->