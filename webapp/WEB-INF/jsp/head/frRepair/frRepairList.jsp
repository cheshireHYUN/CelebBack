<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      황단비      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="content-body">   
	<div class="container-fluid">
		<div>
			<form method="get" action="${cPath }/head/frRepair/backup">
				<sec:csrfInput/>
				<button class="btn btn-primary" type="submit" value="백업하기" style="width:400px;">backup</button>
			</form>
			<div id="progressbar1"></div>
		</div>
	</div>
</div>

<script>
var total_time = 60000;
var current_time = 0;
var refresh_interval = 600;
var timer;

function refresh_bar() {
  $( "#progressbar1" ).progressbar({ value: current_time });
  current_time += refresh_interval;
  if(current_time > total_time) clearInterval( timer );
}

$(function() {
  $( "#progressbar1" ).progressbar({ max: total_time, value: current_time });
  timer = setInterval( refresh_bar, refresh_interval );
});
</script>