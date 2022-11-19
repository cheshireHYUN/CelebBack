<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.   황단비                      최초작성
* 2022. 8. 10.   서재원                    메뉴 헤더 설정(시큐리티)
* 2022. 8. 20.  정아영                     장바구니 설정
* 2022. 8. 22.  서재원                    장바구니 멤버만 보이게 수정
* 2022. 8. 25.  정아영                     장바구니 드롭다운 스타일 수정
* 2022. 8. 29.  정아영                    헤더 메뉴 변경
* 2022. 8. 31.  서재원                   로그아웃 안되는 문제 수정
* Copyright (c) 2022 by DDIT All right reserved
 --%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
.dropdown-menu.show{
max-height: 271px;
overflow-x: hidden;
}
</style>


	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>

<header class="header clearfix element_to_stick">
      <div class="layer"></div><!-- Opacity Mask Menu Mobile -->
      <div class="container-fluid">
      <div id="logo">
         <a href="${cPath }">
            <img src="${cPath }/resources/restaurant/img/celebback-normal2.png" width="125" height="35" alt="" class="logo_normal">
            <img src="${cPath }/resources/restaurant/img/celebback-sticky2.png" width="125" height="35" alt="" class="logo_sticky">
         </a>
      </div>
      <ul id="top_menu">
         <li><a href="#0" class="search-overlay-menu-btn"></a></li>
         
    
      <!-- 로그인 후에 나오는 메뉴들 -->
      <security:authorize access="isAuthenticated()">
      <security:authentication property="principal" var="authMember"/>
       
       <li>
          <div class="dropdown dropdown-cart">
          	<a href="shop-cart.html" class="cart_bt">
          	
              </a>
              <div class="dropdown-menu">
              	<div id="remain">
              		
              	</div>
                  <ul class="notifications">
                  	
                  </ul>
              </div>
          </div>
          <!-- /dropdown-cart-->
       </li>
       
       </security:authorize>
      </ul>
      <!-- /top_menu -->
      <a href="#0" class="open_close">
         <i class="icon_menu"></i><span>Menu</span>
      </a>
      <nav class="main-menu">
          <div id="header_menu">
              <a href="#0" class="open_close">
                  <i class="icon_close"></i><span>Menu</span>
              </a>
              <a href="index.html"><img src="" width="140" height="35" alt=""></a>
          </div>
          <ul>
              <li class="submenu">
                  <a href="${cPath }" class="show-submenu">HOME</a>
              </li>
              <li class="submenu">
                  <a href="/CelebBack/shop/list" class="show-submenu">매장조회</a>
              </li>
              <li class="submenu">
                  <a href="${cPath }/Notice" class="show-submenu">공지사항</a>
              </li>
              
              
              <!-- 로그인 후에 나오는 메뉴들 -->
              <security:authorize access="isAuthenticated()">
               <security:authentication property="principal" var="authMember"/>
              
              <li class="submenu">
                  <a href="${cPath }/mypage" class="show-submenu">마이페이지</a>
              </li>
              
              
              <li>
	              <form:form method="post" action="${pageContext.request.contextPath}/logout" id="logoutForm"/>
	              <a href="#" onclick="logoutForm.submit();" class="btn_top">Logout</a>
              </li>
              
              
              
              
              
              </security:authorize>
              
              
              
              
              
              <!-- 로그인 전에 나오는 메뉴들 -->
              <security:authorize access="isAnonymous()">
              <li><a href="${cPath}/login" class="btn_top">Login</a></li>
              <li><a href="${cPath}/join" class="btn_top">Join</a></li>
              </security:authorize>
          </ul>
      </nav>
   </div>
   <!-- Search -->
   <div class="search-overlay-menu">
       <span class="search-overlay-close"><span class="closebt"><i class="icon_close"></i></span></span>
       <form role="search" id="searchform" method="get">
           <input value="" name="q" type="search" placeholder="Search..." />
           <button type="submit"><i class="icon_search"></i></button>
       </form>
   </div><!-- End Search -->
   </header>
   <!-- /header -->
   
   
   <script>
/** 
 * jquery에 cpath 상수  
 * javascript 파일에서도 cPath를 쓸 수 있게됨
 */
	$.CPATH = "${cPath}";
	

	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
</script>

<script src="${cPath }/resources/js/headerMenu-dropdown.js"></script>

<!-- Channel Plugin Scripts -->
<script>

  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "56e83a1b-9e77-45cd-9363-759eb05aac3c"
  });
</script>
<!-- End Channel Plugin -->