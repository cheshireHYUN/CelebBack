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
<link href="${cPath }/resources/dashboard3/vendor/fullcalendar/css/main.min.css" rel="stylesheet">
        <!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
            <div class="container-fluid">
			<!-- 파란카드 템플릿 -->
<div class="row page-titles">
  <div class="col-sm-6 p-md-0">
      <div class="welcome-text">
          <h4><strong>매장점검관리</strong></h4>
          <span>가맹점 점검일을 조회합니다. </span>
      </div>
  </div>
  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="javascript:void(0)">Advanced</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">Nestable</a></li>
      </ol>
  </div>
</div>				
                <!-- row -->
                <div class="row">
                    <div >
                        <div class="card">
                            <div class="card-body">
                              	 <div id='calendar'></div>
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


    <!--**********************************
        Scripts
    ***********************************-->

	<!-- Apex Chart -->
	<script src="${cPath }/resources/dashboard3/vendor/apexchart/apexchart.js"></script>
	
    <!--removeIf(production)-->
    <script src="${cPath }/resources/dashboard3/vendor/jqueryui/js/jquery-ui.min.js"></script>
    <script src="${cPath }/resources/dashboard3/vendor/moment/moment.min.js"></script>

    <script src="${cPath }/resources/dashboard3/vendor/fullcalendar/js/main.min.js"></script>
<%--     <script src="${cPath }/resources/dashboard3/js/plugins-init/fullcalendar-init.js"></script> --%>
    
<script>
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
				selectable : true, // 달력 일자 드래그 설정가능
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
</script>