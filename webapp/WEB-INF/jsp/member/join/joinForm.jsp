<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	




	<main class="pattern_2">		
	
	
	
		<!-- 회색 꾸미기용 헤더 -->
		<div class="hero_single inner_pages background-image" data-background="url(img/hero_menu.jpg)">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>Join</h1>
							    <h3>회원가입</h3>
							<p>Welcome to CelebBack Steak House!</p>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="frame white"></div>
		</div>
	
	
	
	
		<div class="container margin_60_40">
		    <div class="row justify-content-center">
		        <div class="col-xl-6 col-lg-8" style="width: 400px">
		        	<div class="box_booking_2 style_2">
<!--  					    <div class="head">
					        <div class="title">
					            <h3>Join Form</h3>
					        </div>
					    </div>  -->
					    <!-- /head -->
					    <div class="main">
<!-- 					        <div class="form-group">
					            <label>ID</label>
					            <input class="form-control" placeholder="put your ID">
					        </div> -->
					        
					        
					        
					        <c:url value="/join" var="joinUrl" />
					        <form:form modelAttribute="member" name="joinForm" action="${joinUrl}" method="POST">
					        <div class="row">
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                    <label>아이디</label>
					                    <form:input path="memId" class="form-control" type="text" placeholder="celebback" />
					                </div>
					            </div>
					        </div>
									   <div><!-- 빈칸용--></div>
									   
							<div class="row">
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                    <label>비밀번호</label>
					                    <form:input path="memPw" class="form-control" type="password" placeholder="******" />
					                </div>
					            </div>
					        </div>
					        <div class="row">
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                    <label>비밀번호 확인</label>
					                    <input class="form-control" type="password" placeholder="******">
					                </div>
					            </div>
					        </div>
					        
<!-- 					        <div class="row">
					            <div class="col-md-6">
					                <div class="form-group">
					                    <label>이름</label>
					                    <input class="form-control" type="text" placeholder="이름">
					                </div>
					            </div>
					         </div> -->
					        <div class="row">
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                    <label>이름</label>
					                    <form:input path="memName" class="form-control" type="text" placeholder="김셀럽" />
					                </div>
					            </div>
					        </div>
					        <div class="row">
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                    <label>생년월일</label>
					                    <form:input path="memBir" class="form-control" type="date" placeholder="1900-00-00" />
					                </div>
					            </div>
					        </div>
					        
					         <div class="row">
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                    <label>휴대폰번호</label>
					                    <form:input path="memTel" class="form-control" type="text" placeholder="010-1234-5678" />
					                </div>
					            </div>
					         </div>
					         
					         <div class="row">
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                    <label>E-mail</label>
					                    <form:input path="memMail" class="form-control" type="text" placeholder="example@celebback.com" />
					                </div>
					            </div>
					         </div>
					        
					        
					        
					        
					        
					        
					    </div>
					</div>
					<!-- /box_booking -->
		            
		            	 <div class="buttons" style="display: flex; justify-content: right;">
		            	 	<button type="submit" class="btn_1">가입</button>
	         <!--                <a href="#0" class="btn_1">가입</a> <a href="#0" class="btn_1 gray">Reset</a> -->
	                    </div>
	                     </form:form>
		            
		            
		        </div>
		        <!-- /col -->
		        


		    </div>
		    <!-- /row -->
		</div>
		<!-- /container -->	
		

		
		
		
	</main>
	<!-- /main -->
