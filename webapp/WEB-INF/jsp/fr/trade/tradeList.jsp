<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      이혜원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%-- 	<link href="${cPath}/resources/dashboard3/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet"> --%>
<div class="content-body">
	<!-- row -->
	<div class="container-fluid ">
		<!-- 파란카드 템플릿 -->
		<div class="row page-titles">
			<div class="col-sm-6 p-md-0">
				<div class="welcome-text">
					<h4>
						<strong>트레이딩 내역</strong>
					</h4>
					<span>트레이딩 내역을 전체 조회합니다.</span>
				</div>
			</div>
			<div
				class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">재고트레이딩</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">트레이딩 내역</a></li>
				</ol>
			</div>
		</div>

		<div>
			<div class="card cb-mb-1r">
				<div class="card-body cb-pb-05r">
					<div class="row">
						<div id="searchUI">
							<div class="mb-3">
<!-- 							</div> -->
<!-- 							<div id="filter"> -->
								<label class="col-sm-1 col-form-label cb-ml20" >필터</label>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label" >
			                        	<input onchange="clickAll(this)" id="allF" type="checkbox" class="form-check-input" value="" >전체
			                        </label>
	                            </div>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label">
			                        	<input name="chk1" id="outgoing" type="checkbox" onchange="checkSearch(this)" class="form-check-input" value="" >발신
			                        </label>
	                            </div>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label">
			                        	<input name="chk1" id="receive" type="checkbox" onchange="checkSearch(this)" class="form-check-input" value="" >수신
			                        </label>
	                            </div>
<!--                             </div> -->
<!-- 	                            <div> -->
<!-- 		                          <label class="col-sm-1 col-form-label cb-ml20" ></label> -->
<!-- 									<div class="col-md-2 searchKeword"> -->
<!-- 										<select name="searchType" class="dropdown bootstrap-select default-select form-control wide"> -->
<!-- 											<option value>전체</option> -->
<!-- 											<option value="franName">가맹점명</option> -->
<!-- 											<option value="buyerprodName">재료명</option> -->
<!-- 										</select> -->
<!-- 									</div> -->
<!-- 									<div class="col-sm-2 searchKeword"> -->
<!-- 										<input type="text" name="searchWord" class="form-control"> -->
<!-- 									</div>   -->
<!-- 	                            </div> -->
								<label class="col-sm-1 col-form-label cb-ml20" ></label>
								<label class="col-sm-1 col-form-label cb-ml20" ></label>
								<label class="col-sm-1 col-form-label cb-ml20" ></label>
								<label class="col-sm-1 col-form-label cb-ml20" ></label>
<!--                                 	<div class="col-md-2 searchKeword cb-wp30" > -->
                                	<div class="mb-3 col-md-2 searchKeword cb-wp30 cb-float-right" >
										<div class="input-group search-area">
													<select name="searchType" class="dropdown bootstrap-select default-select form-control wide">
														<option value>전체</option>
														<option value="franName">가맹점명</option>
														<option value="buyerprodName">재료명</option>										
													</select>
											<input type="text" name="searchWord" list="choise" class="form-control" >
										<datalist id="choise">
                                        	<c:forEach items="${foodList }" var="fr">
                                        		<option value="${fr.lguName }" ></option>
                                        	</c:forEach>
                                        </datalist>
											<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
										</div>
                                	</div>
                                	
