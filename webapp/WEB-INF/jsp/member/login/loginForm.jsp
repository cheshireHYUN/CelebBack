<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 9.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	

	<main class="pattern_2">		
	
		<!-- 회색 꾸미기용 헤더 -->
		<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>로그인</h1>
							<p><span class="element"></span></p>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="frame white"></div>
		</div>
		
		
		<!--  로그인창 -->
		<div class="container margin_60_40">
		    <div class="row justify-content-center" >
		        <div class="col-xl-6 col-lg-8" style="width: 400px">
		        	<div class="box_booking_2 style_2" >
<!-- 					    <div class="head">
					        <div class="title">
					            <h3>Personal Details</h3>
					        </div>
					    </div> -->
					    <!-- /head -->
					    <div class="main">
<!-- 					        <div class="form-group">
					            <label>ID</label>
					            <input class="form-control" placeholder="put your ID">
					        </div> -->
					        
		<p>
					        <div>
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                <c:url value="/login" var="loginUrl" />
							        <form:form name="f" action="${loginUrl}" method="POST">
					                    <label for="username">아이디</label>
					                    <input class="form-control" type="text" name="id" placeholder="celebback">
					                </div>
					            </div>
									   <div><!-- 빈칸용 div --></div>
					            <div class="col-md-6">
					                <div class="form-group" style="width: 324px">
					                    <label for="password">비밀번호</label>
					                    <input class="form-control" type="password" name="password" placeholder="******">
					                </div>
					            </div>
					            <div style="display: flex; justify-content: right; font-size: 12px">
					            	아이디 찾기 | 비밀번호 찾기
					            </div>
					        </div>
					    </div>
					</div>
					
					
					<!-- /box_booking -->
		            
		            	 <div class="buttons" style="display: flex; justify-content: right;">
		            		<button type="submit" class="btn_1">로그인</button>
<!-- 	                        <a href="#0" class="btn_1">로그인</a> -->
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