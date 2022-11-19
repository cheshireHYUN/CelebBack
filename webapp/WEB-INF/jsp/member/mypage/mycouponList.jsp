<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 30.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
img { 
 	min-height: 100%; 
 	max-width: 100%; 
}

.imgHoverEvent {
 	width: 437.219px; 
 	height: 200px;
	position: relative;
	overflow: hidden;
	display: inline-block;
	text-align: center;
}

.imgHoverEvent .imgBox {
 	width: 437.219px; 
 	height: 200px; 
	text-align: center;
	background: no-repeat 50% 50%;
	background-size: auto 100%;
	margin: 0 auto;
}

.imgHoverEvent .hoverBox {
	position: absolute;
 	width: 499px; 
 	height: 200px; 
	top: 0;
 	left: 0;
 	margin: 0 auto;
}

.imgHoverEvent{position: relative;}
        .event5 .imgBox{transform-origin: 0% 0%;}
        .event5 .hoverBox{transform: rotateX(-90deg);transform-origin: 100% 100%;}
        .event5:hover .imgBox{transform: rotateX(90deg); animation: event5Ani 0.5s linear 1;}
        .event5:hover .hoverBox{transform: rotateX(0deg); animation: event5Ani2 0.8s linear 1;}
        @keyframes event5Ani {
            0%{transform: rotateX(0)}
           100%{transform: rotateX(90deg)}
        }
        @keyframes event5Ani2 {
            0%{transform: rotateX(-90deg)}
            30%{transform: rotateX(-90deg)}
           100%{transform: rotateX(0)}
        }
</style>


<div class="hero_single inner_pages background-image"
	data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
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
				<h2><strong>마이 쿠폰</strong></h2>
				<br>
				<div id="divBody" class="row" style="margin-left: 10%; margin-right: 10%; --bs-gutter-x: 0;">
				</div>
				<br>
			</div>
		</div>
	</div>
</div>

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

	let divBody = $("#divBody");
	
	let makeDiv = function(index, mycoupon){
		return $("<div>").attr({
					"class" : "imgHoverEvent event5",
					"style" : "width: 50%;"
				})
					.append($("<div class='imgBox'>")
						.append($("<img>").attr({
							"style" : "height: 200px;",
							"src" : "${cPath }/resources/restaurant/img/"+mycoupon.lguName+".png"
							})
						)
					)
					.append($("<div class='hoverBox'>")
						.append($("<div style='position: relative;'>")
							.append($("<div>")
								.append($("<img>").attr({
									"style" : "height: 200px;",
									"src" : "${cPath }/resources/restaurant/img/coupon-back.png"
								})
							)
						)
						.append($("<div>").attr({
							"style" : "position: absolute; top: 53%; left: 41%; transform: translate(-50%, -50%);"
						}).append($("<strong>").html(mycoupon.cpnName)
								)
						.append($("<br>"))
						  .append($("<a>").html(mycoupon.cpnContent)
								)
						.append($("<br>"))
						  .append($("<a>").html(mycoupon.mycpnGetdate+" ~ "+mycoupon.mycpnEndate)
								)
						)
					)
				)
// 			)
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
					let mycouponList = resp.mycoupon;
					console.log(mycouponList);
					
					let divTags = [];
					if(mycouponList && mycouponList.length>0){
						$(mycouponList).each(function(index, mycoupon){
							divTags.push(makeDiv(index, mycoupon));
						});
					}else {
						divBody.html("아직 쿠폰이 없습니다.")
					}
					divBody.html(divTags);
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