<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      황단비      최초작성
* 2022. 9. 9.      서재원      마지막 카드 페이징 간격 안맞는 것 수정
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%-- <link href="${cPath}/resources/dashboard3/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet"> --%>
<link href="${cPath }/resources/dashboard3/vendor/fullcalendar/css/main.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<div class="content-body">   
	<div class="container-fluid">
		<!-- 파란카드 템플릿 -->
		<div class="row page-titles">
			<div class="col-sm-6 p-md-0">
				<div class="welcome-text">
					<h4><strong>가맹점점검관리</strong></h4>
					<span>가맹점 점검결과를 조회, 등록, 수정, 삭제, 공문발송(자동) 합니다. </span>
				</div>
			</div>
			<div
				class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">매장관리</a></li>
					<li class="breadcrumb-item active">
						<a href="javascript:void(0)">가맹점검관리</a>
					</li>
				</ol>
			</div>
		</div>
		<div>
			<div class="card cb-mb-1r">
				<div class="card-body cb-pb-05r" style="padding-bottom: 30px;">
					<div class="row">
						<div id="searchUI">
							<div>
<!-- 							<div id="filter"> -->
								<label class="col-sm-1 col-form-label cb-ml20" >점검결과</label>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label" >
			                        	<input onchange="clickAll(this)" id="allF" type="checkbox" class="form-check-input" value="" >전체
			                        </label>
	                             </div>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label">
			                        	<input name="chk1" id="receive" type="checkbox" onchange="checkSearch(this)" class="form-check-input" value="" >통과
			                        </label>
	                            </div>
								<div class="form-check form-check-inline ">
			                        <label class="form-check-label">
			                        	<input name="chk1" id="outgoing" type="checkbox" onchange="checkSearch(this)" class="form-check-input" value="" >불통
			                        </label>
	                            </div>
<!-- 								<label class="col-sm-1 col-form-label cb-ml20" ></label> -->
                            
                            
<!-- 							<div class="mb-3"> -->
<!-- 								<label class="col-sm-1 col-form-label cb-ml20" ></label> -->
<!-- 								<div class="col-md-2 searchKeword"> -->
<!-- 									<select name="searchType" class="dropdown bootstrap-select default-select form-control wide"> -->
<!-- 										<option value>전체</option> -->
<!-- 										<option value="franName">가맹점명</option> -->
<!-- 										<option value="ownerName">가맹점주명</option> -->
<!-- 									</select> -->
<!-- 								</div> -->
<!-- 								<div class="col-sm-2 searchKeword"> -->
<!-- 									<input type="text" name="searchWord" class="form-control"> -->
<!-- 								</div> -->
<!-- 							</div> -->
							
<!--                                 <div class="mb-3"> -->
<!-- 						<input style="visibility:hidden;"/> -->
<!-- 								<label class="col-sm-1 col-form-label cb-ml20" ></label> -->
                                	<div class="mb-3 searchKeword" >
										<label class="col-form-label cb-ml20" ></label>
										<label class="col-form-label cb-ml20" >점검날짜</label>
	                            		<div class="mb-3 searchKeword cb-ml20" >
	                            			<input type="date" name="searchStartDate" value="startDate" class="form-control" >
	                            		</div>
	                            		~
	                            		<div class="mb-3 searchKeword" >
	                            			<input type="date" name="searchEndDate" value="endDate" class="form-control" >
	                            		</div>
                                	</div>
                                	<div class="mb-3 col-md-2 searchKeword cb-wp30 cb-float-right" >
										<div class="input-group search-area">
													<select name="searchType" class="dropdown bootstrap-select default-select form-control wide">
														<option value>전체</option>
														<option value="franName">가맹점명</option>
														<option value="ownerName">가맹점주명</option>											
													</select>
											<input type="text" name="searchWord" class="form-control" >
											<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
										</div>
                                	</div>
                                 </div>
							
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="table-responsive">
								<p id="totalRecord" class="searchKeword"></p>
								<label class="col-sm-2 col-form-label cb-ml20" >(불통: 6점 미만 항목 존재시)</label>
								<input type="button" id="createBtn" class="btn btn-primary cb-float-right btn-sm cb-ml-05r" data-bs-toggle="modal" data-bs-target="#createModal" value="등록">
				<%-- 				<input type="button" class="btn btn-rounded btn-info cb-float-right btn-sm" onclick="location.href='${cPath}/head/frCheckDate'" value="캘린더"> --%>
								<input type="button" class="btn light btn-success cb-float-right btn-sm" data-bs-toggle="modal" data-bs-target="#calendarModal" id="calendarBtn"value="캘린더">
<!-- 								<input type="button" class="btn btn-info cb-float-right btn-sm"  id="calendarBtn"value="캘린더"> -->
								<div id="divID">
									<table id="example5"
										class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="min-width: 845px;">
										<thead id="tHead">
											<tr class="cb-tAlign-center">
												<th>순번</th>
												<th>가맹점명</th>
												<th>점검결과</th>
												<th>위생총점</th>
												<th>개인위생</th>
												<th>매장위생</th>
												<th>식자재관리</th>
												<th>점검일자</th>
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

