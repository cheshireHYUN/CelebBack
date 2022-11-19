<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      황단비      최초작성
* 2022. 9. 9.      서재원      카드 간 간격 수정
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="icon" type="image/png" sizes="16x16"	href="./images/favicon.png">
<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
<%-- <link href="${cPath}/resources/dashboard3/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet"> --%>
<%-- <link href="${cPath}/resources/dashboard3/vendor/bootstrap/scss/_utilities.scss" rel="stylesheet"> --%>
<style>
img { 
 width : 100%;
 height: 100%; 
}
</style>

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
					<h4><strong>쿠폰관리</strong></h4>
					<span>쿠폰을 등록, 수정, 삭제, 발송합니다.</span>
				</div>
			</div>
			<div
				class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">쿠폰관리</a></li>
					<li class="breadcrumb-item active">
						<a href="javascript:void(0)">쿠폰관리</a>
					</li>
				</ol>
			</div>
		</div>
<div class="row">
			<div id="searchUI">
			<input type="button" class="btn btn-primary btn-m" data-bs-toggle="modal" data-bs-target="#createModal" value="등록">
				<div class="mb-3 col-md-2 searchKeword cb-wp30 cb-float-right">
					<div class="input-group search-area">
						<select name="searchType"
							class="dropdown bootstrap-select default-select form-control wide">
							<option>전체</option>
							<option>쿠폰명</option>
							<option>쿠폰내용</option>
						</select> <input type="text" name="searchWord" class="form-control">
						<input id="searchBtn" type="button" value="검색" class="btn light btn-primary" />

					</div>
				</div>
				
			</div>
			
					
		</div>
		<div>
			<div class="card card-body">
		<div class="row">
			<div class="col-12">
				<div class="table-responsive">
					<p id="totalRecord" class="searchKeword"></p>
					<table id="example5"
						class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable"
						style="min-width: 845px;">
						<thead>
							<tr class="cb-tAlign-center">
								<th style="width:  7%;">순번</th>
								<th style="width:  30%;">쿠폰명</th>
								<th style="width:  35%;">쿠폰내용</th>
								<th style="width:  10%;">쿠폰종료일자</th>
								<th style="width:  9%;"></th>
								<th style="width:  9%;"></th>
							</tr>
						</thead>
						<tbody id="listBody">
<!-- 																<tr> -->
<!-- 																	<td data-bs-toggle="modal" data-bs-target="#updateModal">1</td> -->
<!-- 																	<td data-bs-toggle="modal" data-bs-target="#updateModal">어린이날쿠폰</td> -->
<!-- 																	<td data-bs-toggle="modal" data-bs-target="#updateModal">어린이날을 맞아 셀럽백 스테이크하우스 할인...</td> -->
<!-- 																	<td> -->
<!-- 																	<div class="bootstrap-modal"> -->
<!-- 																		<button type="button" class="btn btn-rounded btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#basicModal">발송</button> -->
<!-- 																		</div> -->
<!-- 																	</td> -->
<!-- 																	<td> -->
<!-- 																		<input type="button" class="btn btn-rounded btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" value="삭제"> -->
<!-- 																	</td> -->
<!-- 																</tr> -->
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
	<!--**********************************
            Content body end
        ***********************************-->

	<!-- Modal -->
<form id="sendForm" method="post" action="${cPath }/head/coupon/send">
<sec:csrfInput/>
    <div class="modal fade" id="sendModal">
		<div class="modal-dialog  modal-dialog-centered " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">쿠폰 발송</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>
				</div>
				<div class="modal-body">
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn light btn-danger light" data-bs-dismiss="modal">취소</button>
					<button id="realSendBtn"  type="button" class="btn btn-dark">발송</button>
				</div>
			</div>
		</div>
	</div>
</form>
	<!-- create modal -->
