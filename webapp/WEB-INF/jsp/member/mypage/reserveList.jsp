<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 22.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<style>
onclick:hover {
	background-color: aqua;
}
</style>

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
			            <h2><strong>예약</strong></h2>
			            <br>
			            <table class="table table-striped cart-list">
				            <thead>
				                <tr>
				                    <th>예약 지점</th>
				                    <th>이용 일자</th>
				                    <th>이용 일시</th>
				                    <th>예약 인원</th>
				                    <th>접수 일시</th>
				                    <th>상태</th>
				                </tr>
				            </thead>
				            <tbody id="listBody">
				            
				            </tbody>     
						</table>
		            </div>
		    	</div>
			</div>     
		</div>   

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

	let listBody=$('#listBody');
	
	let makeSingleTr = function(index, resvs){
// 		let aTag = $("<a>").attr("href", "${cPath}/Notice/"+notice.postNo)
// 							.text(notice.postTitle)
		let status = resvs.resvState!='ST14';
		
		let attrJson = {};
		if(status) {
			attrJson = {
				"onclick" : "location.href='${cPath }/mypage/reserve/"+resvs.resvId+"'",
			   	"style" : "cursor: pointer;"
			};
		}else {
			attrJson = {"style" : "text-decoration : line-through;"};
		};
		
		return $('<tr>').append(
		        	$("<td>").html(resvs.franName)
		        	,$("<td>").html(resvs.resvDate)
		        	,$("<td>").html(resvs.resvTime)
		        	,$("<td>").html(resvs.resvPcnt)
		        	,$("<td>").html(resvs.resvAccDate)
		        	,$("<td>").html(resvs.lguName)
	   		 ).attr(attrJson)
	}
	
	$(window).on("load",function(event){
			event.preventDefault();
			 
			let url = this.action;
			let method = this.method;
			let data = $(this).serialize();
		
			$.ajax({ 
				url : url,
				data : data,
				method : method,
				dataType : "json"
				,
				success : function(resp, status, jqXHR) { 
					let resvList = resp.resvs;
					console.log(resvList);
					
					let trTags =[];
					if(resvList && resvList.length>0){ 
							$(resvList).each(function(index, resvs){ 
								trTags.push(makeSingleTr(index, resvs));
							});                                                                                                      
					} else{        
						let trTag = $("<tr>").html(
								$("<td>").attr("colspan","6")
										 .html("예약 내역이 없습니다.")
							);
						trTags.push(trTag);                                                    
					}
					listBody.html(trTags);
				
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			
			return false;
		}).load();
	
</script>