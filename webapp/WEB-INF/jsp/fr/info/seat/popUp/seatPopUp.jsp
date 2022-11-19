<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 17.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Draggable - Snap to element or grid</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
 	<link href="${cPath}/resources/dashboard3/css/popUpStyle.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	/** 
	 * jquery에 cpath 상수  
	 * javascript 파일에서도 cPath를 쓸 수 있게됨
	 */
		$.CPATH = "${cPath}";
</script>

 
</head>
 
<body> 
	<div class="btnDiv">
		<!-- Button trigger modal -->
		<button type="button" id="modalBtn" style="padding: 2px 10px; margin: 10px 0px;" class="btn btn-success" >
		  ? 
		</button>
	</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">도움말</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="display:flex;justify-content: center; align-items: center; flex-direction: column;">
        	<div>왼쪽 상자에 정렬된 테이블을 <strong>드래그</strong>하여 </div> 
        	<div>오른쪽 상자에  <strong>드랍</strong>해주세요.</div>
        	<br><strong>&#8251; 더블클릭하면 테이블을 회전할 수 있습니다.</strong>
      </div> 
 
    </div>
  </div>
</div>

	<div class="box">
	
		<div class="setting">
			<div id="s0" class="s"></div>
			<div id="s1" class="s"></div>
			<div id="s2" class="s"></div> 
			<div id="s3" class="s"></div>
		</div> 
		
		 
		 <div class="target">
		 </div>
		
	</div>	 
	
	
	<div class="btnDiv">
		<button type="button" class="btn btn-outline-primary" id="save" onclick="saveBtn()">저장</button>
	</div>
 
 <input type="hidden" id="t2value" value="${t2}">
 <input type="hidden" id="t4value" value="${t4}">
 <input type="hidden" id="t8value" value="${t8}">
 
 

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

var t2 = document.getElementById("t2value").value;
var t4 = document.getElementById("t4value").value;		
var t8 = document.getElementById("t8value").value;		

$(document).ready(function() {
	
	// 첫화면에 모달이 자동으로 켜지도록함 by서현
	$("#modalBtn").click();
	
	// 문을 생성 by서현
	$('#s0').append(' <div class="draggable ui-widget-content door" id="door" >Door</div>');
	
	// 문을 더블클릭시 회전 by서현
	$( ".door" ).dblclick(function(e) {
		  var t_id = (e.target.id);
		  if( $('#'+t_id).hasClass("door_t") ){
			  $('#'+t_id).animate({width:"200px",height:"20px"}); 
			  $('#'+t_id).removeClass("door_t");
		  } else{
			  $('#'+t_id).animate({width:"20px",height:"200px"});
			  $('#'+t_id).addClass("door_t");
		  }
	}); 
	
	// 입력폼에 저장한 갯수만큼 2인, 4인, 8인 테이블을 생성 by서현
	for(var i=0; i<t2; i++){
	    $('#s1').append('<div id="TT'+i+'" style="background-color:#F72B50; color:white; border-color:#F72B50;" data-seat="TT'+i+'" class="btn btn-outline-danger draggable ui-widget-content t2"><p>TT'+i+'</p><span>2인</span></div>');
	}		
	for(var i=0; i<t4; i++){
	    $('#s2').append('<div id="FT'+i+'" style="background-color:#FF6D4D; color:white; border-color:#FF6D4D;" data-seat="FT'+i+'" class="btn btn-warning draggable ui-widget-content t4"><p>FT'+i+'</p><span>4인</span></div>');
	}		
	for(var i=0; i<t8; i++){ 
	    $('#s3').append('<div id="ET'+i+'" style="background-color:#2781D5; color:white; border-color:#2781D5;" data-seat="ET'+i+'" class="btn btn-info draggable ui-widget-content t8"><p>ET'+i+'</p><span>8인</span></div>');
	}
	
	// 각 테이블 더블클릭시 회전  by서현
	$( ".t2" ).dblclick(function(e) {
		  var t_id = e.currentTarget.id;
		  console.log("ck2:",t_id);
		  if( $('#'+t_id).hasClass("t2_t") ){
			  $('#'+t_id).animate({width:"80px",height:"60px"});
			  $('#'+t_id).removeClass("t2_t");
		  } else{
			  $('#'+t_id).animate({width:"60px",height:"80px"});
			  $('#'+t_id).addClass("t2_t");
		  }
	});
	$( ".t4" ).dblclick(function(e) {
			var t_id = e.currentTarget.id;
		  if( $('#'+t_id).hasClass("t4_t") ){
			  $('#'+t_id).animate({width:"110px",height:"60px"});
			  $('#'+t_id).removeClass("t4_t");
		  } else{
			  $('#'+t_id).animate({width:"60px",height:"110px"});
			  $('#'+t_id).addClass("t4_t");
		  }
	});
	$( ".t8" ).dblclick(function(e) {
			var t_id = e.currentTarget.id;
		  if( $('#'+t_id).hasClass("t8_t") ){
			  $('#'+t_id).animate({width:"180px",height:"90px"});
			  $('#'+t_id).removeClass("t8_t");
		  } else{
			  $('#'+t_id).animate({width:"90px",height:"180px"});
			  $('#'+t_id).addClass("t8_t");
		  }
	});
	
});
	
