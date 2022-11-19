<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 6.      황단비      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
	
<%--  	<link href="${cPath }/resources/dashboard3/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">		 --%>
<%-- 	<link href="${cPath}/resources/dashboard3/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet"> --%>
<link href="${cPath }/resources/css/tableCustom.css" rel="stylesheet">

		<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
        
            <!-- row -->
			<div class="container-fluid">
						<!-- 파란카드 템플릿 -->
<div class="row page-titles">
  <div class="col-sm-6 p-md-0">
      <div class="welcome-text">
          <h4><strong>가맹비 관리</strong></h4>
          <span>가맹비 미납 내역이 있는 가맹점을 조회합니다.</span>
      </div>
  </div>
  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="javascript:void(0)">매장관리</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">가맹비 관리</a></li>
      </ol>
  </div>
</div>
<div class="row">
			<div id="searchUI">
							<button type="button" class="btn btn-primary btn-m" data-bs-toggle="modal" data-bs-target="#sendModal">발송</button>
				<div class="mb-3 col-md-2 searchKeword cb-wp30 cb-float-right">
					<div class="input-group search-area">
						<select name="searchType"
							class="dropdown bootstrap-select default-select form-control wide">
							<option value>전체</option>
							<option value="franName">가맹점명</option>
							<option value="franId">가맹점아이디</option>
							<option value="ownerId">가맹점주아이디</option>
						</select> <input type="text" name="searchWord" list="choise"  class="form-control">
						<input id="searchBtn"type="button" value="검색" class="btn light btn-primary" />
						<datalist id="choise">
                             <c:forEach items="${franNameList }" var="fr">
	                             <option value="${fr.franName }" ></option>
	                         </c:forEach>
                        </datalist>
					</div>
				</div>

			</div>
		</div>
                    <div >
                        <div class="card">
                            <div class="card-body">
                            <div class="row">
                            
						<div><input style="visibility:hidden"/></div>
                            <div class="row">
                   		<div>
                    		<p id="totalRecord" class="searchKeword"></p>
                    	</div>
					<div class="col-12">
						<div class="table-responsive">
						<div id="divID">
							<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="min-width: 845px;">
								<thead>
								<tr>
									<th style="width: 50px;">
										<div
											class="custom-control custom-checkbox checkbox-success check-lg me-3">
											<input type="checkbox" class="custom-control-input" id="checkAll" required="" onchange="clickAll(this)">
											<label class="custom-control-label" for="checkAll"></label>
										</div>
									</th>
									<th class="cb-tAlign-center">순번</th>
									<th class="cb-tAlign-center">가맹점명</th>
									<th class="cb-tAlign-center">가맹점주명</th>
									<th class="cb-tAlign-center">총미납금액</th>
									<th class="cb-tAlign-center">가맹비미납횟수</th>
									<th class="cb-tAlign-center">마지막납부일</th>
								</tr>
							</thead>
								<tbody id="listBody">
<!-- 									<tr> -->
<!--                                         <td> -->
<!-- 											<div class="custom-control custom-checkbox checkbox-success check-lg me-3"> -->
<!-- 												<input type="checkbox" class="custom-control-input" id="customCheckBox2" required=""> -->
<!-- 												<label class="custom-control-label" for="customCheckBox2"></label> -->
<!-- 											</div> -->
<!-- 										</td> -->
<!-- 										<td data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">1</td> -->
<!-- 										<td data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">대전오류점</td> -->
<!-- 										<td data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">아무개</td> -->
<!-- 										<td data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">2,000,000</td> -->
<!-- 										<td data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">2</td> -->
<!-- 										<td data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">2022-06-01</td> -->
<!-- 									</tr> -->
								</tbody>
							</table>
							<div class="pagination_fg">	
								<div class="pagingArea"></div>
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


        <div class="modal fade" id="sendModal">
			<div class="modal-dialog modal-dialog-centered " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">공문 발송</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal">
						</button>
					</div>
						<input type="hidden" name="_method" value="delete">
						<div class="modal-body">
							공문을 발송하시겠습니까? <br>
						</div>
						<div class="modal-footer">
							<button id="sendBtn" type="button" class="btn light btn-primary">발송</button>
							<button type="button" class="btn light btn-danger light"
								data-bs-dismiss="modal">취소</button>
						</div>
				</div>
			</div>
		</div>
 								 <!-- Large modal -->
                                    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered ">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title">미납 상세</h3>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                                                    </button>
                                                </div>
                                                <div class="modal-body">
													<table id="example5" class="display dataTable no-footer mAuto" >
														<thead>
															<tr  class="cb-tAlign-center">
																<th>순번</th>
																<th>미납금액</th>
																<th>납부기준일</th>
															</tr>
														</thead>
														<tbody id="datilBody">
														</tbody>
													</table>

												</div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
		</div>
	</div>
