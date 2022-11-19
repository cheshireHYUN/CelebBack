<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 30.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

		<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>마이페이지</h1>
							<p><span class="element"></span></p>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="frame white"></div>
		</div>
		<!-- /hero_single -->
		

		<div class="bg_gray">
			<div class="container margin_60_40">
				<div class="box_contacts">
					<div>
						<h2><strong>개인정보 수정</strong></h2>
			            <br>
			            <div class="row justify-content-center" style="text-align: left;">
			            <div class="col-xl-6 col-lg-8" style="width: 400px">
		        			<div class="box_booking_2 style_2">
								<div class="main">
						           <form:form modelAttribute="member" name="editForm" action="${cPath }/mypage/account" method="POST">
						           <sec:csrfInput/>
						           <input type="hidden" name="_method" value="put" />
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
					                    </form:form>				        
					           		</div>
						        </div>
										<div class="buttons" style="display: flex; justify-content: right;">
						            	 	<button type="submit" class="btn_1">변경</button>
					                    </div>	
						    </div>
						    </div>
						</div>
		            </div>
		    	</div>
			</div>     

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>