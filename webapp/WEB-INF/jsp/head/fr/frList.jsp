<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 4.      황단비      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
	<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
<style>
.pagination {
	justify-content: center;
	margin-top: 25px;
	margin-bottom: 0;
}
</style>		

		<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body ">
        
            <!-- row -->
			<div class="container-fluid ">
			<!-- 파란카드 템플릿 -->
<div class="row page-titles">
  <div class="col-sm-6 p-md-0">
      <div class="welcome-text">
          <h4><strong>가맹점조회</strong></h4>
          <span>전체 가맹점을 조회합니다.</span>
      </div>
  </div>
  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="javascript:void(0)">매장관리</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">가맹점조회</a></li>
      </ol>
  </div>
</div>
                    <div >
                        <div class="card">
                            <div class="card-body">
                                <div id="world-map" class="mb-4">
                                </div>
                                <div class="row">
                                <div id="searchUI">
                                 <div class="mb-3 col-sm-7 searchKeword" >
                                			<label class="col-sm-1 col-form-label" >운영상태</label>
                                			<c:forEach items="${stateList }" var="state">
                                				<div class="form-check form-check-inline ">
	                                                <label class="form-check-label">
	                                					<input id="${state.lguName }" type="checkbox" onchange="checkSearch(this)" class="form-check-input" value="" >${state.lguName }
	                                				</label>
                                				</div>
                                			</c:forEach>
                                        </div>
                                <div class="mb-3 col-md-2 searchKeword cb-wp30 cb-float-right" >
									<div class="input-group search-area">
												<select name="searchType" class="dropdown bootstrap-select default-select form-control wide">
													<option value>전체</option>											
													<option value="franName">가맹점명</option>											
													<option value="ownerName">가맹점주명</option>											
													<option value="franAdd1">가맹점주소</option>											
												</select>
										<input type="text" name="searchWord" list="choise"  class="form-control" >
                                        <datalist id="choise">
                                        	<c:forEach items="${franNameList }" var="fr">
                                        		<option value="${fr.franName }" ></option>
                                        	</c:forEach>
                                        </datalist>
										<!-- <span class="input-group-text"><a href=""><i class="flaticon-381-search-2"></i></a></span> -->
										<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
									</div>
                                 </div>
                            </div>
                            </div>
                            
<!-- 						<div><input style="visibility:hidden"/></div> -->
                             <div class="row">
                    	<div>
                    			<p id="totalRecord" class="searchKeword"></p>
								<button type="button" class="btn light btn-success btn-xs cb-float-right cb-ml-05r"  data-bs-toggle="modal" data-bs-target="#excelModal">엑셀업로드</button>
								<button type="button" id="excelDown" class="btn light btn-success btn-xs cb-float-right">엑셀다운로드</button>
                    	</div>
<!--                      <div class="mb-3 col-md-1 searchKeword"> -->
<!-- 											<select class="dropdown bootstrap-select default-select form-control wide"> -->
<!-- 												<option>정렬</option>											 -->
<!-- 												<option>정렬1</option>											 -->
<!-- 												<option>정렬2</option>											 -->
<!-- 											</select> -->
<!--                                  </div> -->
					<div class="col-12">
						<div class="table-responsive" >
							<div id="divID">
							<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="min-width: 845px;">
<!-- 							<table id="example5" class="display mb-4 dataTablesCard dataTable" style="min-width: 845px;"> -->
								<thead id="tHead">
									<tr class="cb-tAlign-center">
										<th style="width:  10%;">가맹점명</th>
										<th style="width:  12%;">가맹점주명</th>
										<th style="width:  30%;">위치</th>
										<th style="width:  10%;">운영상태</th>
										<th style="width:  15%;">금월점검점수</th>
										<th style="width:  23%;">매장전화번호</th>
									</tr>
								</thead>
								<tbody id="listBody" class="cb-tAlign-center">
									
								</tbody>
						</table>
						
									<div class="pagination_fg">	
										<div class="pagingArea"></div>
									</div>
							</div>
							<div>
<!-- 								<button type="button" id="printBtn" class="btn btn-primary btn-sm  cb-float-right">인쇄</button> -->
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
<form method="post" enctype="multipart/form-data">
<sec:csrfInput/>
<div class="modal fade" id="excelModal" tabindex="-1" aria-labelledby="excelModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">엑셀업로드</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <h3 class="modal-title" id="exampleModalLabel">업로드할 엑셀 파일을 선택하세요.</h3>
		  <div class="form-file">
			  <input type="file" class="form-file-input form-control" name="excelUp"/>
		   </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <input id="excelBtn" type="submit" class="btn btn-primary" value="업로드"/>
      </div>
    </div>
  </div>
</div>
</form>

<form id="searchForm" method="get" action="${cPath }/head/fr" >
<sec:csrfInput/>
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
	<input type="hidden"  name="searchSelect" value="abc" id="searchSelect"/>
</form>


    <!--**********************************
        Scripts
    ***********************************-->
	<!-- Datatable -->
    <script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js" ></script>
    <!-- kakao map api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f895cb402d52911b147dcc186690b7af&libraries=services,clusterer,drawing"></script>
	<script>

	<%--	 
		var table = $('#example5').DataTable({
			ajax:{
				url:"${cPath}/head/fr/dataTable",
				type:'GET',
			}
			,columns:[
				 {"data": "franName"},
				 {"data": "owner.ownerName"},
				 {"data": "franAdd1"},
				 {"data": "franState"},
				 {"data": "score"},
				 {"data": "franTel"}
			]
		});