<!--                             <div id="Cstate"> -->
								<label class="col-sm-1 col-form-label cb-ml20" >진행상태</label>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label">
			                        	<input onchange="clickAll2(this)" id="allS" type="checkbox" onchange="checkSearch2(this)" class="form-check-input" value="" >전체
			                        </label>
	                            </div>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label">
			                        	<input name="chk2" id="ST05" type="checkbox" onchange="checkSearch2(this)" class="form-check-input" value="" >요청중
			                        </label>
	                            </div>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label">
			                        	<input name="chk2" id="ST06" type="checkbox" onchange="checkSearch2(this)" class="form-check-input" value="" >거래완료
			                        </label>
	                            </div>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label">
			                        	<input name="chk2" id="ST07" type="checkbox" onchange="checkSearch2(this)" class="form-check-input" value="" >거절됨
			                        </label>
	                            </div>
							</div>

						</div>
						<div><input style="visibility:hidden"/></div>
		<div class="col-12">
			<div class="table-responsive">
				<div id="divID">
					<table id="example5"
						class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="min-width: 845px;">
						<thead id="tHead">
							<tr class="cb-tAlign-center">
								<th style="width:  5%;">순번</th>
								<th style="width:  10%;">트레이딩신청일</th>
								<th style="width:  5%;">수신/발신</th>
								<th style="width:  10%;">응답가맹점명</th>
								<th style="width:  25%;">재료</th>
								<th style="width:  5%;">갯수</th>
								<th style="width:  5%;">진행상황</th>
								<th style="width:  45%;">거절사유</th>
							</tr>
						</thead>
						<tbody id="listBody" class="cb-tAlign-center">

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
	</div>
</div>

<form id="searchForm" method="get" action="${cPath }/fr/trade" >
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
	<input type="hidden"  name="searchSelect" value="abc" id="searchSelect"/>
	<input type="hidden"  name="searchSelect2" value="abc" id="searchSelect2"/>
</form>

<!-- Datatable -->
    <script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js" ></script>
    
<script>
let listBody=$('#listBody');
let pagingArea = $('.pagingArea');
let searchUI = $("#searchUI");
let searchSelect = $('#searchSelect');
let searchSelect2 = $('#searchSelect2');
let totalRecord = $('#totalRecord');

//페이징 구문 동작
$('.pagingArea').on('click','a',function(event){
	let page = $(this).data("page"); //a 태그
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
});


