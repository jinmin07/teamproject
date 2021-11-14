package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PasswordInterceptor extends HandlerInterceptorAdapter {
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      if(request.getSession().getAttribute("user") == null){
         String path = request.getServletPath();
         String query = request.getQueryString()==null? "":"?"+request.getQueryString();
         
         request.getSession().setAttribute("dest", path + query);
         System.out.println("......" + path+query);
         response.sendRedirect("/mypage/password_check");
      }
      return super.preHandle(request, response, handler);
   }
}