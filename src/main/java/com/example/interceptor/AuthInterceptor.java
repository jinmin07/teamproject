package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      if(request.getSession().getAttribute("dest")==null){
         request.getSession().setAttribute("dest", request.getHeader("Referer"));
         System.out.println("......................"+request.getHeader("Referer"));
      }
      return super.preHandle(request, response, handler);
   }
}