<form:form id="createForm" method="post" action="${cPath }/head/coupon" enctype="multipart/form-data" modelAttribute="cpn">
<sec:csrfInput/>
	<div class="modal fade" id="createModal">
		<div class="modal-dialog modal-dialog-centered " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">쿠폰 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>
				</div>
				<div class="modal-body">
					<div class="cb-pt10">
						쿠폰명 <form:input type="text" path="cpnName" class="form-control" value=""/>
					</div>
					<div class="cb-pt10">
						쿠폰내용
						<div class="mb-3"></div>
						<form:textarea path="cpnContent" class="form-control" rows="4" id="comment"
							style="height: 188px;"/>
					</div>
					<div class="cb-pt10">
						종료날짜 <form:input type="date" path="cpnDate"  class="form-control"/>
					</div>
					<div class="cb-pt10">
						메뉴종류
						<form:select  onchange="checkSearch(this)"  path="menuId"
							class="dropdown bootstrap-select default-select form-control wide">
							<option value="">전체</option>
							<c:forEach items="${menuLguList }" var="lgu">
								<option value="${lgu.menuId }" >${lgu.menuName }</option>
							</c:forEach>
						</form:select>
					</div>
					<div class="cb-pt10">
						쿠폰종류
						<form:select id="selectBox" onchange="checkSearch(this)"  path="cpnLgu"
							class="dropdown bootstrap-select default-select form-control wide">
							<option value="">전체</option>
							<c:forEach items="${cpnLguList }" var="lgu">
								<option value="${lgu.lguId }" >${lgu.lguName }원 할인쿠폰</option>
							</c:forEach>
						</form:select>
					</div>
					<div class="cb-pt10">
						쿠폰이미지(기존 이미지 변경 원할시에 선택)
						<div class="form-file">
							<form:input type="file" class="form-file-input form-control" path="atchFile"/>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
					<button id="createBtn" type="submit" class="btn btn-dark">저장</button>
				</div>
			</div>
		</div>
	</div>
</form:form>
	<!-- delete modal -->
	<div class="modal fade" id="deleteModal">
		<div class="modal-dialog modal-dialog-centered " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">쿠폰 삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>
				</div>
				<form id="deleteForm" action="${cPath }/head/coupon" method="post">
<sec:csrfInput/>
					<input type="hidden" name="_method" value="delete">
					<div class="modal-body">
						쿠폰을 삭제하시겠습니까? <br> 삭제하면 되돌릴 수 없습니다.
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
						<button id="deleteBtn" type="button" class="btn btn-dark">삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>


<form id="updateForm"method="post" action="">
<sec:csrfInput/>
	<input type="hidden" name="_method" value="PUT">
	<div class="modal fade  " id="updateModal">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">쿠폰 상세</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
					<button id="updateBtn" type="button" class="btn btn-dark">수정</button>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>
</div>
<form id="searchForm" method="get" action="${cPath }/head/coupon">
<sec:csrfInput/>
	<input type="hidden" name="page" /> 
	<input type="hidden" name="searchType" />
	<input type="hidden" name="searchWord" />
</form>
<!--**********************************
        Scripts
    ***********************************-->
<!-- Datatable -->
<%-- <script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script> --%>
<!-- Apex Chart -->
<script
	src="${cPath}/resources/dashboard3/vendor/apexchart/apexchart.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<script>

// 	(function($) {

// 		var table = $('#example5').DataTable({
// 			searching : false,
// 			paging : true,
// 			select : false,
// 			//info: false,         
// 			lengthChange : false

// 		});
// 		$('#example tbody').on('click', 'tr', function() {
// 			var data = table.row(this).data();

// 		});

// 	})(jQuery);
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	
$("#createForm").validate({
	rules:{
		cpnName:"required"
		, cpnContent:"required"
		, cpnDate:"required"
		, menuId:"required"
		, cpnLgu:"required"
	}, messages : {
		cpnName:"필수 항목"
		, cpnContent:"필수 항목"
		, cpnDate:"필수 항목"
		, menuId:"필수 항목"
		, cpnLgu:"필수 항목"
	}
});

