<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<head>
  <link href="${cPath}/resources/dashboard3/css/sitInfo.css" rel="stylesheet" type="text/css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
</head>
<!--**********************************
            Content body start
        ***********************************-->
                <div class="content-body">
            	<div class="container-fluid">
                <div class="row page-titles" style='margin:0px;'>
                    <div class="col-sm-6 p-md-0"> 
                        <div class="welcome-text">
                            <h4>SEAT</h4>
                            <span>예약받을 좌석을 설정합니다. 원하는 좌석을 드래그한 뒤 맞는 위치에 드랍해주세요</span>
                            
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">가맹점정보관리</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">좌석관리</a></li>
                        </ol>
                    </div>
                </div>
<!-- Button trigger modal -->
 <button type="button" class="btn btn-primary" data-bs-toggle="modal"  style='margin:10px 0px;' data-bs-target="#exampleModalCenter">좌석 배치하기</button>
 <button type="button" id="refreshBtn" class="btn btn-dark" style='margin:10px 0px; padding:15px 20px;' > <i class="fas fa-redo"></i></button>

                <!-- row --> 
 
 

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">현재 좌석 배치도</h4>
                                							

                            </div>
                            <div class="card-body" style="display:flex; flex-direction: column; align-items: center;">
                            
								 
								 <div id="realbody" style="width: 570px; height : 450px; position: relative; border: solid #f1f1f1; background-color:#f1f1f1; border-radius: 20px;">
								 </div> 
								 <br>
								<div id="btnbody" style=" display:flex; flex-direction: row; justify-content:center; align-items:center;">
								 	
								 	<button type="button" class="btn btn-light" style="width: 20px; height : 10px; "></button>
									&nbsp: DOOR   &nbsp&nbsp
								 	 <button type="button" class="btn btn-danger" style="width: 20px; height : 10px;"></button>
									&nbsp: 2인석	  &nbsp&nbsp  
									 <button type="button" class="btn btn-warning" style="width: 20px; height :10px;"></button>
									&nbsp: 4인석   &nbsp&nbsp
									 <button type="button" class="btn btn-info"  style="width: 20px; height : 10px;"></button>
									&nbsp: 8인석&nbsp&nbsp	   
								 </div>
 
							 
                            </div> 
                        </div>
                        

 <!-- Modal -->
 <div class="modal fade" id="exampleModalCenter">
     <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title">각 좌석의 갯수를 입력해주세요</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal">
                 </button>
             </div>
             <div class="modal-body">
             		해당하는 좌석이 없다면 0을 입력합니다.
                                <div class="basic-form">
                                    <form id="seatSave">
                                        <div class="input-group input-group-lg">
											<span class="input-group-text">2인석</span>
                                            <input type="text" class="form-control" id="t2">
                                        </div>
                                        <div class="input-group input-group-lg">
											<span class="input-group-text">4인석</span>
                                            <input type="text" class="form-control" id="t4">
                                         </div>
                                        <div class="input-group input-group-lg">
											<span class="input-group-text">8인석</span>
                                            <input type="text" class="form-control" id="t8">
                                        </div>
                                    </form>
                                </div>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-danger light" id="closeBtn" data-bs-dismiss="modal">Close</button>
				    <!-- <button type="button" class="btn btn-primary" onclick="pop()">좌석배치 수정하기</button> -->
				    <button type="submit" class="btn btn-primary" id="saveseatnum">저장후 좌석배치하기</button>
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


<script>

var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

$(document).ready(function() {
	$.ajax({
		  type : 'get',
		  url : '${cPath}/fr/info/seat/seatListNew',
		  dataType : 'json',
		  beforeSend : function(xhr)
		  {
		     xhr.setRequestHeader(header,token);
		  },
		  success : function(data){
		    drawAll(data);
		  },
		  error : function(data){
		    alert('실패!');
		  }
		});
});

