<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      이혜원      최초작성
* 2022. 8. 24.     황단비      기능추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="content-body">
<!-- row -->
			<div class="container-fluid ">
			<!-- 파란카드 템플릿 -->
<div class="row page-titles">
  <div class="col-sm-6 p-md-0">
      <div class="welcome-text">
          <h4><strong>트레이딩 요청현황</strong></h4>
          <span>금일 트레이딩 요청현황을 확인합니다.</span>
      </div>
  </div>
  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="javascript:void(0)">재고트레이딩</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">트레이딩 요청현황</a></li>
      </ol>
  </div>
</div>
		<div>
			<div class="card">
				<div class="card-body">
                   <div class="custom-tab-1">
					<ul class="nav nav-tabs mb-4 light" role="tablist">
						<li class=" nav-item">
							<a href="#navpills-1" class="nav-link active" data-bs-toggle="tab" aria-expanded="false"><strong>발신 현황</strong></a>
						</li>
						<li class="nav-item">
							<a href="#navpills-2" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>수신 현황</strong></a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="navpills-1" class="tab-pane active">
							<div class="content-wrapper">
								<!-- row -->
								<div class="container-fluid bg-gray">
									<div class="row order-row" id="masonry">
										<c:if test="${not empty reqList }">
											<c:forEach items="${reqList }" var="req">
												<c:if test="${req.tradeState eq '요청'}">
												<div class="card-container cb-wp25">
													<div class="card shadow-sm">
														<div class="card-header bg-danger text-white">
															<div>
																<h4 class="text-white">${req.reqDate }</h4>
																<span class="fs-12 op9">${req.reqTime }</span>
															</div>
															<h3 class="text-white">${req.tradeState }</h3>
														</div>
														<div class="card-body">
															<div>
																<strong>응답가맹점명</strong>
																<p class="frSales card-intro-itle">${req.franName}</p>
															</div>
															<div>
																<strong>요청 재료명</strong>
																<p class="frSales card-intro-title">${req.buyerprodName}
															</div>
															<div>
																<strong>요청 갯수</strong>
																<p class="frSales card-intro-title">${req.reqQty }</p>
															</div>
																<div id="${req.tradeNo }" name="tradeNo" class="cb-float-right">
																	<input type="button"  class="btn btn-primary btn-sm" value="수정"/>
																	<input type="button" onclick="cancleClick(this)" class="btn btn-danger btn-sm" value="삭제"/>
																</div>
														</div>
													</div>
												</div>
												</c:if>
												<c:if test="${req.tradeState ne '요청'}">
												<div class="card-container cb-wp25">
													<div class="card shadow-sm">
														<div class="card-header bg-dark text-white">
															<div>
																<h4 class="text-white">${req.reqDate }</h4>
																<span class="fs-12 op9">${req.reqTime }</span>
															</div>
															<h3 class="text-white">${req.tradeState }</h3>
														</div>
														<div class="card-body">
															<div>
																<strong>응답가맹점명</strong>
																<p class="frSales card-intro-itle">${req.franName}</p>
															</div>
															<div>
																<strong>요청 재료명</strong>
																<p class="frSales card-intro-title">${req.buyerprodName}
															</div>
															<div>
																<strong>요청 갯수</strong>
																<p class="frSales card-intro-title">${req.reqQty }</p>
															</div>
														</div>
													</div>
												</div>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${empty reqList}">
											<h4>금일 트레이딩 발신 내역이 없습니다.</h4>													
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<div id="navpills-2" class="tab-pane">
							<div class="content-wrapper">
								<!-- row -->
								<div class="container-fluid bg-gray">
									<div class="row order-row" id="masonry">
										<c:if test="${not empty respList }">
											<c:forEach items="${respList }" var="resp">
												<c:if test="${resp.tradeState eq '요청'}">
												<div  class="card-container cb-wp25">
													<div class="card shadow-sm">
														<div class="card-header bg-primary text-white">
															<div>
																<h4 class="text-white">${resp.reqDate }</h4>
																<span class="fs-12 op9">${resp.reqTime }</span>
															</div>
															<h3 class="text-white">${resp.tradeState }</h3>
														</div>
														<div class="card-body">
															<div>
																<strong>요청가맹점명</strong>
																<p class="frSales card-intro-itle">${resp.franName}</p>
															</div>
															<div>
																<strong>요청 재료명</strong>
																<p name="buyerprodName" id="${resp.buyerprodId }" class="frSales card-intro-title">${resp.buyerprodName}
															</div>
															<div>
																<strong>요청 갯수</strong>
																<p class="frSales card-intro-title">${resp.reqQty }</p>
															</div>
															<div class="cb-float-right">
																<input  id="${resp.tradeNo }" name="${resp.reqFran }" type="button" onclick="acceptClick(this)" class="btn btn-primary btn-sm" value="수락"/>
																<input id="${resp.tradeNo }" name="tradeNo" onclick="clickReject(this)" type="button" data-bs-toggle="modal" data-bs-target="#rejectModal" class="btn btn-danger btn-sm" value="거절"/>
															</div>
														</div>
													</div>
												</div>
												</c:if>
												<c:if test="${resp.tradeState ne '요청'}">
												<div  class="card-container cb-wp25">
													<div class="card shadow-sm">
														<div class="card-header bg-dark text-white">
															<div>
																<h4 class="text-white">${resp.reqDate }</h4>
																<span class="fs-12 op9">${resp.reqTime }</span>
															</div>
															<h3 class="text-white">${resp.tradeState }</h3>
														</div>
														<div class="card-body">
															<div>
																<strong>요청가맹점명</strong>
																<p class="frSales card-intro-itle">${resp.franName}</p>
															</div>
															<div>
																<strong>요청 재료명</strong>
																<p class="frSales card-intro-title">${resp.buyerprodName}
															</div>
															<div>
																<strong>요청 갯수</strong>
																<p class="frSales card-intro-title">${resp.reqQty }</p>
															</div>
														</div>
													</div>
												</div>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${empty respList}">
											<h4>금일 트레이딩 수신내역이 없습니다.</h4>													
										</c:if>
									</div>
								</div>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- delete modal -->