--%>

<%--
// $('#printBtn').on("click",function(){
// 	window.onbeforeprint = function(){
// 		document.body.innerHTML = document.getElementById('divID').innerHTML;
// 	}
// 	window.onafterprint = function(){
// 		document.body.innerHTML = initBody;
// 	}
// 	window.print();
	
// });
--%>

var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

$('#excelDown').on("click",function(){
	document.getElementById("searchForm").action = "${cPath}/head/fr/excelDown";
	document.getElementById("searchForm").submit();
});
	
	let listBody=$('#listBody');
	let pagingArea = $('.pagingArea');
	let searchUI = $("#searchUI");
	let searchSelect = $('#searchSelect');
	let totalRecord = $('#totalRecord');
	
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

	//$("[name='searchType']").val("${pagingVO.simpleSearchCondition.searchType}");
	//$("[name='searchWord']").val("${pagingVO.simpleSearchCondition.searchWord}");
	//$("[name='searchSelect']").val();
	
	//페이징 구문 동작
	$('.pagingArea').on('click','a',function(event){
		let page = $(this).data("page"); //a 태그
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	let makeSingleTr = function(index, fran){
		 return $('<tr>').append(
			        	$("<td>").html(fran.franName)
			        	,$("<td>").html(fran.owner.ownerName)
			        	,$("<td>").html(fran.franAdd1).attr({
			        		"class" : "cb-wp40 cb-tAlign-left"
			        	})
			        	,$("<td>").html(fran.franState)
			        	,$("<td>").html(fran.score)
			        	,$("<td>").html(fran.franTel)
			        	
	   			 ).attr({
	   				 "id" : fran.franId
	   			 	 ,"onclick" : "location.href='${cPath}/head/fr/"+fran.franId+"'"
	   			 });
	}
	
	 let searchForm = $("#searchForm").on("submit",function(event){
			event.preventDefault();
			$('#searchSelect').val(checkStr);
			let url = this.action;
			let method = this.method;
			let data = $(this).serialize();
		
			$.ajax({
				url : "${cPath}/head/fr",
				data : data,
				method : method,
				dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
				,
				success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
					let franList = resp.fran.dataList;
// 					console.log(resp);
					
					let trTags =[];
					if(franList && franList.length>0){ // javascript는 list만 넣어도 true false 반환된다.
							$(franList).each(function(index, fran){ // this = member
								trTags.push(makeSingleTr(index, fran));
							});                                                                                                      
					} else{        
						let trTag = $("<tr>").html(
								$("<td>").attr("colspan","6")
										 .html("가맹점이 존재하지 않습니다.")
							);
						trTags.push(trTag);                                                    
					}
					listBody.html(trTags);
					pagingArea.html(resp.fran.pagingHTMLBS);
					totalRecord.html("<strong>총 건수 : " +resp.fran.totalRecord+"</strong>");

					var mapContainer = document.getElementById('world-map'); // 지도를 표시할 div
					var mapOption  = {
// 				 			center: new kakao.maps.LatLng(resp.hashMapList[1].FRAN_XMAP,resp.hashMapList[1].FRAN_YMAP), // 지도의 중심좌표
				 			center: new kakao.maps.LatLng(36.3250346,127.4089503), // 지도의 중심좌표
				 			level: 12 // 지도의 확대 레벨
				 		};
			 		// 지도를 생성합니다    
			 		var map = new kakao.maps.Map(mapContainer, mapOption);
			 		// 주소-좌표 변환 객체를 생성합니다
			 		var geocoder = new kakao.maps.services.Geocoder();
			 		      
					var markerTmp;      // 마커
					var customOverlay;  // 오버레이
					var contentStr;
					 
					for (var i=0;i<resp.hashMapList.length;i++) {
					    // 마커가 표시될 위치입니다 
			 		var markerPosition  = new kakao.maps.LatLng(resp.hashMapList[i].FRAN_XMAP,resp.hashMapList[i].FRAN_YMAP); 
			 		
			 		// 마커를 생성합니다
			 		var marker = new kakao.maps.Marker({
			 		    position: markerPosition
			 		});
			 		 
			 		// 마커가 지도 위에 표시되도록 설정합니다
			 		marker.setMap(map);
			 		
			 	// 인포윈도우를 생성합니다
			 		var infowindow = new kakao.maps.InfoWindow({
// 			 			content : '<div class="customoverlay">' +
// 			 		    '    <span class="title">'+resp.hashMapList[i].FRAN_NAME +'</span>' +
// 			 		    '</div>'
			 		    content : "<div style='position: absolute; left: 0px; top: 0px;'><div style='width:140px;padding:1px;text-align:center;'>"+resp.hashMapList[i].FRAN_NAME +"</div></div>" 
			 		});
			 		  
			 		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			 		infowindow.open(map, marker); 
					    
					    
					 // 지도 타입 변경 컨트롤을 생성한다
					    var mapTypeControl = new kakao.maps.MapTypeControl();
					     
					    // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
// 					    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);    
					     
					    // 지도에 확대 축소 컨트롤을 생성한다
					    var zoomControl = new kakao.maps.ZoomControl();
					     
					    // 지도의 우측에 확대 축소 컨트롤을 추가한다
					    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
					}
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
	
	 <%-- 운영상태 기본 체크값 주기 --%>
// 	 $('.form-check-label').find('#운영중').prop("checked", true);
// 	 $('.form-check-label').find('#개점예정').prop("checked", true);
	</script>
	
<!-- </body> -->