<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 26.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

		<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>${frNotice.franName} 공지사항</h1>
							<p><span class="element"></span></p>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="frame white"></div>
		</div>
		<!-- /hero_single -->
		
		<div class="pattern_2">
		    <div class="container margin_60_40">
		        <table class="table table-striped cart-list">
		            <thead>
		                <tr>
		                    <th style="width: 85%; padding-left: 2%; color: gray;">제목</th>
		                    <th style="width: 15%; text-align: right; padding-right: 2%; color: gray;">날짜</th>
		                </tr>
		            </thead>
		            <tbody>
		                <tr>
		                    <td style="padding-left: 2%;"><strong>${frNotice.postTitle }</strong></td>
		                    <td style="text-align: right; padding-right: 2%;">${frNotice.postDate }</td>
		                </tr>
		                <tr>
		                	<td colspan="2" style="padding: 2%;">${frNotice.postContent }</td>
		                </tr>
		            </tbody>     
				</table>
			</div>	
				
			
		</div>
		<!-- /container -->
	<!-- /main -->

	<div id="toTop"></div><!-- Back to top button -->

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>