<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 29.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<h2><strong>스탬프</strong></h2>
			            <br>
						<div>
				           <div>
				           		<img alt="" id="imgLink" style="height: 200px;">
				           </div>
				           <br>
				        </div>
		            </div>
		    	</div>
			</div>     
		</div>   

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

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
					let stampcnt = resp.stamp.memStpcnt;
					let stpCpn = resp.stamp.stpCpn;
					console.log(stampcnt);
					
					switch (stampcnt) {
					case 1:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-1.png");
						break;
					case 2:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-2.png");
						break;
					case 3:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-3.png");
						break;
					case 4:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-4.png");
						break;
					case 5:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-5.png");
						break;
					case 6:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-6.png");
						break;
					case 7:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-7.png");
						break;
					case 8:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-8.png");
						break;
					case 9:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-9.png");
						break;
					case 0:
						if(stpCpn==10){
							$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-10.png");
						}else {
							$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-0.png");
						}
// 						$("#buttonArea").append("<input type='button' class='btn btn-primary' value='스탬프 쿠폰 발행하기'>");
						break;
					default:
						$("#imgLink").attr("src", "${cPath }/resources/restaurant/img/stamp-0.png");
						break;
					}
					
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