<!-- Modal -->
<%-- <form id="sendForm" method="post" action="${cPath }/head/paper/send" enctype="multipart/form-data"> --%>
	<div class="modal fade" id="calendarModal">
		<div class="modal-dialog modal-lg modal-dialog-centered " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">점검 일정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>
				</div>
				<div class="modal-body">
					<div id='calendar'></div>
				</div>
			</div>
		</div>
	</div>
<!-- </form> -->
                                    <!-- create modal -->
<form:form id="createForm" method="post" action="${cPath }/head/frCheck" modelAttribute="checking">
<sec:csrfInput/>
       <div class="modal fade" id="createModal">
       <div class="modal-dialog modal-dialog-centered " role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title">점검 결과 등록</h5>
                   <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
               </div>
               <div class="modal-body">
					<div class="cb-pt10">
						가맹점명 <form:input type="text" list="choise" path="franName" class="form-control"/>
									<form:errors path="franName" elepent="span" cssClass="error"/>
								
                                        <datalist id="choise">
                                        	<c:forEach items="${franNameList }" var="fr">
                                        		<option value="${fr.franName }" ></option>
                                        	</c:forEach>
                                        </datalist>
					</div>
					<div class="cb-pt10">
						개인위생점수 <form:input type="number" list="score" path="checkIndi" class="form-control"/>
									<form:errors path="checkIndi" elepent="span" cssClass="error"/>
                                        <datalist id="score">
                                        		<option value="0" ></option>
                                        		<option value="1" ></option>
                                        		<option value="2" ></option>
                                        		<option value="3" ></option>
                                        		<option value="4" ></option>
                                        		<option value="5" ></option>
                                        		<option value="6" ></option>
                                        		<option value="7" ></option>
                                        		<option value="8" ></option>
                                        		<option value="9" ></option>
                                        		<option value="10" ></option>
                                        </datalist>
					</div>
					<div class="cb-pt10">
						매장위생점수 <form:input type="number" list="score" path="checkFran" class="form-control"/>
									<form:errors path="checkFran" elepent="span" cssClass="error"/>
					</div>
					<div class="cb-pt10">
						식자재관리점수 <form:input type="number" list="score"  path="checkFood" class="form-control"/>
									<form:errors path="checkFood" elepent="span" cssClass="error"/>
					</div>
					<div class="cb-pt10">
						점검일자 <form:input type="date" path="checkDate"  class="form-control"/>
									<form:errors path="checkDate" elepent="span" cssClass="error"/>
					</div>
				</div>
               <div class="modal-footer">
                   <button type="submit" class="btn btn-primary">저장</button>
                   <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">취소</button>
               </div>
           </div>
       </div>
   	</div>
</form:form>


<form id="searchForm" method="get" action="${cPath }/head/frCheck" >
<sec:csrfInput/>
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
	<input type="hidden" name="searchStartDate" />
	<input type="hidden" name="searchEndDate" />
	<input type="hidden"  name="searchSelect" value="abc" id="searchSelect"/>
</form>
<!-- Datatable -->
<%--     <script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js" ></script> --%>
    <script src="${cPath }/resources/dashboard3/vendor/fullcalendar/js/main.min.js"></script>

    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
  
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

$("#createForm").validate({
	rules:{
		checkIndi:"required"
		, franName:"required"
		, checkFran:"required"
		, checkFood:"required"
	}, messages : {
		checkIndi:"필수 항목"
		, franName:"필수 항목"
		, checkFran:"필수 항목"
		, checkFood:"필수 항목"
	}
});

	let listBody = $('#listBody');
	let pagingArea = $('.pagingArea');
	let searchUI = $("#searchUI");
	let searchSelect = $('#searchSelect');