var updateId="";
var deleteId="";
var sendId="";
function deleteClick(target){
	console.log(target);
	deleteId = target.id;
}
function updateClick(target){
// 	console.log(target.id);
	updateId = target.id;
}
function sendClick(target){
	console.log(target.id);
	sendId = target.id;
}

	let CPATH = $.CPATH;
	let totalRecord = $('#totalRecord');
	let listBody = $('#listBody');
	let pagingArea = $('.pagingArea');
	let searchUI = $("#searchUI");

	<%-- sendModal 이벤트 --%>
	let sendModal = $(document).on("click","[name='sendBtn']",function(){
		let cpnId=this.id;
		let cpndate = this.data;
		let url = CPATH+"/head/coupon/"+cpnId;
		console.log(url);
		$.ajax({
			url : url
			,method:'post'
			,data : {
				"cpnId" : cpnId
				,"cpnDate" : cpndate
			}
			,dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
				,beforeSend : function(xhr)
				{
				   xhr.setRequestHeader(header,token);
				}
			,success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
//					console.log("resp");
				console.log(resp);
					let cpn = resp.cpn.dataList

					let datalist = [];
					
					for(var i=0; i<resp.memIdList.length;i++){
						var optionTag = $('<option>').attr({
							"value" : resp.memIdList[i].memId
							,"label" : resp.memIdList[i].memName
						});
						datalist.push(optionTag);
					}
					
				let tags1= $("<div>")
							.html("쿠폰명")
							.attr({
								"class" : "cb-pt10"
							})
							.append(
								$("<input>").attr({
										"type" : "text"
										,"name" : "cpnName"
										,"class": "form-control"
										,"value" : resp.cpn.cpnName
									})
							);
					let tags2= $('<div>')
								.html('쿠폰내용')
								.attr({
									"class" : "cb-pt10"
								}).append(
									$('<textarea>').attr({
									"class" : "form-control"
									,"name" : "cpnContent"
									,"rows" : "4"
									,"id":"comment"
									,"style" : "height: 188px;"
								}).html(resp.cpn.cpnContent)
							);
					
					let tags3= $('<div>').attr({
							"class" : "cb-pt10"
							,"id" : "changeOwnerList"
						}).append(
							$('<label>').attr({
								"class" : "col-sm-5 col-form-label cb-display-b"
							}).html("발송자지정")
							,$('<div>').attr({
								"class" : "form-check form-check-inline"
							}).append(
								$('<label>').attr({
									"class" : "form-check-label"
								}).html("모든회원")
								.append(
									$('<input>').attr({
										"type" : "checkbox"
										,"class" : "form-check-input"
										,"onchange" : "checkMem(this)"
										,"id" : "allMem"
									})
								)
							)
							,$('<div>').attr({
								"class" : "form-check form-check-inline"
							 	,"id" : "partParent"
							}).append(
								$('<label>').attr({
									"class" : "form-check-label"
								}).html("회원지정")
								  .append(
									$('<input>').attr({
										"type" : "checkbox"
										,"class" : "form-check-input"
										,"onchange" : "checkMem(this)"
										,"id" : "partMem"
									})
								  )
							)
						);
					let tags4 = $('<div>').attr({
						"class" : "row"
							,"id" : "partChild"
				     });
					let result = $('<div>').attr({
									"id" : resp.cpn.cpnId
									,"class" : "claz"
								})			
								.append(
									tags1
									,tags2
									,tags3
									,$('<input>').attr({
											"type" : "hidden"
											,"name" : "cpnId"
											,"value":resp.cpn.cpnId
										})
										,$('<datalist>').attr({
											"id" : "choise"
										}).append(datalist)
								)
				sendModal.find(".modal-body").html(result);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
			
			});
	});	
	
	
	<%-- updateModal 열림 이벤트 --%>
	let updateModal = $(document).on("click",'[data-bs-target="#updateModal"]',function(){
		let cpnId=this.id;
// 		console.log(cpnId);
		let url = CPATH+"/head/coupon/"+cpnId;
		
		$.ajax({
			url : url,
			method : 'post',
			data : {
				"cpnId" : cpnId
			},
			dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
			,
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
				console.log("resp");
				console.log(resp);
				
				let imgTag = null;
				
				if(resp.cpn.attatch.profileImg != null){
					imgTag= $("<div>").append(
								$('<img>').attr({
									"src" : "data:image/*;base64,"+resp.cpn.attatch.profileImg
								})		
						);
					}

				let tags1= $("<div>")
							.html("쿠폰명")
							.attr({
								"class" : "cb-pt10"
							})
							.append(
								$("<input>").attr({
										"type" : "text"
										,"name" : "cpnName"
										,"class": "form-control"
										,"value" : resp.cpn.cpnName
									})
							);
				let tags2= $('<div>')
							.html('쿠폰내용')
							.attr({
								"class" : "cb-pt10"
							}).append(
								$('<textarea>').attr({
								"class" : "form-control"
								,"name" : "cpnContent"
								,"rows" : "4"
								,"id":"comment"
								,"style" : "height: 188px;"
							}).html(resp.cpn.cpnContent)
						);
				let tag3 = $('<div>').append(
					$('<input>').attr({
						"type" : "date" 
						,"name" : "cpnDate" 
						,"class" : "form-control"
					})		
				);
				let result = $('<div>').attr({
								"id" : resp.cpn.cpnId
								,"class" : "claz"
							})			
							.append(
								imgTag
								,tags1
								,tags2
								,tag3
							);
			updateModal.find(".modal-body").html(result);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		})
// 			}).on('hidden.bs.modal', '#updateModal', function(event) {
// 		console.log(event.target); // modal 가져온거임
// 		$(event.target).find(".modal-body").empty();
	});

	//페이징 구문 동작
	$('.pagingArea').on('click', 'a', function(event) {
		let page = $(this).data("page"); //a 태그
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});

	let makeSingleTr = function(index, cpn) {
		return $('<tr>').append(
				$("<td>").html(cpn.rnum)
						.attr({
							"id" : cpn.cpnId,
							"data-bs-toggle" : "modal",
							"data-bs-target" : "#updateModal",
							"onclick" : "updateClick(this)",
							"class" : "cb-tAlign-center"
						})
				, $("<td>").html(cpn.cpnName)
					.attr({
						"id" : cpn.cpnId,
						"data-bs-toggle" : "modal",
						"data-bs-target" : "#updateModal",
						"onclick" : "updateClick(this)",
						"class" : "cb-tAlign-left"
					})
				, $("<td>").html(cpn.cpnContent)
					.attr({
						"id" : cpn.cpnId,
						"data-bs-toggle" : "modal",
						"data-bs-target" : "#updateModal",
						"onclick" : "updateClick(this)",
						"class" : "cb-tAlign-left"
					})
				, $("<td>").html(cpn.cpnDate)
					.attr({
						"id" : cpn.cpnId,
						"data-bs-toggle" : "modal",
						"data-bs-target" : "#updateModal",
						"onclick" : "updateClick(this)",
						"class" : "cb-tAlign-center"
					})
				, $("<td>").append($('<div>')
					.attr({
						"class" : "bootstrap-modal"
					})
					.append($('<input>')
						.attr({
							"type" : "button"
							,"class" : "btn light btn-info btn-xxs"
							,"data-bs-toggle" : "modal"
							,"data-bs-target" : "#sendModal"
		        			,"id" : cpn.cpnId
		        			,"data" : cpn.cpnDate
	        				,"name" : "sendBtn"
							,"value" : "발송"
			        		,"onclick" : "sendClick(this)"
						})
					)
				)
				, $("<td>").append($("<div>")
					.attr({
						"class" : "bootstrap-modal"
					})
					.append($("<input>")
							.attr({
								"type" : "button"
								,"class" : "btn light btn-danger btn-info btn-xxs"
								,"data-bs-toggle" : "modal"
								,"data-bs-target" : "#deleteModal"
								,"value" : "삭제"
								,"id" :  cpn.cpnId
								,"onclick" : "deleteClick(this)"
							})
						)
					)
			)
			.attr({
				"id" : cpn.cpnId
			});

	}

	let searchForm = $("#searchForm").on("submit", function(event) {
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
						let cpnList = resp.cpn.dataList;
						// 				console.log(resp);

						let trTags = [];
						if (cpnList && cpnList.length > 0) { // javascript는 list만 넣어도 true false 반환된다.
							$(cpnList).each(function(index, cpn) { // this = member
								trTags.push(makeSingleTr(index, cpn));
							});
						} else {
							let trTag = $("<tr>").html(
									$("<td>").attr("colspan", "5").html(
											"등록된 쿠폰이 없습니다."));
							trTags.push(trTag);
						}
						listBody.html(trTags);
						pagingArea.html(resp.cpn.pagingHTMLBS);
						totalRecord.html("<strong>총 건수 : "
								+ resp.cpn.totalRecord + "</strong>");
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});

				return false;
			}).submit();

	$("#searchBtn").on("click", function() {
		// name을 가진 입력태그(:input 입력용 input태그들 선택)
		console.log("눌렸다!");
		searchForm.get(0).reset(); // 클리어
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input) { // each : jquery 반복문
			let name = $(this).attr('name'); // input
			let value = $(this).val();
			searchForm.find("[name=" + name + "]").val(value);
		});
		searchForm.submit();
	});
	
	<%-- 쿠폰 수정 --%>
	 $("#updateBtn").on("click",function(){
		let updateForm = $("#updateForm");
	 	let id = updateForm.find(".claz")[0].id;
	 	console.log(id);
	 	document.getElementById("updateForm").action = "${cPath}/head/coupon/"+id;
	 	
	  	document.getElementById("updateForm").submit();
	 });
	 
	 <%-- 쿠폰 등록--%>
