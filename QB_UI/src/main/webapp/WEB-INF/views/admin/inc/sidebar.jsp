<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--sidebar start  -->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
         
          <!-- 관리자 -->
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/adminMain.do">
              <i class="fa fa-th"></i>
              <span>클래스 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/adminMember.do">
              <i class="fa fa-users"></i>
              <span>회원 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/admin/questionCategory.do">
              <i class="fa fa-cogs"></i>
              <span>문제분류 관리</span>
              </a>
          </li>
          <!-- 관리자 end -->
         </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
<!--sidebar end-->