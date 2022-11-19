<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      황단비      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
	<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
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
          <h4><strong>공문발송관리</strong></h4>
          <span>공문 관리, 공문 발송을 합니다.</span>
      </div>
  </div>
  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="javascript:void(0)">매장관리</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">공문발송관리</a></li>
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
										<option value>전체</option>
										<option value="paperName">공문명</option>
										<option value="paperContent">공문내용</option>
									</select> <input type="text" name="searchWord" class="form-control">
									<!-- <span class="input-group-text"><a href=""><i class="flaticon-381-search-2"></i></a></span> -->
									<input id="searchBtn" type="button" value="검색"
										class="btn light btn-primary" />

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
								<table id="example5"
									class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="min-width: 845px;">
									<thead>
										<tr>
											<th style="width:  7%;" class="cb-tAlign-center">순번</th>
											<th style="width:  10%;" class="cb-tAlign-center">공문명</th>
											<th style="width:  70%;" class="cb-tAlign-center">공문내용</th>
											<th style="width:  6%;"></th>
											<th style="width:  6%;"></th>
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
            </div>
        <!--**********************************
            Content body end
        ***********************************-->

 								<!-- Modal -->
                                 <form id="sendForm" method="post" action="${cPath}/head/paper/send" enctype="multipart/form-data" >
                                 <sec:csrfInput/>
                                    <div class="modal fade" id="sendModal">
                                        <div class="modal-dialog modal-dialog-centered " role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">공문 발송</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                                                    </button>
                                                </div>
                                                <div class="modal-body">
			                                    </div>
			                                          <div class="modal-footer">
			                                                    <button type="button" class="btn light btn-danger light" data-bs-dismiss="modal">취소</button>
			                                                    <button class="btn btn-dark">발송</button>
			                                          </div>
                                          		  </div>
                                       		 </div>
                                   		 </div>
                                    </form>
                                    
                                    <!-- create modal -->
                                 <form:form id="createForm" method="post" action="${cPath }/head/paper" enctype="multipart/form-data" commandName="paper">
                                 <sec:csrfInput/>
                                        <div class="modal fade" id="createModal">
                                        <div class="modal-dialog modal-dialog-centered " role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">공문 등록</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                	<div class="cb-pt10">
                                                		공문명 <form:input type="text" path="paperName" class="form-control" />
                                                	</div>
                                                	<div class="cb-pt10">
                                                		공문내용
                                           			 	<form:textarea class="form-control" rows="4" path="paperContent" id="comment" style="height: 188px;"/>
                                       				</div>
                                       				 <div class="form-file">
														 <form:input type="file" class="form-file-input form-control" path="atchFile"/>
												   </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn light btn-danger light" data-bs-dismiss="modal">취소</button>
                                                    <button id ="createBtn"class="btn btn-dark">등록</button>
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
                                                    <h5 class="modal-title">공문 삭제</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                                                    </button>
                                                </div>
                                                
												<form id="deleteForm" action="${cPath }/head/paper" method="post">
												<sec:csrfInput/>
												      <input type="hidden" name="_method" value="delete">
	                                                <div class="modal-body">
	                                                	공문을 삭제하시겠습니까? <br> 
	                                                	삭제하면 되돌릴 수 없습니다.
	                                        		</div>
	                                                <div class="modal-footer">
	                                                    <button type="button" class="btn light btn-danger" data-bs-dismiss="modal">취소</button>
	                                                    <button id="deleteBtn" type="button" class="btn btn-dark">삭제</button>
	                                                </div>
	                                           </form>
                                            </div>
                                        </div>
                                       </div> 
                                       
                                 <form id="updateForm"method="post" action="">
                                 <sec:csrfInput/>
									<input type="hidden" name="_method" value="PUT">
                                    <!-- update modal -->
                                      <div class="modal fade" id="updateModal"  >
                                        <div class="modal-dialog modal-lg modal-dialog-centered " role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">공문 상세</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                	
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn light btn-danger" data-bs-dismiss="modal">취소</button>
                                                    <input id="updateBtn" type="button" class="btn btn-dark" value="수정"/>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                   </form>
