<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 25.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" type="text/css" href="${cPath}/resources/restaurant/css/paging.css">

		<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1 id="h1">공지사항</h1>
							<p><span class="element"></span></p>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="frame white"></div>
		</div>
		<!-- /hero_single -->
		
		<div class="pattern_2">
		    <div class="container margin_60_40">
		    
		    <div id="searchUI" class="row justify-content-end" style="margin-bottom: 20px;">
				<div class="col-md-1 searchKeword" style="padding-right: 0;">
						<select name="searchType" class="form-control">
		        			<option>전체</option>
		        			<option value="postTitle">제목</option>
		        			<option value="postContent">내용</option>
		        		</select>
				</div>
				<div class="col-md-2 searchKeword">
						<input id="enter" type="text" name="searchWord" class="form-control" placeholder="search...">
				</div>
<!-- 				<div class="col-md-1 searchKeword"> -->
<!-- 				<input type="button" id="searchBtn" class="btn btn-primary" value="검색" /> -->
<!-- 				</div> -->
			</div>
		    
		        <table class="table table-striped cart-list">
		            <thead>
		                <tr>
		                    <th style="width: 7%; padding-left: 2%;">No.</th>
		                    <th style="width: 83%; text-align: center;">제목</th>
		                    <th style="width: 10%; text-align: center;">등록일</th>
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
		<!-- /container -->

	<!-- /main -->

	<div id="toTop"></div><!-- Back to top button -->
	
<form id="searchForm" method="get" action="" >
<sec:csrfInput/>
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
</form>	

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
		let aTag = $("<a>").attr("href", "${cPath}/frNotice/"+frNotice.franId+"/"+frNotice.frannoticeNo)
							.text(frNotice.postTitle)
		 return $('<tr>').append(
			        	$("<td style='padding-left: 2%;'>").html(frNotice.rnum)
			        	,$("<td style='padding-left: 2%;'>").html(aTag)
			        	,$("<td style='text-align: right; padding-right: 2%;'>").html(frNotice.postDate)
	   			 );
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
					console.log("성공!");
					let frNoticeList = resp.frNotice.dataList;
					$("#searchForm").action = "${cPath}/frNotice/"+resp.frNotice.franId;
					$("#h1").html(resp.frNotice.franName+" 공지사항");
					let trTags =[];
					if(frNoticeList && frNoticeList.length>0){
							$(frNoticeList).each(function(index, frNotice){
								trTags.push(makeSingleTr(index, frNotice));
							});                                                                                                      
					} else{        
						let trTag = $("<tr>").html(
								$("<td style='padding-left: 2%;'>").attr("colspan","3")
										 .html("조건에 맞는 글이 없습니다.")
							);
						trTags.push(trTag);                                                    
					}
					listBody.html(trTags);
					pagingArea.html(resp.frNotice.pagingHTMLBS);   
				
				},
				error : function(jqXHR, status, error) {
					console.log("오류");
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			
			return false;
		}).submit();
	 
// 	 let searchBtn = $("#searchBtn").on("click", function(event){
// 	 	 searchForm.get(0).reset();
// 		 let inputs = searchUI.find(":input[name]");
// 		 $(inputs).each(function(idx, input){
// 			 let name = $(this).attr("name");
// 			 let value = $(this).val();
// 			 searchForm.find("[name="+name+"]").val(value);
// 		 });
// 		 searchForm.submit();
// 	 });
	 
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