// 	let searchSelect2 = $('#searchSelect2');
	let totalRecord = $('#totalRecord');

	//페이징 구문 동작
	$('.pagingArea').on('click', 'a', function(event) {
		let page = $(this).data("page"); //a 태그
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});

	let makeSingleTr = function(index, data) {
		console.log(data);
		let tdState;
		let tdIndi;
		let tdFran;
		let tdFood;
		let tdTotal;
		
		if(data.totalScore < 6){
			tdTotal = $('<td>').html(data.totalScore).attr({
				"class" : "cb-tAlign-center"
				,"style" : "color:red"
			});
		}else{
			tdTotal = $('<td>').html(data.totalScore).attr({
				"class" : "cb-tAlign-center"
			});
		}
		
		if(data.checkIndi < 6){
			tdIndi = $('<td>').html(data.checkIndi).attr({
				"class" : "cb-tAlign-center"
				,"style" : "color:red"
			});
		}else{
			tdIndi = $('<td>').html(data.checkIndi).attr({
				"class" : "cb-tAlign-center"
			});
		}
		if(data.checkFran < 6){
			tdFran = $('<td>').html(data.checkFran).attr({
				"class" : "cb-tAlign-center"
				,"style" : "color:red"
			});
		}else{
			tdFran = $('<td>').html(data.checkFran).attr({
				"class" : "cb-tAlign-center"
			});
		}
		if(data.checkFood < 6){
			tdFood = $('<td>').html(data.checkFood).attr({
				"class" : "cb-tAlign-center"
				,"style" : "color:red"
			});
		}else{
			tdFood = $('<td>').html(data.checkFood).attr({
				"class" : "cb-tAlign-center"
			});
		}
		
		if(data.state=='불통'){
			tdState=$('<td>').html(data.state).attr({
				"class" : "cb-tAlign-center"
				,"style" : "color:red"
			});
		}
		if(data.state=='통과'){
			tdState=$('<td>').html(data.state).attr({
				"class" : "cb-tAlign-center"
			});
		}
		
		let tags = $('<tr>').append($('<td>').html(data.rnum).attr({
			"class" : "cb-tAlign-center"
		}), $('<td>').html(data.franName).attr({
			"class" : "cb-tAlign-center"
		}),tdState
		,tdTotal
		,tdIndi
		,tdFran
		,tdFood
// 		$('<td>').html(data.checkIndi).attr({
// 			"class" : "cb-tAlign-center"
// 		}), $('<td>').html(data.checkFran).attr({
// 			"class" : "cb-tAlign-center"
// 		}), $('<td>').html(data.checkFood).attr({
// 			"class" : "cb-tAlign-center"
// 		})
		,
		$('<td>').html(data.checkDate).attr({
			"class" : "cb-tAlign-center"
		}))
		return tags;
	}
	let searchForm = $("#searchForm").on(
			"submit",
			function(event) {
				event.preventDefault();
				$('#searchSelect').val(checkStr);
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
						let dataList = resp.chk.dataList;
						// 				console.log(resp);

						let trTags = [];
						if (dataList && dataList.length > 0) { // javascript는 list만 넣어도 true false 반환된다.
							$(dataList).each(function(index, data) { // this = member
								trTags.push(makeSingleTr(index, data));
							});
						} else {
							let trTag = $("<tr>").html(
									$("<td>").html("점검 내역이 존재하지 않습니다.")
											.attr({
												"class" : "cb-tAlign-center"
													,"colspan":"8"
												})
												);
							trTags.push(trTag);
						}
						listBody.html(trTags);
						pagingArea.html(resp.chk.pagingHTMLBS);
						totalRecord.html("<strong>총 건수 : "
								+ resp.chk.totalRecord + "</strong>");
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
		// 	console.log("눌렸다!");
		searchForm.get(0).reset(); // 클리어
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input) { // each : jquery 반복문
			let name = $(this).attr('name'); // input
			let value = $(this).val();
			searchForm.find("[name=" + name + "]").val(value);
		});
		searchForm.submit();
	});
	
$('#calendarModal').modal('hide');

// $(document).on("show.modal",function(){
// 	alert("hi");
// });	
	
// $("#calendarBtn").on("click",function(){
// 	$('#calendarModal').modal('show');
// });

var modal = document.getElementById('calendarModal');

// $('#calendarModal').on("shown",function(){ // jQuery 높은 버전에서는 shown.bs.modal이 안먹힘
modal.addEventListener('shown.bs.modal',function(){
	$.ajax({
		url : "${cPath}/head/frCheckDate",
		method : "get",
		dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
		,
		success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
			console.log(resp);
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				headerToolbar : { // 헤더에 표시할 툴 바
					start : 'prev next today',
					center : 'title',
					end : 'dayGridMonth,dayGridWeek,dayGridDay'
				},
				titleFormat : function(date) {
					return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
				},
				//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				selectable : false, // 달력 일자 드래그 설정가능
				droppable : true,
				editable : true,
				nowIndicator: true, // 현재 시간 마크
				locale: 'ko' ,// 한국어 설정
				events: resp.cal

			});
			calendar.render();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

<%-- 점검 결과 등록 --%>
$('#realCreateBtn').on("click",function(){
	 document.getElementById("createForm").submit();
});

<%-- ==========체크박스========== --%>
var chechArr = new Array();
var checkStr = "";
function checkSearch(target){
// 	console.log(target);
	var checked = target.id;
	var confirmCheck = target.checked; //check여부 확인
    
    if(confirmCheck == true){
        chechArr.push(checked);
    }else{
    	chechArr.splice(chechArr.indexOf(checked), 1); // check value filter 배열내용 삭제       
    }
    checkStr = chechArr.join( ',' );
    $('#searchSelect').val(checkStr); // input은 String을 넘거야됨. Object는 안됨
}

let chkArr = new Array();
function clickAll(target){
	var confirmCheck = target.checked;
	
let nodeList = document.querySelectorAll('[name="chk1"]');
	if(confirmCheck == true){
		$(nodeList).each(function(idx, node){
			chkArr.push(node.id);
		});
	}else{
		chkArr.length=0;
	}
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
</script>