// 	 $("#createBtn").on("click",function(){
// 		 document.getElementById("createForm").submit();
// 	 });
	 
	 <%-- 쿠폰 삭제 --%>
	 $("#deleteBtn").on("click",function(){
		let deleteForm = $("#deleteForm");
		console.log(deleteId);
	 	document.getElementById("deleteForm").action = "${cPath}/head/coupon/"+deleteId;
	 	
	  	document.getElementById("deleteForm").submit();
	 });
	 
// 	 $(document).on('hidden.bs.modal','#updateModal',function(event){
// 			console.log(event.target); // modal 가져온거임
// 			$(event.target).find(".modal-body").empty();
// 		});

<%-- selecBox 바인딩 --%>
	var checkStr = "";
	function checkSearch(target){
		console.log(target.options[target.selectedIndex].value);
        checkStr = target.options[target.selectedIndex].value;
	}

<%-- 쿠폰 발송 - child record --%>	
	function returnChild(p_arg){
     	return $('<div>').attr({
				    	"class" : "claz2" 
				     }).append(
			     		$('<input>').attr({
			     			"type" : "text"
			     			,"class" : "form-control searchKeword cb-wp80"
			     			,"name" : "memIdList["+p_arg+"]"
				    		,"list" : "choise"
			     		})
			     		,$('<a>').attr({
			     			"href" : "javascript:void(0)"
			     			,"class" : "badge badge-dark searchKeword"
			     			,"onclick" : "clickPlus()"
			     		}).html("+")
			     		,$('<a>').attr({
			     			"href" : "javascript:clickMinus()"
				        		,"class" : "badge badge-light"
				        		//,"onclick" : "clickMinus(this); "
				        	}).html("-")
			     		); 
	 }
	