<form id="searchForm" method="get" action="${cPath }/head/paper" >
<sec:csrfInput/>
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
</form>

    <!--**********************************
        Scripts
    ***********************************-->
	<!-- Datatable -->
    <script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<!-- Apex Chart -->
	<script src="${cPath}/resources/dashboard3/vendor/apexchart/apexchart.js"></script>	
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	
	<!-- sweet alert -->  
 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 	
 	
	<script type= text/javascript>
// 	var table = $('#example5').DataTable({
// 		select: false,
// 		ajax:{
// 			url:"${cPath}/head/paper",
// 			type:'GET'
// 		}
// 		,columns:[
// // 			 {"data": "rnum"},
// 			 {"data": "paperName"},
// 			 {"data": "paperContent"}
	
// 		]
// 		,columnDefs: [{
// 			   "targets": -1,
// 			   "data": null,
// 			   "render": function(data, type, row){
// 			    return '<button>내역확인</button>';
// 			            },
// 			   "orderable": false

// 			  }]
// 		, buttons: [
// 			'copy', 'excel', 'pdf', 'print'
// 		]
// 	});

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

$("#createForm").validate({
	rules:{
		paperName:"required"
		, paperContent:"required"
	}, messages : {
		paperName:"필수 항목"
		, paperContent:"필수 항목"
	}
});


let CPATH = $.CPATH;
let totalRecord = $('#totalRecord');
let listBody=$('#listBody');
let pagingArea = $('.pagingArea');
let searchUI = $("#searchUI");
let searchSelect = $('#searchSelect');

