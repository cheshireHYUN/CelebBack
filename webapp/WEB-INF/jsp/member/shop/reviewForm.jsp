<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 31.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
    font-size: inherit;
}
</style>

	<security:authentication property="principal" var="authMember"/>

	<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
		<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-9 col-lg-10 col-md-8">
						<h1 id="h1">리뷰</h1>
						<p><span class="element"></span></p>
					</div>
				</div>
				<!-- /row -->
			</div>
		</div>
		<div class="frame white"></div>
	</div>
	<!-- /hero_single -->

    <div class="container margin_60_40">
	    <div class="row justify-content-center">
	        <div class="col-lg-6">
	            <div class="write_review">
	                <h1>Check reviews</h1>
	                <div id="reviewListDiv" style="height: 525px; overflow: scroll; overflow-x: hidden; padding: 20px;">
	                	<c:forEach items="${reviewList }" var="review">
	                		<div class='box_contacts' style='text-align: initial;'>
	                			<div>
	                				<c:if test="${authMember.realMember.memId==review.memId }">
	                					<input type='button' 
	                						   style='float: right; margin-top: -18px; border: none; background-color: white; color: dimgrey;' 
	                						   value='✖' id= "delBtn"
	                						   data-value='${review.reviewSn }' data-bs-toggle='modal' data-bs-target='#delModal' onclick= "deleteClick(this)">
	                				</c:if>
	                				<c:if test="${authMember.realMember.memId==review.memId }">
	                					<input type='button' style='float: right; margin-top: -18px; visibility : hidden;' value='✖'>
	                				</c:if>
	                			</div>
	                			<div class="rating">
	                				<c:if test="${review.reviewStar==1 }">
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star'></i>
	                					<i class='icon_star'></i>
	                					<i class='icon_star'></i>
	                					<i class='icon_star'></i>
	                				</c:if>
	                				<c:if test="${review.reviewStar==2 }">
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star'></i>
	                					<i class='icon_star'></i>
	                					<i class='icon_star'></i>
	                				</c:if>
	                				<c:if test="${review.reviewStar==3 }">
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star'></i>
	                					<i class='icon_star'></i>
	                				</c:if>
	                				<c:if test="${review.reviewStar==4 }">
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star'></i>
	                				</c:if>
	                				<c:if test="${review.reviewStar==5 }">
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                					<i class='icon_star voted'></i>
	                				</c:if>
	                			</div>
	                			<div>
	                				<c:set value="${review.memId }" var="memId" />
	                				${fn:substring(memId,0,2) }****
	                			</div>
	                			<div>
	                				${review.reviewDate }
	                			</div>
	                			<div>
	                				${review.reviewContent }
	                			</div>
	                		</div>
	                	</c:forEach>
	                </div>
	            </div>
	        </div>
	        <div class="col-lg-6" id="reviewUI">
	            <div class="write_review">
	                <h1>Write a review</h1>
	                <div class="form-group">
	                    <label>이용 날짜를 선택하세요.</label>
	                    <select class="form-control" name="resvId">
	                    	<option value>날짜</option>
							<c:forEach items="${reviewDateList }" var="reviewDate">
								<option value="${reviewDate['resvId'] }">${reviewDate.resvDate } (리뷰 작성 가능일 ${reviewDate.reviewRemainDate }일 남음)</option>
							</c:forEach>
						</select>
<!-- 						<span class="error">날짜를 선택하세요.</span> -->
	                </div>
	                <div class="rating_submit">
	                    <div class="form-group mb-2">
	                        <span class="rating mb-0">
	                            <input type="radio" class="rating-input" id="5_star" name="reviewStar" value="5"><label for="5_star" class="rating-star"></label>
	                            <input type="radio" class="rating-input" id="4_star" name="reviewStar" value="4"><label for="4_star" class="rating-star"></label>
	                            <input type="radio" class="rating-input" id="3_star" name="reviewStar" value="3"><label for="3_star" class="rating-star"></label>
	                            <input type="radio" class="rating-input" id="2_star" name="reviewStar" value="2"><label for="2_star" class="rating-star"></label>
	                            <input type="radio" class="rating-input" id="1_star" name="reviewStar" value="1"><label for="1_star" class="rating-star"></label>
	                        </span>
<!-- 	                        <span class="error">별점을 선택하세요.</span> -->
	                    </div>
	                </div>
	                <!-- /rating_submit -->
	                <div class="form-group mb-5">
	                    <label>review</label>
	                    <textarea name="reviewContent" class="form-control" style="height: 280px;" placeholder="리뷰를 남기세요."></textarea>
<!-- 	                    <span class="error">내용을 입력해주세요.</span> -->
	                </div>
	                <p><a class="btn_1" style="float: right;" id="submitButton">등록</a></p>
	                
	                
	                <input type="hidden" name="memId" value=${authMember.realMember.memId } />
	                <input type="hidden" name="franId" value=${franId } />
	            </div>
	        </div>
	    </div>
	    <!-- /row -->
	</div>

<form action="${cPath }/review/{franId}" method="post" name="review" id="reviewForm">
<sec:csrfInput/>
	<input type="hidden" name="resvId" value="${review.resvId }">
	<input type="hidden" name="reviewStar" value="${review.reviewStar }">
	<input type="hidden" name="reviewContent" value="${review.reviewContent }">
	<input type="hidden" name="memId" value="${review.memId }">
	<input type="hidden" name="franId" value="${review.franId }">
</form>

<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="delModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="termsLabel">리뷰 삭제</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="delReviewFrom" action="${cPath }/review/${franId }" method="post" name="review">
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

	var deleteId="";
	function deleteClick(target){
		console.log(target.dataset.value);
		deleteId = target.dataset.value;
	}

	$("#deleteBtn").on("click",function(){
		$("[name='reviewSn']")[0].value=deleteId;
		console.log($("[name='reviewSn']")[0].value);
		$("#delReviewFrom").submit();
	});
	
	let reviewUI = $("#reviewUI");
	let reviewForm = $("#reviewForm");
	
	$("#submitButton").on("click", function(event){
		reviewForm.get(0).reset();
		let inputs = reviewUI.find(":input[name]");
		 $(inputs).each(function(idx, input){
			 let name = $(this).attr("name");
			 let value = $(this).val();
			 reviewForm.find("[name="+name+"]").val(value);
			 let radioValue = $('input[name=reviewStar]:checked').val();
			 reviewForm.find("[name=reviewStar]").val(radioValue);
		 });
		 reviewForm.submit();
// 		 location.replace('./${franId}');
	});

</script>
