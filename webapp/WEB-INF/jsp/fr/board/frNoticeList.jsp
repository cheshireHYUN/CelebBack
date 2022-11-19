<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 10.      정아영           최초작성
* 2022. 8. 25.      정아영           1차 변경
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
<style>
.pagination {
	justify-content: center;
	margin-top: 25px;
	margin-bottom: 0;
}
</style>
<body></body>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles" style="margin-bottom: 15px;">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4><strong>가맹점 공지사항</strong></h4>
          					<span>가맹점 공지사항을 조회할 수 있습니다.</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					    <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="javascript:void(0)">게시판관리</a></li>
					        <li class="breadcrumb-item active"><a href="javascript:void(0)">가맹점 공지사항</a></li>
					    </ol>
					</div>
                </div>
                <!-- row -->

                <div id="searchUI" class="row" style="margin-bottom: 15px;">
                	<div style="float: left; width: 45%;">
                		<button id="insertBtn" type="button" class="btn btn-primary" style="border: none" onclick="location.href='${cPath}/fr/frNotice/form';">공지사항 글 작성</button>
                	</div>
                	<div class="row" style="float: right; width: 55%; padding: 0;">
                		<div style="text-align: right; width: 50%;">
		            		<div class="searchKeword" >
		            			<input type="date" name="searchStartDate" value="startDate" class="form-control" >
		            		</div>	
		            		~
		            		<div class="searchKeword" >
		            			<input type="date" name="searchEndDate" value="endDate" class="form-control" >
		            		</div>
	            		</div>
	            		<div style="width: 50%; padding: 0;">
		            		<div class="input-group search-area">
			            		<select name="searchType" class="dropdown bootstrap-select default-select form-control wide">
			            			<option>전체</option>
			            			<option value="postTitle">제목</option>
			            			<option value="postContent">내용</option>
			            		</select>
		            			<input id="enter" type="text" name="searchWord" class="form-control">
			            		<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
		            		</div>
		            	</div>
                	</div>
                </div>
                    
				<div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable">
                                    <thead>
                                        <tr>
                                            <th style="width:  5%; text-align: center;"><strong>No.</strong></th>
                                            <th style="width: 84%; text-align: center;"><strong>제목</strong></th>
                                            <th style="width: 11%; text-align: center;"><strong>등록일</strong></th>
                                        </tr>
                                    </thead>
                                    <tbody id="listBody">
                                    
                                    </tbody>
                                </table>
                                <div class="pagination_fg">
									<div class="pagingArea">
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

<form id="searchForm" method="get" action="${cPath }/fr/frNotice" >
<sec:csrfInput/>
	<input type="hidden" name="page" /> <!-- 전송하기 위한 input -->
	<input type="hidden" name="searchStartDate" />
	<input type="hidden" name="searchEndDate" />
	<input type="hidden" name="searchType"/> 
	<input type="hidden" name="searchWord"/>
</form>	
</body>
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

	let listBody=$('#listBody');
	let pagingArea = $('.pagingArea');
	let searchUI = $("#searchUI");
	
	//페이징 구문 동작
	$('.pagingArea').on('click','a',function(event){
		let page = $(this).data("page"); //a 태그
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	let makeSingleTr = function(index, frNotice){
		 return $('<tr>').append(
			        	$("<td style='text-align: center;'>").html(frNotice.rnum)
			        	,$("<td style='padding-left: 2%;'>").html(frNotice.postTitle)
			        	,$("<td style='text-align: center;'>").html(frNotice.postDate)
	   			 ).attr({
	   				"onclick" : "location.href='${cPath}/fr/frNotice/"+frNotice.frannoticeNo+"'",
	   				"style" : "cursor: pointer;"
	   			 });
	 
	}
	
	 let searchForm = $("#searchForm").on("submit",function(event){
			event.preventDefault();
			 
			let url = this.action;
			let method = this.method;
			let data = $(this).serialize();
		
			$.ajax({
				url : url,
				data : data,
				method : method,
				dataType : "json"
				,
				success : function(resp, status, jqXHR) {
					let frNoticeList = resp.frNotice.dataList;
					console.log(frNoticeList);
					
					let trTags =[];
					if(frNoticeList && frNoticeList.length>0){
							$(frNoticeList).each(function(index, frNotice){
								trTags.push(makeSingleTr(index, frNotice));
							});                                                                                                      
					} else{        
						let trTag = $("<tr>").html(
								$("<td>").attr("colspan","3")
										 .html("조건에 맞는 글이 없습니다.")
							);
						trTags.push(trTag);                                                    
					}
					listBody.html(trTags);
					pagingArea.html(resp.frNotice.pagingHTMLBS);   
				
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			
			return false;
		}).submit();
	 
	 let searchBtn = $("#searchBtn").on("click", function(event){
	 	 searchForm.get(0).reset();
		 let inputs = searchUI.find(":input[name]");
		 $(inputs).each(function(idx, input){
			 let name = $(this).attr("name");
			 let value = $(this).val();
			 searchForm.find("[name="+name+"]").val(value);
		 });
		 searchForm.submit();
	 });
 
	 $("#enter").keydown(function(key) {
			if(key.keyCode == 13){
				searchForm.get(0).reset();
				 let inputs = searchUI.find(":input[name]");
				 $(inputs).each(function(idx, input){
					 let name = $(this).attr("name");
					 let value = $(this).val();
					 searchForm.find("[name="+name+"]").val(value);
				 });
				 searchForm.submit();
			}
		});
</script>