// 도움말 모달버튼 클릭  by서현
$("#modalBtn").on('click',function(){
	swal("도움말", "왼쪽 상자에 정렬된 테이블을 드래그하여\n오른쪽 상자에 드랍해주세요.\n더블클릭하면 테이블을 회전할 수 있습니다.");
})

// 드래그앤 드랍을 사용하기위한 jQuery-ui 라이브러리의 메소드 by서현
$( function() {
  $( ".draggable" ).draggable({ grid: [ 20, 20 ] });
  
} );

// 좌석배치를 끝낸뒤 save했을때 실행되는 메소드  by서현
function saveBtn(){
	// 모든 좌표들을 반복문 돌려서 넣는다.
	let seatInfo = [];
	
	var x = $('#door').position().top- $('.target').position().top;
	var y = $('#door').position().left- $('.target').position().left;
	//가로세로 판별해서 direc도 채워줄거임
	  if( $('#door').hasClass("door_t") ){
		  // 디폴트가 가로일때, if안은 세로로 돌린상태
		  var direct = 'Y';
	  } else{
		  // 디폴트인 가로상태
		  var direct = 'N';
	  }
	seatInfo.push({sitId : 'D', sitX : x, sitY : y, direc : direct});
	
	var t2s = document.getElementsByClassName('t2');
		for(var i=0; i<t2s.length; i++){
			var seatId = t2s[i].dataset.seat;
			var x = $('#'+seatId).position().top - $('.target').position().top;
			var y = $('#'+seatId).position().left- $('.target').position().left;
			
			//가로세로 판별해서 direc도 채워줄거임
			  if( $('#'+seatId).hasClass("t2_t") ){
				  // 디폴트가 가로일때, if안은 세로로 돌린상태
				  var direct = 'Y';
			  } else{
				  // 디폴트인 가로상태
				  var direct = 'N';
			  }
			seatInfo.push({sitId : seatId, sitX : x, sitY : y, direc : direct});
		}		
		
		 
	var t4s = document.getElementsByClassName('t4');
		for(var i=0; i<t4s.length; i++){
			var seatId = t4s[i].dataset.seat;
			var x = $('#'+seatId).position().top - $('.target').position().top;
			var y = $('#'+seatId).position().left- $('.target').position().left;
			//가로세로 판별해서 direc도 채워줄거임
			  if( $('#'+seatId).hasClass("t4_t") ){
				  // 디폴트가 가로일때, if안은 세로로 돌린상태
				  var direct = 'Y';
			  } else{
				  // 디폴트인 가로상태
				  var direct = 'N';
			  }
			seatInfo.push({sitId : seatId, sitX : x, sitY : y, direc : direct});
		}	
		
		
	var t8s = document.getElementsByClassName('t8');
		for(var i=0; i<t8s.length; i++){
			var seatId = t8s[i].dataset.seat;
			var x = $('#'+seatId).position().top - $('.target').position().top;
			var y = $('#'+seatId).position().left- $('.target').position().left;
			//가로세로 판별해서 direc도 채워줄거임
			  if( $('#'+seatId).hasClass("t8_t") ){
				  // 디폴트가 가로일때, if안은 세로로 돌린상태
				  var direct = 'Y';
			  } else{
				  // 디폴트인 가로상태
				  var direct = 'N';
			  }
			seatInfo.push({sitId : seatId, sitX : x, sitY : y, direc : direct});
		}	

 	$.ajax({
		type:'post',
		url: '/CelebBack/fr/info/seat/seatForm',
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType:'text',
		data : JSON.stringify(seatInfo),
		beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
		success: function(result){
			if(result=='success'){
				swal({
					  title: "저장완료",
					  text: "좌석배치도가 저장되었습니다.",
					  buttons: {
					    cancel: "닫기",
					  }, 
					})
					.then((value) => {
					  switch (value) {
					    case "defeat":
					      window.close();
					      break;
					    default:
					    window.close();
					  }
					});
			}
		}
	});

	
	
}


</script>
 
</body>
</html>