<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<head>
  <link href="${cPath}/resources/dashboard3/css/sitInfo.css" rel="stylesheet" type="text/css">
  <link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<main>

	<div class="hero_single inner_pages background-image"
		data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
		<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-9 col-lg-10 col-md-8">
						<h1>Reserve</h1>
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
		<div class="container margin_120_100 pb-0">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center d-none d-lg-block"
					data-cue="slideInUp">
					<img src="${cPath}/resources/restaurant/img/myloopy.png" width="750" alt=""
						class="img-fluid">
				</div>
				<div class="col-lg-6 col-md-8" data-cue="slideInUp">
					<div class="main_title">
						<span><em></em></span>
						<h2>${franTime.franName}</h2>
						<p>${franTime.franTel}</p>
					</div>
					<div id="wizard_container">
						<form id="wrapped" method="POST">
							<sec:csrfInput/>
							<input id="website" name="website" type="text" value="">
							<!-- Leave for security protection, read docs for details -->
							<div id="middle-wizard">
								<div class="step">
									<h3 class="main_question">
										<strong>1/3</strong> Please Select a date
									</h3>
									<div class="form-group">
										<input type="hidden" name="datepicker_field"
											id="datepicker_field" class="required">
									</div>
									<div id="DatePicker"></div>
								</div>

								<script>
								var header = '${_csrf.headerName}';
								var token =  '${_csrf.token}';
								
								
                                let year = 0;
                                let month = 0;
                                let day = 0;
                                $(document).on("click",'button[name=forward]',function(){
									dataTest1 = $(".ui-state-active").not('span');
                                	year = (dataTest1.parent()).data('year');
                                	month = Number( (dataTest1.parent()).data('month') )+1;
                                	day = dataTest1.text();
                                });
                                
                                
                                </script>


								<!-- /step-->
								<div class="step">
									<h3 class="main_question">
										<strong>2/3</strong> Select time and guests
									</h3>
									<div class="step_wrapper">
										<h4>Time</h4>
										<div class="radio_select add_bottom_15">
											<ul id="timezone">

											</ul>
										</div>

										<input type="hidden" name="open"
											value="${franTime.franSttimeInt}"> <input
											type="hidden" name="close" value="${franTime.franEntimeInt}">
										<input type="hidden" name="bkStart"
											value="${franTime.franBsttimeInt}"> <input
											type="hidden" name="brEnd" value="${franTime.franBentimeInt}">

										<script>
                                        
                                        var open = $('input[name=open]').attr("value");
                                        var close = $('input[name=close]').attr("value");
                                        var bkStart = $('input[name=bkStart]').attr("value");
                                        var bkEnd = $('input[name=brEnd]').attr("value");
                                        
                                        function between(x){
                                        	return x>=bkStart && x<bkEnd;
                                        }

                                        
                                    	let index = 1;
                                        for(var i=open; i<close; i++){
                                        	let timeLabel ="";
                                        	if(between(i) == false){
                                        		timeLabel =
                                        		'<li> <input type="radio" id="time_'+index+'" name="time" value="'+i+'" class="required">'+
                                                    '<label for="time_'+index+'">'+i+'시</label>'+
                                                '</li>';
	                                            index++;
                                        		}
                                            $('#timezone').append(timeLabel);
                                        };
                                        
                                        
                                        
                                        </script>
										<!-- /time_select -->
									</div>
									<!-- /step_wrapper -->
									<div class="step_wrapper">
										<h4>How many people?</h4>
										<div class="radio_select">
											<ul>
												<li><input type="radio" id="people_1" name="people"
													value="1" class="required"> <label for="people_1">1</label>
												</li>
												<li><input type="radio" id="people_2" name="people"
													value="2" class="required"> <label for="people_2">2</label>
												</li>
												<li><input type="radio" id="people_3" name="people"
													value="3" class="required"> <label for="people_3">3</label>
												</li>
												<li><input type="radio" id="people_4" name="people"
													value="4" class="required"> <label for="people_4">4</label>
												</li>
												<li><input type="radio" id="people_5" name="people"
													value="5" class="required"> <label for="people_5">5</label>
												</li>
												<li><input type="radio" id="people_6" name="people"
													value="6" class="required"> <label for="people_6">6</label>
												</li>
												<li><input type="radio" id="people_7" name="people"
													value="7" class="required"> <label for="people_7">7</label>
												</li>
												<li><input type="radio" id="people_8" name="people"
													value="8" class="required"> <label for="people_8">8+</label>
												</li>
											</ul>
										</div>
										<!-- /people_select -->
									</div>
									<!-- /step_wrapper -->
									<script>
                                    
                                    let time = 0;
                                    let people = 0;

                                    $(document).on("click",'input[name=time]',function(){
                                    	time = $(this).val();
                                    });
                                    
                                    $(document).on("click",'input[name=people]',function(){
                                    	people = $(this).val();
     								   
                                    });

                                    </script>


								</div>
								<!-- /step-->
								<div class="submit step">
									<h3 class="main_question">
										<strong>3/3</strong> 원하시는 자리를 선택해주세요
									</h3>
									<p>
										선택한 좌석 : <span id="selSit">선택한 좌석이 없습니다.</span>
									</p>

									<div class="form-group">
										<c:forEach var="seat" items="${seatList}">
											<input type="hidden" name="table" value0="${seat.sitId}"
												value1="${seat.sitX}" value2="${seat.sitY}" value3="${seat.direc}">
										</c:forEach>
										<!-- 1. 일단 좌석을 띄울 750x450짜리 div를 만든다 -->
										<div>
											<div id="realbody"
												style="width: 570px; height: 450px; position: relative; border: solid white; background-color:white; border-radius: 20px;">
											</div>
										</div>
									</div>


									<script> 
							 let selectSit = "";
							 
							 // 가맹점의 좌석정보에 따라 버튼을 배치
							 $(document).ready(function() {
								   $("input[name=table]").each(function(index, item){
								       var sitId = $(item).attr("value0");
									   var sitX = $(item).attr("value1");
									   var sitY = $(item).attr("value2");
									   var direc = $(item).attr("value3");
								   
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
								   
								   
								   
								   });
								  
								 // 좌석 선택 처리
								 $(":button").on('click', function(){
									 let sitId = this.id;
									   switch (sitId.substr(0, 1)) {
									   	case 'D' : 
									   				swal("문은 선택할 수 없습니다");
									   				break;
									   	case 'T' : 
									  				selectSit = this.id;
									  				$("#selSit").html(this.id);
									   				break;
									   	case 'F' : 
									   				selectSit = this.id;
									   				$("#selSit").html(this.id);
									   				break;
									   	case 'E' : 
									   				selectSit = this.id;
									   				$("#selSit").html(this.id);
									   				break;
									   }
								 });
								 

										 
								});
							 
							  
							 
							 
							 function doorDraw(sitId,sitX,sitY,direc) {
								 $('#realbody').append(' <button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-secondary" style="top:'+sitY+'px; left:'+sitX+'px; ">Door</button>');
								 if(direc == 'N'){
									 $('#D').addClass("door");
								 } else{
									 $('#D').addClass("door_t");
								 }
/* 								 $('#realbody').append(' <button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-light"'+
										 'style="position: absolute; display: flex; align-items:center; justify-content: center; width: 200px; height : 20px; position: absolute; top:'+sitY+'px; left:'+sitX+'px; ">Door</button>');			 */
							 }
							 
							 function sit2Draw(sitId,sitX,sitY,direc) {
								 $('#realbody').append(' <input value="2인석" type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-danger" style="top:'+sitY+'px; left:'+sitX+'px; "/>');
								 
								 if(direc == 'N'){
									 $('#'+sitId).addClass("t2");
								 } else{
									 $('#'+sitId).addClass("t2_t");
								 }
/* 								 $('#realbody').append(' <button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-danger"'+
										 'style="position: absolute; width: 80px; height : 50px; position: absolute; top:'+sitY+'px; left:'+sitX+'px; ">'+sitId+'</button>');								  */
							 }
							 
							 function sit4Draw(sitId,sitX,sitY,direc) {
								 $('#realbody').append(' <input value="4인석" type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-warning" style="top:'+sitY+'px; left:'+sitX+'px; "/>');
								 if(direc == 'N'){
									 $('#'+sitId).addClass("t4");
								 } else{
									 $('#'+sitId).addClass("t4_t");
								 }
								/*  $('#realbody').append('<button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-warning" '+
										 'style="position: absolute; width: 110px; height : 60px; position: absolute; top:'+sitY+'px; left:'+sitX+'px; ">'+sitId+'</button>');	 */							 
							 }
							 
							 function sit8Draw(sitId,sitX,sitY,direc) {
								 $('#realbody').append(' <input value="8인석" type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-info" style="top:'+sitY+'px; left:'+sitX+'px; "/>');
								 if(direc == 'N'){
									 $('#'+sitId).addClass("t8");
								 } else{
									 $('#'+sitId).addClass("t8_t");
								 }
								/*  $('#realbody').append(' <button type="button" id="'+sitId+'" data-sitId="'+sitId+'" class="btn btn-info" '+
										 'style="position: absolute; width: 90px; height : 180px; position: absolute; top:'+sitY+'px; left:'+sitX+'px; ">'+sitId+'</button>'); */								 
							 } 
							 
  							 function block(data){
  								 // data에 들어온 좌석을 블락해준다
  								 for (var i in data) {
	  								 let blockSitId = data[i];
	  								 $("#"+blockSitId).attr("disabled", true);  									 
  								 }
  							 }
							 

							 
							 </script>



									<div class="form-group terms">
										<label class="container_check"> (필수) <a
											href="#" data-bs-toggle="modal" data-bs-target="#terms-txt"> 선택한 날짜와 좌석정보를 바탕으로 예약을 진행합니다.</a> <input type="checkbox" name="terms"
											value="Yes" class="required"> <span class="checkmark"></span>
										</label>
									</div>
								</div>
								<!-- /step-->
							</div>
							<!-- /middle-wizard -->
							<div id="bottom-wizard">
								<button type="button" name="backward" class="backward">Prev</button>
								<button type="button" name="forward" class="forward">Next</button>
								<button type="submit" name="process" class="submit">Submit</button>
							</div>

							<input type="hidden" name="year" id="syear" value=""> 
							<input type="hidden" name="month" id="smonth" value=""> 
							<input type="hidden" name="day" id="sday" value="">
							<!-- <input type="hidden" name="time" id="stime" value="">
                            <input type="hidden" name="people" id="speople" value=""> -->
							<input type="hidden" name="selectSit" id="sselectSit" value="">
							<input type="hidden" name="franId" id="franId" value="${franId}">

							<script>
                            	$('button[name=forward]').on("click",function(){
                            		blockSit(year,month,day,time,people);
                            	});
                                
      							 function blockSit(year,month,day,time){
	   								 franId = $('#franId').val();
	   								 resvDate = year+"/"+month+"/"+day;
	   								 time = time+":00";
	   								 let datas = {
	  										  franId : franId,
	  										  resvDate : resvDate,
	  										  time : time
	  									  };
	   								 $.ajax({
	  									  type : 'post',
	  									  url : '${cPath}/reserve/info/resvSeatInfo',
	  									  contentType: 'application/json',
	  									  data : JSON.stringify(datas),
	  									  dataType : 'json',
		  									beforeSend : function(xhr)
		  									{
		  									   xhr.setRequestHeader(header,token);
		  									},
	  									  success : function(data){
	  									      block(data);
	  									  },
	  									  error : function(data){
	  									      alert('실패!');
	  									  }
	  									});
   								 }
      							 

                            	
                            	$('button[name=process]').on("click",function(){
                            		$('#syear').val(year);
                            		$('#smonth').val(month);
                            		$('#sday').val(day);
                            		$('#stime').val(time);
                            		$('#speople').val(people);
                            		$('#sselectSit').val(selectSit);
                            		let franId = $('#franId').val();
                            		let url = '/CelebBack/reserve/menu/'+franId;
                            		$('form#wrapped').attr('action', url);
                            	});
                            	
                            	
                            	
                            </script>

							<!-- /bottom-wizard -->
						</form>


						<!-- Button trigger modal -->

















					</div>
					<!-- /Wizard container -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /pattern_2 --> </main>
	<!-- /main -->



	<div id="toTop"></div>
	<!-- Back to top button -->

	<!-- Modal terms -->
	<div class="modal fade" id="terms-txt" tabindex="-1" role="dialog"
		aria-labelledby="termsLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="termsLabel">Terms and conditions</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						매장 상황에따라 좌석이 바뀔수있음에 동의합니다.
					</p>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- COMMON SCRIPTS -->
	<script src="${cPath}/resources/restaurant/js/common_scripts.min.js"></script>
	<script src="${cPath}/resources/restaurant/js/common_func.js"></script>
	<script src="${cPath}/resources/restaurant/phpmailer/validate.js"></script>
	<!-- SPECIFIC SCRIPTS (wizard form) -->
	<script
		src="${cPath}/resources/restaurant/js/wizard/wizard_scripts.min.js"></script>
	<script src="${cPath}/resources/restaurant/js/wizard/wizard_func.js"></script>
	
	

</body>