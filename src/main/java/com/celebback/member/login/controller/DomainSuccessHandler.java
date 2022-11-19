package com.celebback.member.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component(value="authenticationSuccessHandler")
public class DomainSuccessHandler implements AuthenticationSuccessHandler{

   @Override
   public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
         Authentication authentication) throws IOException, ServletException {
      
      
      log.info("getName : " + authentication.getName());
      log.info("getAuthorities : " + authentication.getAuthorities());
      log.info("getCredentials : " + authentication.getCredentials());
      log.info("getPrincipal : " + authentication.getPrincipal());
      log.info("getDetails : " + authentication.getDetails());
      
      log.info("------------------------");

   
      String url = "/CelebBack";
      for(GrantedAuthority idx : authentication.getAuthorities()) {
         String i = idx.toString();
         if("ROLE_ADMIN".equals(i)) { //관리자이면
            url = "/CelebBack/head";
         }
         else if("ROLE_FR".equals(i)) { //가맹점주라면
        	 url = "/CelebBack/fr";        	 
         }
      }
      response.sendRedirect(url);
      
   }
}