var deleteId="";
var sendId="";
function deleteClick(target){
// 	console.log(target.id);
	deleteId = target.id;
}
function sendClick(target){
	console.log(target.id);
	sendId = target.id;
}
<%-- sendModal 이벤트 --%>
let sendModal = $(document).on("click","[name='sendBtn']",function(){
	let paperId=this.id;
	let url = CPATH+"/head/paper/"+paperId;
	console.log(url);
	$.ajax({
		url : url
		,method:'post'
		,data : {
			"paperId" : paperId
		}
		,dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
			,beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			}
				,
		success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
//				console.log("resp");
			console.log(resp);
//				let paper = resp.data.dataList
			let datalist = [];
			for(var i=0; i<resp.ownerIdList.length;i++){
				var optionTag = $('<option>').attr({
					"value" : resp.ownerIdList[i].ownerId
					,"label" : resp.ownerIdList[i].franName
				});
				datalist.push(optionTag);
			}
//				console.log(datalist);
			let tags1= $("<div>")
						.html("공문명")
						.attr({
							"class" : "cb-pt10"
						})
						.append(
							$("<input>").attr({
									"type" : "text"
									,"name" : "paperName"
									,"class": "form-control"
									,"value" : resp.paper.paperName
								})
						);
				let tags2= $('<div>')
							.html('공문내용')
							.attr({
								"class" : "cb-pt10"
							}).append(
								$('<textarea>').attr({
								"class" : "form-control"
								,"name" : "paperContent"
								,"rows" : "4"
								,"id":"comment"
								,"style" : "height: 188px;"
							}).html(resp.paper.paperContent)
						);
				let tagFile = $('<div>').attr({
								"class" : "form-file"
								}).append(
									$('<input>').attr({
										"type" : "file"
										,"class" : "form-file-input form-control"
										,"name" : "atchFile"
									})		
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
							}).html("해당가맹점")
							.append(
								$('<input>').attr({
									"type" : "checkbox"
									,"class" : "form-check-input"
									,"onchange" : "checkOwner(this)"
									,"id" : "allOwner"
								})
							)
						)
						,$('<div>').attr({
							"class" : "form-check form-check-inline"
						 	,"id" : "partParent"
						}).append(
							$('<label>').attr({
								"class" : "form-check-label"
							}).html("가맹점지정")
							  .append(
								$('<input>').attr({
									"type" : "checkbox"
									,"class" : "form-check-input"
									,"onchange" : "checkOwner(this)"
									,"id" : "partOwner"
								})
							  )
						)
					);
				let tags4 = $('<div>').attr({
					"class" : "row"
						,"id" : "partChild"
			     });
				
				
				
				let result = $('<div>').attr({
								"id" : resp.paper.paperId
								,"class" : "claz"
							})			
							.append(
								tags1
								,tags2
// 								,tagFile
								,tags3
								,$('<datalist>').attr({
									"id" : "choise"
								}).append(datalist)
								,$('<input>').attr({
										"type" : "hidden"
										,"name" : "paperId"
										,"value":resp.paper.paperId
									})
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

<%-- updateModal 열림 닫힘 이벤트 --%>
let exampleModal=$('#updateModal').on('show.bs.modal',function(event){
// 		console.log("event.relatedTarget.id");
// 		console.log(event.relatedTarget.id);
// 		let url = VIEWURL.replace("paperId",event.relatedTarget.id);

		let url = CPATH+"/head/paper/"+event.relatedTarget.id;
// 		console.log(url);
		$.ajax({
			url : url
			,method:'post'
			,data : {
				"paperId" : event.relatedTarget.id 
			}
			,dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
				,beforeSend : function(xhr)
				{
				   xhr.setRequestHeader(header,token);
				},
			success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
// 				console.log("resp");
				console.log(resp);
// 				let paper = resp.data.dataList
				let tags1= $("<div>")
							.html("공문명")
							.attr({
								"class" : "cb-pt10"
							})
							.append(
								$("<input>").attr({
										"type" : "text"
										,"name" : "paperName"
										,"class": "form-control"
										,"value" : resp.paper.paperName
									})
							);
					let tags2= $('<div>')
								.html('공문내용')
								.attr({
									"class" : "cb-pt10"
								}).append(
									$('<textarea>').attr({
									"class" : "form-control"
									,"name" : "paperContent"
									,"rows" : "4"
									,"id":"comment"
									,"style" : "height: 188px;"
								}).html(resp.paper.paperContent)
							);
					let result = $('<div>').attr({
									"id" : resp.paper.paperId
									,"class" : "claz"
								})			
								.append(
									tags1
									,tags2
								)
				exampleModal.find(".modal-body").html(result);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		}).on('hidden.bs.modal','#updateModal',function(event){
			console.log(event.target); // modal 가져온거임
			$(event.target).find(".modal-body").empty();
		});


	<%-- 검색 체크박스 이벤트 --%>
	var chechArr = new Array();
	var checkStr = "";
	function checkSearch(target){
// 		console.log(target);
		var checked = target.id;
		var confirmCheck = target.checked; //check여부 확인
        //console.log("체크박스 선택값 : "+checked);
        //console.log("선택여부 : "+confirmCheck);
        
        if(confirmCheck == true){
//             console.log("check");
            chechArr.push(checked);
        }else{
        	chechArr.splice(chechArr.indexOf(checked), 1); // check value filter 배열내용 삭제       
        }
        checkStr = chechArr.join( ',' );
//         console.log("!!!!",checkStr);
        $('#searchSelect').val(checkStr); // input은 String을 넘거야됨. Object는 안됨
//         console.log("이건가: ",searchSelect.value);
	}
	
	<%-- 페이징 구문 동작 --%>
	$('.pagingArea').on('click','a',function(event){
		let page = $(this).data("page"); //a 태그
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	<%-- 페이지 로딩시 ajax 결과값으로 태그 만들기 --%>
	let makeSingleTr = function(index, paper){
		 return $('<tr>').append(
			        	$("<td>").html(paper.rnum)
			        			 .attr({
			        				  "id" : paper.paperId
			        				 ,"class" : "cb-tAlign-center"
			        				 ,"data-toggle" : "modal" 
			        				 ,"data-target" : "#updateModal"
			        			 })
			        	,$("<td>").html(paper.paperName)
			        			.attr({
			        				  "id" : paper.paperId
			        				 ,"data-toggle" : "modal" 
			        				 ,"data-target" : "#updateModal"
			        			 })
			        	,$("<td>").html(paper.paperContent)
			        			.attr({
			        				  "id" : paper.paperId
			        				 ,"data-toggle" : "modal" 
			        				 ,"data-target" : "#updateModal"
			        			 })
			        	,$("<td>").append(
			        		$("<div>").attr({
			        			"class" : "bootstrap-modal"
			        		}).append(
			        			$("<input>").attr({
			        				"type" : "button"
			        				,"class" : "btn light btn-primary btn-xs"
			        				,"data-bs-toggle" : "modal"
			        				,"data-bs-target" : "#sendModal"
			        				,"id" : paper.paperId
			        				,"name" : "sendBtn"
			        				,"value" : "발송"
				        			,"onclick" : "sendClick(this)"
			        			})		
			        		)
			        	)
			        	,$("<td>").append(
			        		$("<div>").attr({
			        			"class" : "bootstrap-modal"
			        		}).append(
			        			$("<input>").attr({
			        				"type" : "button"
			        				,"class" : "btn light btn-danger btn-xs"
			        				,"data-bs-toggle" : "modal"
			        				,"data-bs-target" : "#deleteModal"
			        				,"value" : "삭제"
			        				,"id" : paper.paperId
			        				,"onclick" : "deleteClick(this)"
			        			})		
			        		)
			        	)
			        	
	   			 ).attr({
	   				 "id" : paper.paperId
	   			 });
	}
	
	<%-- 페이지 로딩 ajax --%>
	 let searchForm = $("#searchForm").on("submit",function(event){
			event.preventDefault();
// 			$('#searchSelect').val(checkStr);
			let url = this.action;
			let method = this.method;
			let data = $(this).serialize();
// 			console.log("this.name: ",this.name);
// 			console.log("data: ",data);
// 			console.log("this: ",this);
		
			$.ajax({ // 폼태그의 동기요청을 비동기로 바꾸려고한다~
				url : url,
				data : data,
				method : method,
				dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
				,
				success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
					let paperList = resp.paper.dataList;
// 					console.log(resp);
					
					let trTags =[];
					if(paperList && paperList.length>0){ // javascript는 list만 넣어도 true false 반환된다.
							$(paperList).each(function(index, paper){ // this = member
								trTags.push(makeSingleTr(index, paper));
							});                                                                                                      
					} else{        
						let trTag = $("<tr>").html(
								$("<td>").attr("colspan","3")
										 .html("글이 아직 없음.")
							);
						trTags.push(trTag);                                                    
					}
					listBody.html(trTags);
					pagingArea.html(resp.paper.pagingHTMLBS);
					totalRecord.html("<strong>총 건수 : " +resp.paper.totalRecord+"</strong>");
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			
			return false;
		}).submit();
	 
	 <%-- 검색 submit --%>
	 $("#searchBtn").on("click",function(){
			// name을 가진 입력태그(:input 입력용 input태그들 선택)
// 			console.log("눌렸다!");
			searchForm.get(0).reset(); // 클리어
			let inputs = searchUI.find(":input[name]"); 
			$(inputs).each(function(idx, input){ // each : jquery 반복문
				let name = $(this).attr('name'); // input
				let value = $(this).val();
				searchForm.find("[name="+name+"]").val(value);
			});
			searchForm.submit();
		});

	 <%-- 공문 수정 --%>
	 $("#updateBtn").on("click",function(){
		let updateForm = $("#updateForm");
	 	let id = updateForm.find(".claz")[0].id;
	 	document.getElementById("updateForm").action = "${cPath}/head/paper/"+id;
	 	
	  	document.getElementById("updateForm").submit();
	 });
	 
	 <%-- 공문 등록--%>
	 $("#createBtn").on("click",function(){
		 document.getElementById("createForm").submit();
	 });
	 
	 <%-- 공문 삭제 --%>
	 $("#deleteBtn").on("click",function(){
		let deleteForm = $("#deleteForm");
// 		console.log(deleteId);
	 	document.getElementById("deleteForm").action = "${cPath}/head/paper/"+deleteId;
	 	
	  	document.getElementById("deleteForm").submit();
	 });
	 
	 <%-- 공문 등록 - 초기화 
	 $("#createModal").on('show.bs.modal',function(){
	 });--%>
	 
	 <%-- 공문 발송 모달 - childRecord --%>
	 function makeChild(p_arg){
     	return $('<div>').attr({
				    	"class" : "claz2" 
				     }).append(
			     		$('<input>').attr({
			     			"type" : "text"
			     			,"class" : "form-control searchKeword cb-wp80"
			     			,"name" : "ownerIdList["+p_arg+"]"
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
	 
	 <%-- 공문 발송 모달 - 체크박스 선택 이벤트 --%>
	 let cnt = 0;
	 let cntRslt = ($('.claz2').length-1)/3;
	 function checkOwner(target){
// 		 console.log(target);
			var checked = target.id;
			var confirmCheck = target.checked; //check여부 확인
// 	        console.log("체크박스 선택값 : "+checked);
// 	        console.log("선택여부 : "+confirmCheck);
	        
	        if(checked=="partOwner" && confirmCheck==true){
	        	cnt=0;
	        	$('#allOwner').prop("checked", false);
	        	$('.claz').append(makeChild(0));
	        	cnt = cnt+1;
				
	        }if(checked=="partOwner" && confirmCheck==false ){
	        	$('.claz2').remove();
	        }if(checked=="allOwner" && confirmCheck==true){
	        	$('#partOwner').prop("checked", false);
	        	$('.claz2').remove();
	        }
	        
	 }
	 
	 <%-- 공문 발송 모달 - 체크박스 선택 이벤트(+버튼) --%>
	 function clickPlus(){
		 $('.claz').append(makeChild(cnt));
     	cnt = cnt+1;
// 	     console.log(($('.claz2').length-1)/3);
	 }
	 
	 <%-- 공문 발송 모달 - 체크박스 선택 이벤트(-버튼) --%>
	 function clickMinus(target){
		 if(cnt>1){
// 			console.log($(".claz2").get(0));
			$("div.claz2:last-child").remove(); 
		    cnt = cnt-1;
			 
		 }
// 		 $('.claz:last-child').remove();
	 }
 
	 <%-- 공문 발송 --%>
 $('#sendForm').on("submit",function(event){
			event.preventDefault();
			let data = $(this).serialize();
			console.log(data);
		$.ajax({
			url : '${cPath}/head/paper/send',
			data : data,
			method : 'post',
	        enctype: 'multipart/form-data',  
			success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
				console.log("결과확인 : ",resp);				
				sweetAlert("공문이 발송되었습니다.", "", "success");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	 }); 
 
//  $('#createForm').on("submit",function(event){
// 			event.preventDefault();
// 			let url = this.action;
// 			let data = $(this).serialize();
// 			console.log(data);
// 		$.ajax({
// 			url : '${cPath}/head/paper',
// 			data : data,
// 			method : 'post',
// 	        enctype: 'multipart/form-data',
// 			success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
// 				console.log("결과확인 : ",resp);				
// 				sweetAlert("공문이 등록되었습니다.", "", "success");
// 			},
// 			error : function(jqXHR, status, error) {
// 				console.log(jqXHR);
// 				console.log(status);
// 				console.log(error);
// 			}
// 		});
// 		return false;
// 	 }); 

 
 
	</script>
	

	
<!-- </body> -->

<!-- sweetAlert창 바로 사라지는 문제 해결하는 스크립트 -->
<script>
function sweetAlert(title, text, icon) {
	swal({
		title: title,
		text: text,
		icon: icon,
		buttons: '확인'
	}).then((value) => {
		if(value) {
			window.location.reload();
		}
	});
}
</script>