let makeSingleTr = function(index, data){
	let tags=$('<tr>').append(
			 $('<td>').html(data.rnum).attr({
				 "class" : "cb-tAlign-center"
			 })
			 ,$('<td>').html(data.reqDate).attr({
				 "class" : "cb-tAlign-center"
			 })
			 ,$('<td>').html(data.state).attr({
				 "class" : "cb-tAlign-center"
			 })
			 ,$('<td>').html(data.respFran).attr({
				 "class" : "cb-tAlign-center"
			 })
			 ,$('<td>').html(data.buyerprodName).attr({
				 "class" : "cb-tAlign-left"
			 })
			 ,$('<td>').html(data.reqQty).attr({
				 "class" : "cb-tAlign-center"
			 })
			 ,$('<td>').html(data.tradeState).attr({
				 "class" : "cb-tAlign-center"
			 })
	 );
	
	if(data.tradeNote != null){
		tags.append(
			 $('<td>').html(data.tradeNote).attr({
				 "class" : "cb-tAlign-left"
			 })
		)
	}else{
		tags.append(
				 $('<td>').html("-").attr({
					 "class" : "cb-tAlign-center"
				 })
		); 
	}
	 return tags;
}
let searchForm = $("#searchForm").on("submit",function(event){
		event.preventDefault();
		$('#searchSelect').val(checkStr);
		$('#searchSelect2').val(checkStr2);
		let url = this.action;
		let method = this.method;
		let data = $(this).serialize();
//		console.log("this.name: ",this.name);
//		console.log("data: ",data);
//		console.log("this: ",this);
	
		$.ajax({ // 폼태그의 동기요청을 비동기로 바꾸려고한다~
			url : url,
			data : data,
			method : method,
			dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
			,
			success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
				let dataList = resp.trade.dataList;
// 				console.log(resp);
				
				let trTags =[];
				if(dataList && dataList.length>0){ // javascript는 list만 넣어도 true false 반환된다.
						$(dataList).each(function(index, data){ // this = member
							trTags.push(makeSingleTr(index, data));
						});                                                                                                      
				} else{        
					let trTag = $("<tr>").html(
							$("<td>").attr("colspan","8")
									 .html("트레이딩 내역이 존재하지 않습니다.")
						);
					trTags.push(trTag);                                                    
				}
				listBody.html(trTags);
				pagingArea.html(resp.trade.pagingHTMLBS);
// 				console.log(resp.trade.pagingHTMLBS);
				totalRecord.html("<strong>총 건수 : " +resp.trade.totalRecord+"</strong>");
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
// 	console.log("눌렸다!");
	searchForm.get(0).reset(); // 클리어
	let inputs = searchUI.find(":input[name]"); 
	$(inputs).each(function(idx, input){ // each : jquery 반복문
		let name = $(this).attr('name'); // input
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);
	});
	searchForm.submit();
});


<%-- ================================================
		checkBox
 --%>

 
var chechArr = new Array();
var checkStr = "";
function checkSearch(target){
// 	console.log(target);
	var checked = target.id;
	var confirmCheck = target.checked; //check여부 확인
//     console.log("체크박스 선택값 : "+checked);
//     console.log("선택여부 : "+confirmCheck);
    
    if(confirmCheck == true){
//         console.log("check");
        chechArr.push(checked);
    }else{
    	chechArr.splice(chechArr.indexOf(checked), 1); // check value filter 배열내용 삭제       
    }
    checkStr = chechArr.join( ',' );
//     console.log("!!!!",checkStr);
    $('#searchSelect').val(checkStr); // input은 String을 넘거야됨. Object는 안됨
//     console.log("이건가: ",searchSelect.value);
}

var chechArr2 = new Array();
var checkStr2 = "";
function checkSearch2(target){
// 	console.log(target);
	var checked = target.id;
	var confirmCheck = target.checked; //check여부 확인
//     console.log("체크박스 선택값 : "+checked);
//     console.log("선택여부 : "+confirmCheck);
    
    if(confirmCheck == true){
//         console.log("check");
        chechArr2.push(checked);
    }else{
    	chechArr2.splice(chechArr2.indexOf(checked), 1); // check value filter 배열내용 삭제       
    }
    checkStr2 = chechArr2.join( ',' );
//     console.log("!!!!",checkStr2);
    $('#searchSelect2').val(checkStr2); // input은 String을 넘거야됨. Object는 안됨
//     console.log("이건가: ",searchSelect2.value);
}

let chkArr = new Array();
function clickAll(target){
	var confirmCheck = target.checked;
// 	console.logC(confirmCheck);
// 	console.log($('[name="chk"]').val());
	
let nodeList = document.querySelectorAll('[name="chk1"]');
// 	console.log(document.querySelectorAll('[name="chk"]'));
	if(confirmCheck == true){
		$(nodeList).each(function(idx, node){
			chkArr.push(node.id);
		});
	}else{
		chkArr.length=0;
	}
// 	console.log(chkArr);
}

<%-- 전체 체크-  --%>
$(document).ready(function() {
	$("#allF").click(function() {
		if($("#allF").is(":checked")){
			$("input[name=chk1]").prop("checked", true);
		}
		else{
			$("input[name=chk1]").prop("checked", false);
		}
	});

	$("input[name=chk1]").click(function() {
		var total = $("input[name=chk1]").length;
		var checked = $("input[name=chk1]:checked").length;

		if(total != checked) $("#allF").prop("checked", false);
		else $("#allF").prop("checked", true); 
	});
});

let chkArr2 = new Array();
function clickAll2(target){
	var confirmCheck = target.checked;
// 	console.log(confirmCheck);
// 	console.log($('[name="chk"]').val());
	
let nodeList = document.querySelectorAll('[name="chk2"]');
// 	console.log(document.querySelectorAll('[name="chk"]'));
	if(confirmCheck == true){
		$(nodeList).each(function(idx, node){
			chkArr2.push(node.id);
		});
	}else{
		chkArr2.length=0;
	}
// 	console.log(chkArr2);
}

<%-- 전체 체크-  --%>
$(document).ready(function() {
	$("#allS").click(function() {
		if($("#allS").is(":checked")){
			$("input[name=chk2]").prop("checked", true);
		}
		else{
			$("input[name=chk2]").prop("checked", false);
		}
	});

	$("input[name=chk2]").click(function() {
		var total = $("input[name=chk2]").length;
		var checked = $("input[name=chk2]:checked").length;

		if(total != checked){
			$("#allS").prop("checked", false);
		}
		else $("#allS").prop("checked", true); 
	});
});

<%-- ================================================
		checkBox
 --%>
</script>