<div class="modal fade" id="rejectModal">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">트레이딩 요청 거절</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
				<input type="hidden" name="_method" value="delete">
				<div class="modal-body">
					트레이딩 요청 거절 사유 (필수아님)
					<textarea class="form-control" rows="4" name="tradeNote" id="comment" style="height: 188px;"></textarea>
				</div>
				<div class="modal-footer">
					<button id="rejectBtn" onclick="rejectClick(this)" type="button" class="btn light btn-primary">확인</button>
					<button type="button" class="btn light btn-danger light"
						data-bs-dismiss="modal">취소</button>
				</div>
		</div>
	</div>
</div>

<%-- 트레이딩 거절 --%>
<form id="rejectForm" method="post" action="${cPath }/fr/tradeReq/reject">
<sec:csrfInput/>
	<input type="hidden" name="_method" value="PUT">
	<input type="hidden" id="rejectTradeNo" name="tradeNo"/>
	<input type="hidden" name="tradeNote"/>
</form>

<%-- 트레이딩 수락 --%>
<form id="acceptForm" method="post" action="${cPath }/fr/tradeReq/accept">
<sec:csrfInput/>
	<input type="hidden" name="_method" value="PUT">
	<input type="hidden"  id="acceptTradeNo" name="tradeNo"/>
	<input type="hidden"  name="respQty"/>
	<input type="hidden"  name="buyerprodId"/>
	<input type="hidden"  name="reqFran"/>
</form>

<%-- 트레이딩 취소 --%>
<form id="cancleForm" method="post" action="${cPath }/fr/tradeReq/cancle">
<sec:csrfInput/>
	<input type="hidden" name="_method" value="DELETE">
	<input type="hidden" id="cancleTradeNo" name="tradeNo"/>
</form>

<script>
	
<%-- 수락 이벤트 --%>
function acceptClick(target) {
// 	let tradeNo = $(target).parent().find('[name="tradeNo"]').prevObject[0].id; // TRADE20220824-0002
// 	console.log(target.id);// TRADE20220824-0002
	console.log(target.name); // CB2022901
	let respQty = $(target).parents()[1].childNodes[5].childNodes[3].innerHTML; // 2
	let buyerprodId = $('[name="buyerprodName"]')[0].id; // 001
	$('#acceptTradeNo').val(target.id);
	$('input[name="respQty"]').val(respQty);
	$('input[name="reqFran"]').val(target.name);
	// 	console.log($('#acceptTradeNo')[0]);

	$('input[name="buyerprodId"]').val(buyerprodId);

	$('#acceptForm').submit();
};

let rejectId = null;
function clickReject(target){
// 	console.log(target.id); // TRADE20220824-0002
	rejectId=target.id;
}
	
<%-- 거절 이벤트--%>
function rejectClick(target){
// 	console.log(rejectId);// TRADE20220824-0002
// 	let tradeNo = $(target).parent().find('[name="tradeNo"]').prevObject[0].id;
	
	$('#rejectTradeNo').val(rejectId);
	
	let tradeNote = $('textarea[name="tradeNote"]').val();
	$('input[name="tradeNote"]').val(tradeNote);
	
	$('#rejectForm').submit();
};

<%-- 취소 이벤트 --%>
function cancleClick(target){
	let tradeNo = $(target).parent()[0].id; // TRADE20220824-0002
	$('#cancleTradeNo').val(tradeNo);
	
	$('#cancleForm').submit();
}

</script>