// 문을 그리는 메소드 by서현
function doorDraw(sitId,sitX,sitY,direc) {
	 $('#realbody').append(' <button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-light" style="top:'+sitY+'px; left:'+sitX+'px; ">Door</button>');
	 if(direc == 'N'){
		 $('#D').addClass("door");
	 } else{
		 $('#D').addClass("door_t");
	 }
}

// 2인용 좌석을 그리는 메소드 by서현
function sit2Draw(sitId,sitX,sitY,direc) {
	 $('#realbody').append(' <button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-danger" style="top:'+sitY+'px; left:'+sitX+'px; ">'+sitId+'</button>');
	 
	 if(direc == 'N'){ 
		 $('#'+sitId).addClass("t2");
	 } else{
		 $('#'+sitId).addClass("t2_t");
	 }
}

// 4인용 좌석을 그리는 메소드 by서현
function sit4Draw(sitId,sitX,sitY,direc) {
	 $('#realbody').append(' <button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-warning" style="top:'+sitY+'px; left:'+sitX+'px; ">'+sitId+'</button>');
	 if(direc == 'N'){
		 $('#'+sitId).addClass("t4");
	 } else{
		 $('#'+sitId).addClass("t4_t");
	 }
}

// 8인용 좌석을 그리는 메소드 by서현
function sit8Draw(sitId,sitX,sitY,direc) {
	 $('#realbody').append(' <button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-info" style="top:'+sitY+'px; left:'+sitX+'px; ">'+sitId+'</button>');
	 if(direc == 'N'){
		 $('#'+sitId).addClass("t8");
	 } else{
		 $('#'+sitId).addClass("t8_t");
	 }
} 

// 화면이 새로 저장한 좌석배치도로 바뀌도록 새로고침하는 메소드 by서현
$("#refreshBtn").on("click",function(){
	// 좌석배치도 리프레쉬
	$.ajax({
		  type : 'get',
		  url : '${cPath}/fr/info/seat/seatListNew',
		  dataType : 'json',
		  beforeSend : function(xhr)
		  {
		     xhr.setRequestHeader(header,token);
		  },
		  success : function(data){
		    drawAll(data);
		  },
		  error : function(data){
		    alert('실패!');
		  }
		});
});

// 이전에 저장된 좌석정보를 그리는 메소드 by서현
function drawAll(data){
	// 원래 있던 버튼들 지우고 시작
	$('#realbody').empty();
	
		for (idx in data){
	       var sitId = data[idx].sitId;
		   var sitX = data[idx].sitX;
		   var sitY = data[idx].sitY;
		   var direc = data[idx].direc;
		   console.log(sitId,sitX,sitY,direc);
		   switch (sitId.substr(0, 1)) {
		   	case 'D' : 
		  				doorDraw(sitId,sitX,sitY,direc);
		   				break;
		   	case 'T' : 
		  				sit2Draw(sitId,sitX,sitY,direc);
		   				break;
		   	case 'F' : 
		  				sit4Draw(sitId,sitX,sitY,direc);
		   				break;
		   	case 'E' : 
		  				sit8Draw(sitId,sitX,sitY,direc);
		   				break;
		   }
}
		

		   
		   
}

// save버튼 눌렀을때 팝업창을 여는 메소드 by서현
$("#saveseatnum").on("click",function(){
	// 버튼 눌렀을 시점에 input받은 데이터를 싹다 끌어온다.
	const t2 = document.getElementById('t2').value;
	const t4 = document.getElementById('t4').value;
	const t8 = document.getElementById('t8').value;
	// 팝업창으로 보내준다.
	var popupWidth = 900;
	var popupHeight = 600;
	var popupX = (window.screen.width / 2) - (popupWidth / 2); 
	var popupY= (window.screen.height / 2) - (popupHeight / 2); 
	$("#closeBtn").click();
	window.open('/CelebBack/fr/info/seat/seatPopUp/'+t2+'/'+t4+'/'+t8,  '좌석배치하기', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);	
});


</script>