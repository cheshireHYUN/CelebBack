<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      황단비      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
	<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<%-- 	<link href="${cPath}/resources/dashboard3/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet"> --%>
<%-- 	<link href="${cPath}/resources/dashboard3/vendor/bootstrap/scss/_utilities.scss" rel="stylesheet"> --%>
<!-- 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">	 -->

		<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
        
            <!-- row -->
			<div class="container-fluid">
<div >
<!-- 파란카드 템플릿 -->
	<div class="row page-titles">
	  <div class="col-sm-6 p-md-0">
	      <div class="welcome-text">
	          <h4><strong>공문수신함</strong></h4>
	          <span>수신된 공문을 모두 조회합니다.</span>
	      </div>
	  </div>
	  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
	      <ol class="breadcrumb">
	          <li class="breadcrumb-item"><a href="javascript:void(0)">공문수신함</a></li>
	          <li class="breadcrumb-item active"><a href="javascript:void(0)">공문수신함</a></li>
	      </ol>
	  </div>
	</div>
</div>
<div class="row">
			<div id="searchUI">
				<div class="mb-3 col-md-2 searchKeword cb-wp30 cb-float-right">
					<div class="input-group search-area">
						<select name="searchType"
							class="dropdown bootstrap-select default-select form-control wide">
							<option>전체</option>											
							<option>공문명</option>											
							<option>공문내용</option>
						</select> <input type="text" name="searchWord" class="form-control">
						<input id="searchBtn" type="button" value="검색" class="btn light btn-primary" />

					</div>
				</div>
			</div>
		</div>
                    
                    <div class="card">
				<div class="card-body">
					<div class="row">
					<div class="col-12">
						<div class="table-responsive">
							<p id="totalRecord" class="searchKeword"></p>
							<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="min-width: 845px;">
								<thead>
									<tr>
										<th style="width:  10%;">순번</th>
										<th style="width:  20%;">공문명</th>
										<th style="width:  50%;">공문내용</th>
										<th style="width:  20%;">수신일자</th>
									</tr>
								</thead>
								<tbody id="listBody">
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

        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="http://dexignzone.com/" target="_blank">DexignZone</a> 2021</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
<form id="searchForm" method="get" action="${cPath }/fr/paper" >
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
</form>

 <!--**********************************
        Scripts
    ***********************************-->
	<!-- Datatable -->
<%--     <script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script> --%>
	<!-- Apex Chart -->
	<script src="${cPath}/resources/dashboard3/vendor/apexchart/apexchart.js"></script>	

<script>
let CPATH = $.CPATH;
let totalRecord = $('#totalRecord');
let listBody=$('#listBody');
let pagingArea = $('.pagingArea');
// let searchUI = $("#searchUI");
// let searchSelect = $('#searchSelect');

let makeSingleTr = function(index, frPaper){
	return $('<tr>').append(
			 $("<td>").html(frPaper.paper.rnum)
			,$("<td>").html(frPaper.paper.paperName)
			,$("<td>").html(frPaper.paper.paperContent)
			,$("<td>").html(frPaper.paperDate)
	);
	
}

//페이징 구문 동작
	$('.pagingArea').on('click','a',function(event){
		let page = $(this).data("page"); //a 태그
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	 let searchForm = $("#searchForm").on("submit",function(event){
			event.preventDefault();
//			$('#searchSelect').val(checkStr);
			let url = this.action;
			let method = this.method;
			let data = $(this).serialize();
//			console.log("this.name: ",this.name);
//			console.log("data: ",data);
//			console.log("this: ",this);
		
			$.ajax({ // 폼태그의 동기요청을 비동기로 바꾸려고한다~
				url : url,
				data : data,
				method : method,
				dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
				,
				success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
					let frPaperList = resp.frPaper.dataList;
					console.log(resp);
					
					let trTags =[];
					if(frPaperList && frPaperList.length>0){ // javascript는 list만 넣어도 true false 반환된다.
							$(frPaperList).each(function(index, frPaper){ // this = member
								trTags.push(makeSingleTr(index, frPaper));
							});                                                                                                      
					} else{        
						let trTag = $("<tr>").html(
								$("<td>").attr("colspan","4")
										 .html("수신된 공문이 존재하지 않습니다.")
							);
						trTags.push(trTag);      
						pagingArea.html("");
						totalRecord.html("");                                              
					}
					listBody.html(trTags);
					pagingArea.html(resp.frPaper.pagingHTMLBS);
					totalRecord.html("<strong>총 건수 : " +resp.frPaper.totalRecord+"</strong>");
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
			console.log("눌렸다!");
			searchForm.get(0).reset(); // 클리어
			let inputs = searchUI.find(":input[name]"); 
			$(inputs).each(function(idx, input){ // each : jquery 반복문
				let name = $(this).attr('name'); // input
				let value = $(this).val();
				searchForm.find("[name="+name+"]").val(value);
			});
			searchForm.submit();
		});
</script>