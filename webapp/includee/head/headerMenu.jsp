<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 4.      황단비      최초작성
* 2022. 8. 31.	       서재원      로그아웃 버튼 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
    
<link rel="icon" type="image/png" sizes="16x16" href="${cPath}/resources/dashboard3/images/favicon.png">
<!--**********************************
        Main wrapper start
    ***********************************-->
<!--     <div id="main-wrapper"> -->

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <a href="${cPath}/head" class="brand-logo" style="padding-top: 20px;">
                <img src="${cPath}/resources/dashboard3/images/newlogo.png" alt="" style="width:205px;">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->
		
		
		<!--**********************************
            Header start
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                        	<div class="input-group search-area">
								<input type="text" class="form-control" placeholder="Search here...">
								<span class="input-group-text"><a href="javascript:void(0)"><i class="flaticon-381-search-2"></i></a></span>
							</div>
                        </div>

                        <ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link dz-fullscreen primary" href="#">
									<svg id="Capa_1" enable-background="new 0 0 482.239 482.239" height="22" viewBox="0 0 482.239 482.239" width="22" xmlns="http://www.w3.org/2000/svg"><path d="m0 17.223v120.56h34.446v-103.337h103.337v-34.446h-120.56c-9.52 0-17.223 7.703-17.223 17.223z" fill=""/><path d="m465.016 0h-120.56v34.446h103.337v103.337h34.446v-120.56c0-9.52-7.703-17.223-17.223-17.223z" fill=""/><path d="m447.793 447.793h-103.337v34.446h120.56c9.52 0 17.223-7.703 17.223-17.223v-120.56h-34.446z" fill="" /><path d="m34.446 344.456h-34.446v120.56c0 9.52 7.703 17.223 17.223 17.223h120.56v-34.446h-103.337z" fill=""/></svg>
                                </a>
							</li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" role="button" data-toggle="dropdown">
									<div class="header-info" >
										<span style="font-size:16px;">Hello, <security:authentication property="principal" var="authMember"/><strong>${authMember.realMember.adminId}</strong></span>
									</div>
									<img src="${cPath}/resources/dashboard3/images/damgom.png" width="18"/>
                                </a>
                                
                            </li>
                            
                            <li class="nav-item dropdown notification_dropdown">
                           	    <form:form method="post" action="${pageContext.request.contextPath}/logout" id="logoutForm" width="20"/>
	              				<a href="#" onclick="logoutForm.submit();" class="btn light btn-primary btn-xs">
	              				 <span style="font-size:16px; font-weight:normal;">Logout</span>       				 
	              				</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->
        
<!--     </div> -->
    
    <!--**********************************
        Main wrapper end
    ***********************************-->
    