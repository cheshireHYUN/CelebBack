<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      이혜원      최초작성
* 2022. 8  23.	   황단비 	   기능추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%-- <link href="${cPath}/resources/dashboard3/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet"> --%>
<div class="content-body">
       
            <!-- row -->
			<div class="container-fluid ">
			<!-- 파란카드 템플릿 -->
<div class="row page-titles">
  <div class="col-sm-9 p-md-0">
      <div class="welcome-text">
          <h4><strong>매장조회</strong></h4>
          <span>트레이딩을 신청할 근처 매장을 조회합니다. <br>지도로 매장과의 거리를 계산할 수 있습니다. (좌클릭: 선 그리기 시작(거리/시간 계산), 우클릭: 선 그리기 종료)</span>
      </div>
  </div>
  <div class="col-sm-3 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="javascript:void(0)">재고트레이딩</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">매장조회</a></li>
      </ol>
  </div>
</div>
                    <div >
                        <div class="card cb-mb-1r">
                            <div class="card-body cb-pb-05r">
                                <div id="world-map" class="">
                                </div>
<!--                                 <label class="col-form-label cb-ml20" >(좌클릭: 선 그리기 시작(거리/시간 계산), 우클릭: 선 그리기 종료)</label> -->
                                <div class="row" style="margin-top:10px;">
                                <div id="searchUI">
                                <div class="mb-3 searchKeword" >
											<select name="searchType"   class="dropdown bootstrap-select default-select form-control wide">
												<option value>제품명</option>											
											</select>
                                 </div>
                                 <div class="mb-3 searchKeword">
                                     <input type="text" name="searchWord" list="choise" class="form-control" >
										<datalist id="choise">
                                        	<c:forEach items="${foodList }" var="fr">
                                        		<option value="${fr.lguName }" ></option>
                                        	</c:forEach>
                                        </datalist>
                                 </div>
                                <div class="mb-3 searchKeword" >
											<select name="searchType2" class="dropdown bootstrap-select default-select form-control wide">
												<option value>필요 갯수</option>											
											</select>
                                 </div>
                                 <div class="mb-3 searchKeword">
                                     <input type="text" name="searchWord2" class="form-control" >
                                 </div>
                                <button id="searchBtn" type="button" class="btn light btn-primary">검색</button>
                                
                            </div>
                            <div class="row">
					<div class="col-12">
						<div class="table-responsive" >
							<div id="divID">
							<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="min-width: 845px;">
								<thead id="tHead">
									<tr class="cb-tAlign-center">
										<th style="width:  15%;">가맹점명</th>
										<th style="width:  35%;">위치</th>
										<th style="width:  20%;">제품명</th>
										<th style="width:  10%;">제품갯수</th>
										<th style="width:  15%;">매장전화번호</th>
										<th style="width:  5%;"></th>
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
        </div>
<!-- Modal -->
<%-- <form id="sendForm" method="post" action="${cPath }/head/paper/send" --%>
<!-- 	enctype="multipart/form-data"> -->
	<div class="modal fade" id="sendModal" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">트레이딩 요청</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal">
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="franId"/>
					<table id="example5" class="display dataTable no-footer mAuto" >
					<thead>
						<th></th>
						<th></th>
					</thead>
					<tbody>
						<tr>
							<th>요청매장</th>
							<td id="respFran"></td>
						</tr>
						<tr>
							<th>요청 재료</th>
							<td id="buyerprodName"></td>
						</tr>
						<tr>
							<th>요청 갯수</th>
							<td><input id="frstockQty2" type="number" value="" class="form-control" ></td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" id="realSendBtn" class="btn light btn-primary">요청하기</button>
					<button type="button" class="btn light btn-danger light"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
<!-- </form> -->
<form id="searchForm" method="get" action="${cPath}/fr/tradeShop" >
<sec:csrfInput/>
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchWord"/>
	<input type="hidden"  name="searchWord2"/>
