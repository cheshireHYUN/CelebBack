<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 30.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
.rating i {
	color: #ccc;
}

.rating i.voted {
	color: #fec348;
}

.box_contacts i {
	font-size: initial;
}
</style>

		<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>마이페이지</h1>
<!-- 							<p>Our food with your happiness</p> -->
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
						<h2><strong>리뷰</strong></h2>
			            <br>
			            <div class="row" style="padding: 20px;" id="divBody">
							<c:forEach items="${myReviewList }" var="myReview">
								<div class='col-lg-4'>
									<div class='box_contacts' style='background-color: cornsilk;'>
										<div>
										<input type='button' 
	                						   style='float: right; margin-top: -18px; border: none; background-color: cornsilk; color: dimgrey;' 
	                						   value='✖' id= "delBtn"
	                						   data-value='${myReview.reviewSn }' data-bs-toggle='modal' data-bs-target='#delModal' onclick= "deleteClick(this)">
	                					</div>	   
										<div style='text-align: center;'>
											<h5>${myReview.franName }</h5>
											<div>(${myReview.resvDate } 이용)</div>
											<br>
										</div>
										<div class="rating">
			                				<c:if test="${myReview.reviewStar==1 }">
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star'></i>
			                					<i class='icon_star'></i>
			                					<i class='icon_star'></i>
			                					<i class='icon_star'></i>
			                				</c:if>
			                				<c:if test="${myReview.reviewStar==2 }">
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star'></i>
			                					<i class='icon_star'></i>
			                					<i class='icon_star'></i>
			                				</c:if>
			                				<c:if test="${myReview.reviewStar==3 }">
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star'></i>
			                					<i class='icon_star'></i>
			                				</c:if>
			                				<c:if test="${myReview.reviewStar==4 }">
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star'></i>
			                				</c:if>
			                				<c:if test="${myReview.reviewStar==5 }">
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                					<i class='icon_star voted'></i>
			                				</c:if>
			                			</div>
										<div style='text-align: right;'>
											${myReview.reviewDate }
										</div>
										<c:if test="${fn:length(myReview.reviewContent) >= 120 }">
											<div class='overflowContent' style='padding-top: 7px; display: grid; align-items: center; cursor: pointer;' data-value='${myReview.reviewContent }' onclick="wide(this)">
												${fn:substring(myReview.reviewContent, 0, 115) } ··· 더보기
 											</div>
										</c:if>
										<c:if test="${fn:length(myReview.reviewContent) < 120 }">
											<div style='padding-top: 7px; height: 100px; display: grid; align-items: center;'>
													${myReview.reviewContent }
											</div>
										</c:if>
									</div>
								</div>
							</c:forEach>
				        </div>
		            </div>
		    	</div>
			</div>     
		</div>   
		
<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="termsLabel">리뷰 삭제</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="delReviewFrom" action="${cPath }/mypage/review" method="post" name="review">
			<sec:csrfInput/>
				<div class="modal-body">
					리뷰가 삭제되고, 적립된 리뷰 스탬프가 차감됩니다.
					<br>
					정말 삭제하시겠습니까? 
					<input type="hidden" name="reviewSn" value="">
					<input type="hidden" name="_method" value="delete">
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
			    </div>
			</form>
		</div>
	</div>
</div>		
		
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

	function wide(target){
		var more = target.innerText;
		var realText = target.dataset.value;
		var result = more.replace(more, realText);
		target.innerText = result;
	}
	
	var deleteId="";
	function deleteClick(target){
		console.log(target.dataset.value);
		deleteId = target.dataset.value;
	}

	$("#deleteBtn").on("click",function(){
		$("[name='reviewSn']")[0].value = deleteId;
		console.log($("[name='reviewSn']")[0].value);
		$("#delReviewFrom").submit();
	});
	
</script>