<%-- 쿠폰 발송 모달 동적 생성 --%>
	let cnt = 0;
	 let cntRslt = ($('.claz2').length-1)/3;
	 function checkMem(target){
		 console.log(target);
			var checked = target.id;
			var confirmCheck = target.checked; //check여부 확인
	        console.log("체크박스 선택값 : "+checked);
	        console.log("선택여부 : "+confirmCheck);
	        
	        if(checked=="partMem" && confirmCheck==true){
	        	cnt=0;
	        	$('#allMem').prop("checked", false);
	        	$('.claz').append(returnChild(0));
	        	cnt = cnt+1;
				
	        }if(checked=="partMem" && confirmCheck==false ){
	        	$('.claz2').remove();
	        }if(checked=="allMem" && confirmCheck==true){
	        	$('#partMem').prop("checked", false);
	        	$('.claz2').remove();
	        }
	        
	 }
	 
	 function clickPlus(){
		 $('.claz').append(returnChild(cnt));
    	cnt = cnt+1;
//	     console.log(($('.claz2').length-1)/3);
	 }
	 
	 function clickMinus(target){
		 if(cnt>1){
//			console.log($(".claz2").get(0));
			$("div.claz2:last-child").remove(); 
		    cnt = cnt-1;
			 
		 }
//		 $('.claz:last-child').remove();
	 }
	 <%-- 쿠폰 발송 --%>
	 $('#realSendBtn').on("click",function(){
		$('#sendForm').submit();
	 });
</script>

