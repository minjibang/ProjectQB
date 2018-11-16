package onet.com.index.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

   @Override
   public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
         Authentication authentication) throws IOException, ServletException {
      String url = request.getContextPath();
      String authentication2 = authentication.getAuthorities().toString();
      String authentication3 = authentication2.trim();
      
      if (authentication3.equals("[ROLE_ADMIN]")) {
         url += "/admin/adminMain.do";
      } else if (authentication3.equals("[ROLE_TEACHER]")) {
         url += "/teacher/teacherMain.do";
      } else if (authentication3.equals("[ROLE_STUDENT]")) {
         url += "/student/studentMain.do";
      } else if (authentication3.equals("[ROLE_MEMBER]")) {
         url += "/index/noAuth.do";
      }
      response.sendRedirect(url);
   }

}