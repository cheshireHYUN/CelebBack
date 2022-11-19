<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      이혜원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
	<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">

<!--**********************************
    Content body start
***********************************-->
<div class="content-body">
	<div class="container-fluid ">
	
				<!-- row -->
				<div class="row page-titles">
				  <div class="col-sm-6 p-md-0">
				      <div class="welcome-text">
				          <h4><strong>금일 예약 요청현황</strong></h4>
				          <span>금일 요청된 예약건을 수락 및 거절합니다.</span>
				      </div>
				  </div>
				  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				      <ol class="breadcrumb">
				          <li class="breadcrumb-item"><a href="javascript:void(0)">예약관리</a></li>
				          <li class="breadcrumb-item active"><a href="javascript:void(0)">예약 요청현황</a></li>
				      </ol>
				  </div>
				</div>
		<div>
			<div class="card">
				<div class="card-body">
                   <div class="custom-tab-1">
					<ul class="nav nav-tabs mb-4 light">
						<li class=" nav-item">
							<a href="#navpills-1" class="nav-link active" data-bs-toggle="tab" aria-expanded="false"><strong>오늘의 예약</strong></a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="navpills-1" class="tab-pane active">
							<div class="content-wrapper">
								<!-- row -->
								<div class="container-fluid bg-gray">
									<div class="row order-row" id="masonry">
										<c:if test="${not empty reqResvList }">
											<c:forEach items="${reqResvList }" var="reqResv">
												<c:if test="${reqResv.lguName eq '예약요청'}">
												<div class="card-container cb-wp25">
													<div class="card shadow-sm">
														<div class="card-header bg-danger text-white">
															<div id="${reqResv.resvId }" class="cb-float-right">
																<input type="button" style="width: 110px;font-size: 20px;" class="btn btn-danger light btn-xs" data-bs-toggle="modal" data-bs-target="#reqDetailModal" value="상세보기"/>
															</div>
															<h3 class="text-white">${reqResv.payallYn }</h3>
														</div>
														<div class="card-body">
															<div>
																<strong>예약일자</strong>
																<p class="frSales card-intro-itle">${reqResv.resvDate}</p>
															</div>
															<div>
																<strong>예약시간</strong>
																<p class="frSales card-intro-title">${reqResv.resvTime}
															</div>
															<div>
																<strong>예약인원</strong>
																<p class="frSales card-intro-title">${reqResv.resvPcnt }</p>
															</div>
																<div id="${reqResv.resvId }" name="resvId" class="cb-float-right">
																	<input type="button" class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#acceptModal" value="수락"/>
																	<input type="button" onclick="clickReject(this)" class="btn btn-danger btn-xs" data-bs-toggle="modal" data-bs-target="#rejectModal" value="거절"/>
																</div>
														</div>
													</div>
												</div>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${empty reqResvList}">
											<h4>금일 예약 요청 내역이 없습니다.</h4>													
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
<!--**********************************
    Content body end
***********************************-->


<!-- 요청상세모달 -->
<div class="modal fade" id="reqDetailModal">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">예약상세내역</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal">
               </button>
            </div>
            <div class="modal-body">
            	<div class="basic-form">
	            	<div class="col-12">
						<div class="table-responsive" >
							<div id="divID">
								<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" >
									<thead id="tHead">
										<tr>
				                           <th>주문메뉴</th>
				                           <th>주문수량</th>
				                           <th>주문금액</th>
			                        	</tr>
									</thead>
									<tbody class="reqDetail">
									</tbody>
								</table>
							</div>
						</div>
	               </div>
               </div>
            </div>
           	<div class="modal-footer">
           		<button type="button" class="btn btn-danger light btn-xs" data-bs-dismiss="modal">닫기</button>
       		</div>
        </div>
    </div>
</div>

<!-- 요청거절모달 -->
<div class="modal fade" id="rejectModal">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">예약거절</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal">
				</button>
			</div>
				<input type="hidden" name="_method" value="delete">
				<div class="modal-body">
					거절사유를 입력하세요<br>
					<textarea class="form-control" rows="4" name="resvNote" id="comment" style="height: 100px;"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary light"
						data-bs-dismiss="modal">취소</button>
					<button id="rejectBtn" onclick="rejectClick(this)" type="button" class="btn btn-danger">확인</button>
				</div>
		</div>
	</div>
</div>

<%-- 예약요청 거절 --%>
<form id="rejectForm" method="post" action="${cPath }/fr/reserve/rejectResv/reject">
<sec:csrfInput/>
	<input type="hidden" name="_method" value="PUT">
	<input type="hidden" id="rejectResvId" name="resvId"/>
	<input type="hidden" name="resvNote"/>
</form>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- script -->
<script type ="text/javascript" src="${cPath }/resources/js/fr/reserve/resvReqList.js"></script>

<!-- 시큐리티 토큰 -->
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>