</form>
<form id="sendForm" method="post" action="${cPath}/fr/tradeShop" >
<sec:csrfInput/>
	<input type="hidden"  name="franName"/>
	<input type="hidden"  name="buyerprodName"/>
	<input type="hidden"  name="frstockQty"/>
	<input type="hidden"  name="respFran"/>
	<input type="hidden"  name="buyerprodId"/>
</form>  
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


    <!--**********************************
        Scripts
    ***********************************-->
	<!-- Datatable -->
    <script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js" ></script>
    <!-- kakao map api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f895cb402d52911b147dcc186690b7af&libraries=services,clusterer,drawing"></script>
	<script>
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
	
	let makeSingleTr = function(index, data){
		 return $('<tr>').append(
			        	$("<td>").html(data.franName)
			        			.attr({
			        				"name" : "franName"
			        			})
// 			        	,$("<td>").html(data.ownerName)
			        	,$("<td>").html(data.franAdd1).attr({
			        		"class" : "cb-wp40 cb-tAlign-left"
			        	})
			        	,$("<td>").html(data.buyerprodName)
	        			.attr({
	        				"id" : data.buyerprodId
	        				,"name" : "buyerprodName"
	        				,"class" : "cb-tAlign-left"
	        			})
			        	,$("<td>").html(data.frstockQty)
			        	.attr({
	        				"name" : "frstockQty"
		        			,"class" : "cb-tAlign-center"
	        			})
			        	,$("<td>").html(data.franTel).attr({
		        			"class" : "cb-tAlign-center"
			        	})
			        	,$("<td>").append(
					       	$("<input>")
					       		  .attr({
					       			  "type" : "button"
					       			  ,"id" : data.franId
					       			  ,"name" : "sendBtn"
					       			  ,"class" :"btn btn-primary btn-sm  cb-float-right"
					       			  ,"value" : "요청하기"
					       			  ,"data-bs-toggle":"modal"
					       			  ,"data-bs-target":"#sendModal"
					       		  })
			        		)
	   			 )
	 		 	.attr({
			 		"id" : data.franId
			 	});
	}
	
	 let searchForm = $("#searchForm").on("submit",function(event){
			event.preventDefault();
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
				beforeSend : function(xhr)
				{
				   xhr.setRequestHeader(header,token);
				},
				success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
// 					console.log(resp);
					let dataList= resp.trade.dataList;
					let trTags =[];
					if(dataList && dataList.length>0){
						$(dataList).each(function(index, data){ // this = member
							trTags.push(makeSingleTr(index, data));
						}); 
						pagingArea.html(resp.trade.pagingHTMLBS);
						totalRecord.html("<strong>총 건수 : " +resp.trade.totalRecord+"</strong>");
					}else if(dataList==null){
						let trTag = $("<tr>").html(
								$("<td>").attr("colspan","6")
								 .html("트레이딩할 재료를 검색하세요.")
								);
							trTags.push(trTag);
							pagingArea.html("");
							totalRecord.html("");
					}else{
						let trTag2 = $("<tr>").html(
								$("<td>").attr("colspan","6")
								 .append(
									$('<strong>').html("인근 매장에 재고가 존재하지 않습니다.")
								 )
								);
							trTags.push(trTag2);
							pagingArea.html("");
							totalRecord.html("");
					}
					listBody.html(trTags);
					
					var mapContainer = document.getElementById('world-map'); // 지도를 표시할 div
					var mapOption  = {
				 			center: new kakao.maps.LatLng(36.3250346, 127.4089503), // 지도의 중심좌표
				 			level: 9 // 지도의 확대 레벨
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
					
					var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
					var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
					var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
					var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
					var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
					
					// 지도에 클릭 이벤트를 등록합니다
					// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
					kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

					    // 마우스로 클릭한 위치입니다 
					    var clickPosition = mouseEvent.latLng;

					    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
					    if (!drawingFlag) {

					        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
					        drawingFlag = true;
					        
					        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
					        deleteClickLine();
					        
					        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
					        deleteDistnce();

					        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
					        deleteCircleDot();
					    
					        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
					        clickLine = new kakao.maps.Polyline({
					            map: map, // 선을 표시할 지도입니다 
					            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
					            strokeWeight: 3, // 선의 두께입니다 
					            strokeColor: '#db4040', // 선의 색깔입니다
					            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
					            strokeStyle: 'solid' // 선의 스타일입니다
					        });
					        
					        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
					        moveLine = new kakao.maps.Polyline({
					            strokeWeight: 3, // 선의 두께입니다 
					            strokeColor: '#db4040', // 선의 색깔입니다
					            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
					            strokeStyle: 'solid' // 선의 스타일입니다    
					        });
					    
					        // 클릭한 지점에 대한 정보를 지도에 표시합니다
					        displayCircleDot(clickPosition, 0);

					            
					    } else { // 선이 그려지고 있는 상태이면

					        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
					        var path = clickLine.getPath();

					        // 좌표 배열에 클릭한 위치를 추가합니다
					        path.push(clickPosition);
					        
					        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
					        clickLine.setPath(path);

					        var distance = Math.round(clickLine.getLength());
					        displayCircleDot(clickPosition, distance);
					    }
					});
					    
					// 지도에 마우스무브 이벤트를 등록합니다
					// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
					kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

					    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
					    if (drawingFlag){
					        
					        // 마우스 커서의 현재 위치를 얻어옵니다 
					        var mousePosition = mouseEvent.latLng; 

					        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
					        var path = clickLine.getPath();
					        
					        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
					        var movepath = [path[path.length-1], mousePosition];
					        moveLine.setPath(movepath);    
					        moveLine.setMap(map);
					        
					        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
					            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
					        
					        // 거리정보를 지도에 표시합니다
					        showDistance(content, mousePosition);   
					    }             
					});                 

					// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
					// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
					kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

					    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
					    if (drawingFlag) {
					        
					        // 마우스무브로 그려진 선은 지도에서 제거합니다
					        moveLine.setMap(null);
					        moveLine = null;  
					        
					        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
					        var path = clickLine.getPath();
					    
					        // 선을 구성하는 좌표의 개수가 2개 이상이면
					        if (path.length > 1) {

					            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
					            if (dots[dots.length-1].distance) {
					                dots[dots.length-1].distance.setMap(null);
					                dots[dots.length-1].distance = null;    
					            }

					            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
					                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
					                
					            // 그려진 선의 거리정보를 지도에 표시합니다
					            showDistance(content, path[path.length-1]);  
					             
					        } else {

					            // 선을 구성하는 좌표의 개수가 1개 이하이면 
					            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
					            deleteClickLine();
					            deleteCircleDot(); 
					            deleteDistnce();

					        }
					        
					        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
					        drawingFlag = false;          
					    }  
					});    

					// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
					function deleteClickLine() {
					    if (clickLine) {
					        clickLine.setMap(null);    
					        clickLine = null;        
					    }
					}

					// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
					// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
					function showDistance(content, position) {
					    
					    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
					        
					        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
					        distanceOverlay.setPosition(position);
					        distanceOverlay.setContent(content);
					        
					    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
					        
					        // 커스텀 오버레이를 생성하고 지도에 표시합니다
					        distanceOverlay = new kakao.maps.CustomOverlay({
					            map: map, // 커스텀오버레이를 표시할 지도입니다
					            content: content,  // 커스텀오버레이에 표시할 내용입니다
					            position: position, // 커스텀오버레이를 표시할 위치입니다.
					            xAnchor: 0,
					            yAnchor: 0,
					            zIndex: 3  
					        });      
					    }
					}

					// 그려지고 있는 선의 총거리 정보와 
					// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
					function deleteDistnce () {
					    if (distanceOverlay) {
					        distanceOverlay.setMap(null);
					        distanceOverlay = null;
					    }
					}

					// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
					// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
					function displayCircleDot(position, distance) {

					    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
					    var circleOverlay = new kakao.maps.CustomOverlay({
					        content: '<span class="dot"></span>',
					        position: position,
					        zIndex: 1
					    });

					    // 지도에 표시합니다
					    circleOverlay.setMap(map);

					    if (distance > 0) {
					        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
					        var distanceOverlay = new kakao.maps.CustomOverlay({
					            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
					            position: position,
					            yAnchor: 1,
					            zIndex: 2
					        });

					        // 지도에 표시합니다
					        distanceOverlay.setMap(map);
					    }

					    // 배열에 추가합니다
					    dots.push({circle:circleOverlay, distance: distanceOverlay});
					}

					// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
					function deleteCircleDot() {
					    var i;

					    for ( i = 0; i < dots.length; i++ ){
					        if (dots[i].circle) { 
					            dots[i].circle.setMap(null);
					        }

					        if (dots[i].distance) {
					            dots[i].distance.setMap(null);
					        }
					    }

					    dots = [];
					}

					// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
					// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
					// HTML Content를 만들어 리턴하는 함수입니다
					function getTimeHTML(distance) {

					    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
					    var walkkTime = distance / 67 | 0;
					    var walkHour = '', walkMin = '';

					    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
					    if (walkkTime > 60) {
					        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
					    }
					    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

					    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
					    var bycicleTime = distance / 227 | 0;
					    var bycicleHour = '', bycicleMin = '';

					    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
					    if (bycicleTime > 60) {
					        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
					    }
					    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

					    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
					    var content = '<ul class="dotOverlay distanceInfo">';
					    content += '    <li>';
					    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
					    content += '    </li>';
					    content += '    <li>';
					    content += '        <span class="label">도보</span>' + walkHour + walkMin;
					    content += '    </li>';
					    content += '    <li>';
					    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
					    content += '    </li>';
					    content += '</ul>'

					    return content;
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
	 
	 let franId=null;
	 $(document).on("click","[name='sendBtn']",function(){
// 		 console.log("hi");
// 		 console.log(this.id);
 		 franId = this.id;
 		 
		 let franName=$('tr[id="'+ franId+'"]')[0].children[0].innerHTML;
		 let buyerprodName = $('[name="buyerprodName"]').html();
		 let frstockQty = $('[name="searchWord2"]').val();
// 		 console.log("!!!"+frstockQty);
		 
		 $('[name="franId"]').prop("id",franId);
		 $('td[id="respFran"]')[0].innerHTML=franName;
		 $('td[id="buyerprodName"]')[0].innerHTML=buyerprodName;
		 $('input[id="frstockQty2"]')[0].value=frstockQty;
	 });
	 
	 $("#realSendBtn").on("click",function(){
// 		 console.log(franId);
		 
		 let franName=$('tr[id="'+ franId+'"]')[0].children[0].innerHTML;
		 let buyerprodName = $('[name="buyerprodName"]').html();
		 let frstockQty = $('#frstockQty2').val();
		 let buyerprodId =$('tr[id="'+ franId+'"]')[0].children[2].id;
		 
		 $('input[name="franName"]')[0].value=franName;
		 
		 $('input[name="buyerprodName"]')[0].value=buyerprodName;
		 
		 $('input[name="frstockQty"]')[0].value=frstockQty;
		 
		 $('input[name="respFran"]')[0].value=franId;
		 
		 $('input[name="buyerprodId"]')[0].value=buyerprodId;
		 
		 
		 $('#sendForm').submit();
		 
// 		 console.log($('input[name="franName"]')[0]);
		
// 		 console.log($('tr[id="'+ franId+'"]')[0].children[0].innerHTML);
// 		 console.log($('[name="buyerprodName"]').html());
// 		 console.log($('[name="searchWord2"]').val());
	 });
	</script>