</div>
<form id="searchForm" method="get" action="${cPath }/head/frPayment" >
<sec:csrfInput/>
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
</form>

<form id="sendForm" method="post" action="${cPath}/head/frPayment/">
<sec:csrfInput/>
	<input type="hidden" name="ownerIds"/>
</form>
    <!--**********************************
        Scripts
    ***********************************-->
	<!-- Datatable -->
<%--     <script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script> --%>
	<!-- Apex Chart -->
	<script src="${cPath}/resources/dashboard3/vendor/apexchart/apexchart.js"></script>	
	
<%-- 	<script src="${cPath}/resources/dashboard3/vendor/sweetalert2/dist/sweetalert2.min.js"></script> --%>
<%--     <script src="${cPath}/resources/dashboard3/js/plugins-init/sweetalert.init.js"></script> --%>
	
	
	<script>
	
// 	(function($) {
	 
// 		var table = $('#example5').DataTable({
// 			searching: false,
// 			paging:true,
// 			select: false,
// 			//info: false,         
// 			lengthChange:false 
			
// 		});
// 		$('#example tbody').on('click', 'tr', function () {
// 			var data = table.row( this ).data();
			
// 		});
	   
// 	})(jQuery);

	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';

	let listBody=$('#listBody');
	let pagingArea = $('.pagingArea');
	let searchUI = $("#searchUI");
	let totalRecord = $('#totalRecord');
	
	//페이징 구문 동작
	$('.pagingArea').on('click','a',function(event){
		let page = $(this).data("page"); //a 태그
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	
	let makeSingleTr = function(index, fee){
		let td1 = $('<td>').append(
					$('<div>').attr({
						"class" : "custom-control custom-checkbox checkbox-success check-lg me-3"
					}).append(
						$('<input>').attr({
							"type" : "checkbox" 
							,"class" : "custom-control-input" 
							,"name" : "chk"
							,"value" : fee.ownerId
							,"onchange" : "checkSearch(this)"
							,"required" : ""
						})
						,$('<label>').attr({
							"class" : "custom-control-label" 
							,"for" : "customCheckBox2"
						})
					)
				);
		 return $('<tr>').attr({
					 		"id" : fee.franId
				 		})
					 	.append(
							 td1
							 ,$('<td>').attr({
									"data-bs-toggle" : "modal" 
									,"data-bs-target" : ".bd-example-modal-lg"
									,'id' : fee.franId
			        				 ,"class" : "cb-tAlign-center"
									}).html(fee.rnum)
							 ,$('<td>').attr({
									"data-bs-toggle" : "modal" 
									,"data-bs-target" : ".bd-example-modal-lg"
									,'id' : fee.franId
			        				 ,"class" : "cb-tAlign-center"
									}).html(fee.franName)
							 ,$('<td>').attr({
									"data-bs-toggle" : "modal" 
									,"data-bs-target" : ".bd-example-modal-lg"
									,'id' : fee.franId
			        				 ,"class" : "cb-tAlign-center"
									}).html(fee.ownerName)
							 ,$('<td>').attr({
								    "type" : "number" 
								    ,"maxFractionDigits" : "3"
				        			,"class" : "cb-tAlign-right"
									}).html(fee.feeCost.toLocaleString('ko-KR'))
							 ,$('<td>').attr({
									"data-bs-toggle" : "modal" 
									,"data-bs-target" : ".bd-example-modal-lg"
									,'id' : fee.franId
			        				 ,"class" : "cb-tAlign-center"
									}).html(fee.feeOverdue)
							 ,$('<td>').attr({
									"data-bs-toggle" : "modal" 
									,"data-bs-target" : ".bd-example-modal-lg"
									,'id' : fee.franId
			        				 ,"class" : "cb-tAlign-center"
									}).html(fee.feeDate)
						    );
	}
// 	fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"
	let searchForm = $("#searchForm").on("submit",function(event){
		event.preventDefault();
		let url = this.action;
		let method = this.method;
		let data = $(this).serialize();
	
		$.ajax({ // 폼태그의 동기요청을 비동기로 바꾸려고한다~
			url : url,
			data : data,
			method : method,
			dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
			,
			success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
				let feeList = resp.fee.dataList;
				console.log(resp);
				
				let trTags =[];
				if(feeList && feeList.length>0){ // javascript는 list만 넣어도 true false 반환된다.
						$(feeList).each(function(index, fee){ // this = member
							trTags.push(makeSingleTr(index, fee));
						});                                                                                                      
				} else{        
					let trTag = $("<tr>").html(
							$("<td>").html("미납 내역이 존재하지 않습니다.").attr({
								"class" : "cb-tAlign-center"
								,"colspan":"7"
							})
						);
					trTags.push(trTag);                                                    
				}
				listBody.html(trTags);
				pagingArea.html(resp.fee.pagingHTMLBS);
				totalRecord.html("<strong>총 건수 : " +resp.fee.totalRecord+"</strong>");

			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	}).submit();
 
 $("#searchBtn").on("click",function(){
		// name을 가진 입력태그(:input 입력용 input태그들 선택)
// 		console.log("눌렸다!");
		searchForm.get(0).reset(); // 클리어
		let inputs = searchUI.find(":input[name]"); 
		$(inputs).each(function(idx, input){ // each : jquery 반복문
			let name = $(this).attr('name'); // input
			let value = $(this).val();
			searchForm.find("[name="+name+"]").val(value);
		});
		searchForm.submit();
	});
 
 let makeDetailSingleTr = function(index, feePay){
	 return $('<tr>').append(
			 		$('<td>').attr({
							"class" : "cb-tAlign-center"
			 		}).html(feePay.rnum)
			 		,$('<td>').attr({
							"class" : "cb-tAlign-center"
			 		}).html(feePay.feeCost)
			 		,$('<td>').attr({
							"class" : "cb-tAlign-center"
			 		}).html(feePay.feeSdate)
	 			);
 }
 
$(document).on("click",'td[id]',function(){
	let franId = this.id;
	
	$.ajax({
		url : "${cPath}/head/frPayment/"+franId,
		data : {
			"franId" : franId
		},
		method : "post",
		dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
		,
		beforeSend : function(xhr)
		{
			   xhr.setRequestHeader(header,token);
			},
		success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
// 			console.log(resp);
			let feeList = resp.detailFee;
			
			let trTags =[];
			if(feeList && feeList.length>0){ // javascript는 list만 넣어도 true false 반환된다.
					$(feeList).each(function(index, feePay){ // this = member
						trTags.push(makeDetailSingleTr(index, feePay));
					});                                                                                                      
			} else{        
				let trTag = $("<tr>").html(
						$("<td>").attr("colspan","3")
								 .html("이거 뜰일없음")
					);
				trTags.push(trTag);                                                    
			}
			$('#datilBody').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

var chechArr = new Array();
var checkStr = "";
function checkSearch(target){
	console.log(target);
	var checked = target.value;
	var confirmCheck = target.checked; //check여부 확인
    //console.log("체크박스 선택값 : "+checked);
    //console.log("선택여부 : "+confirmCheck);
    
    if(confirmCheck == true){
        console.log("check");
        chechArr.push(checked);
    }else{
    	chechArr.splice(chechArr.indexOf(checked), 1); // check value filter 배열내용 삭제       
    }
    checkStr = chechArr.join( ',' );
    console.log("!!!!",checkStr);
//     $('#searchSelect').val(checkStr); // input은 String을 넘거야됨. Object는 안됨
//     console.log("이건가: ",searchSelect.value);
}

<%-- 미납 공문 발송 --%>
$('#sendBtn').on("click",function(){
	console.log(chkArr.length);
	console.log(checkStr.length);
	if(chkArr.length!=0 || checkStr.length){
		if($("#checkAll")[0].checked){
			$('[name="ownerIds"]').val(chkArr);
		}else{
			$('[name="ownerIds"]').val(checkStr);
		}
			$('#sendForm').submit();
	}else{
		alert("공문 발송 대상을 선택해주세요.");
		history.go(0);
	}
});

let chkArr = new Array();
function clickAll(target){
	var confirmCheck = target.checked;
	console.log(confirmCheck);
// 	console.log($('[name="chk"]').val());
	
let nodeList = document.querySelectorAll('[name="chk"]');
// 	console.log(document.querySelectorAll('[name="chk"]'));
	if(confirmCheck == true){
		$(nodeList).each(function(idx, node){
// 			console.log(node.defaultValue);
			chkArr.push(node.defaultValue);
		});
	}else{
		chkArr.length=0;
	}
	console.log(chkArr);
}

<%-- 전체 체크-  --%>
$(document).ready(function() {
	$("#checkAll").click(function() {
		if($("#checkAll").is(":checked")){
			$("input[name=chk]").prop("checked", true);
		}
		else{
			$("input[name=chk]").prop("checked", false);
		}
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		if(total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true); 
	});
});
	</script>
	
<!-- </body> -->