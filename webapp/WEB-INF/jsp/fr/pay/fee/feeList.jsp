<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 6.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!doctype html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
<style>
.table td{
padding: 6px 8px;
}

a:hover {
  text-decoration: underline;
}
</style>
</head>


<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js">
// 다운 받아서 넣지 말고 CDN을 쓰는 것을 권장함.
</script>

<div class="content-body">
 	<div class="container-fluid">
			<!-- 제목 템플릿 -->
			<div class="row page-titles" style="margin-bottom: 0px;">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>본사 청구</strong></h4>
			          <span>월별로 본사에 결산액을 납부합니다. 금액을 클릭하면 상세내역을 조회 할 수 있습니다.</span>
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">납부</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">본사청구</a></li>
			      </ol>
			  </div>
			</div> 
			<!-- 제목 템플릿 끝 -->
			
			<p>
	</div> <!-- 이거 추가하니까 테이블 꽉채워짐 -->


	<div class="container-fluid" style="padding-top: 15px; display:flex; justify-content: space-around;;">
	
	
                        <div class="card" style=" width:40%;">
                            <div class="card-header">
                                <a class="page-link" href="javascript:void(0)" onclick="goPrev()">
	                                <i class="la la-angle-left"></i></a>
                                <h4 id="inputMonth" class="card-title">n월</h4>
                                 <a class="page-link" href="javascript:void(0)" onclick="goNext()">
	                                 <i class="la la-angle-right"></i></a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" style="min-width: 300px;">
                                         <thead>
                                            <tr>
                                                <th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">비용</th>
                                                <th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">금액</th>
                                            </tr>
                                        </thead>
                                            <col width="50%" />
   											<col width="50%" />
                                        <tbody>

                                            <tr>
                                                <td >Ⅰ. 프랜차이즈 이용비</td>
                                                <td  style="background-color:#ffff; text-align:right; color:rgb(30,144,255);" >
                                                <a id="feeFruse" href="javascript:void(0)" style="color:rgb(30,144,255);"
                                                data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" 
                                                data-bs-content="셀럽백의 가맹점은 매달 본사에 &#x20a9; 500,000을 납부한다." 
                                        		title="프랜차이즈 이용비"
                                                ></a>
                                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td >Ⅱ. 로열티</td>
                                                <td  style="background-color:#ffff; text-align:right; color:rgb(30,144,255);">
                                                <a class="tc" id="feeRoyal" href="javascript:void(0)" style="color:rgb(30,144,255);"></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td >Ⅲ. 제품 구입비</td>
                                                <td  style="background-color:#ffff; text-align:right; color:rgb(30,144,255);">
                                                <a class="tc" id="feeCost" href="javascript:void(0)" style="color:rgb(30,144,255);"></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td >Ⅳ. 트레이딩 추가결제비</td>
                                                <td  style="background-color:#ffff; text-align:right; color:rgb(30,144,255);">
                                                <a class="tc" id="feeTplus" href="javascript:void(0)" style="color:rgb(30,144,255);"></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td >Ⅴ. 연체이자</td>
                                                <td  style="background-color:#ffff; text-align:right; color:rgb(30,144,255);">
                                                <a id="feeOverdue" href="javascript:void(0)" style="color:rgb(30,144,255);"
                                                data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" 
                                                data-bs-content="청국액을 납부하지 않은달에 한하여 총납부액의 10%를 이자로 부과한다." 
                                        		title="연체이자"
                                                ></a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Ⅵ.트레이딩 삭감비</td>
                                                <td style="background-color:#ffff; text-align: right; color:#f72b50;">
                                                <a class="tc" id="feeTminus" href="javascript:void(0)" style="color:#f72b50;"></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ⅶ. 쿠폰지원비</td>
                                                <td style="background-color:#ffff; text-align: right; color:#f72b50;">
                                                <a class="tc" id="feeCpn" href="javascript:void(0)" style="color:#f72b50;"></a>
                                                </td>
                                            </tr> 
                                            <tr>
                                                <td style="background-color:#ffff;">합계</td>
                                                <td id="sumFee" style="background-color:rgba(235, 29, 54,0.3); text-align: right; color:rgb(0,0,0);">
                                                </td> 
                                            </tr>

                                        </tbody>
                                    </table>
                                    <div style="display:flex; justify-content: flex-end; ">
                                    	<input type="button" id="payBtn" class="btn btn-primary btn-sm" value=''/>
                                    </div>	

                                    
                                </div> 
                            </div>
                        </div>
                        
                        
					<div class="col-xl-7 col-lg-12 col-sm-12" style=" width:50%;">
                                <div class="card">
                                   <div class="card-header" id='ch'></div>
                                    <div id='cb' style='text-align: center; padding: 20px;font-size: 16px;'>
                                    <p>금액 클릭시 상세보기가 가능합니다.</p>
                                    
                                    </div>
                                </div>
                    </div>
                    

       </div> <!-- row -->
	</div> <!-- 두번째 container-fluid -->
</div>

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';


$( document ).ready(function() {
	firstLoad();
});

function firstLoad(){
	var nowDate = new Date();
	var nowYear = nowDate.getFullYear();
	var nowMonth = nowDate.getMonth() + 1;
	
	var feeSdate = nowYear+'/'+(nowMonth)+'/'+'01';
	
	getPage(feeSdate);

}

function getPage(feeSdate){
	datas = {
			feeSdate : feeSdate
	};
	
 	$.ajax({
		  type : 'post',
		  url : '${cPath}/fr/pay/fee/list',
		  contentType: 'application/json',
		  data : JSON.stringify(datas),
		  dataType : 'json',
		  beforeSend : function(xhr)
		  {
		     xhr.setRequestHeader(header,token);
		  },
		  success : function(data){
		      drawTable(data);
		      drawBtn(data);
		  },
		  error : function(data){
		    alert("ajax 실패!");
		  }
	});
}

function ifNullZero(p_data){
	if(!p_data) return 0;  // null, "".. 값이 false 처리되면 무조건 0
	return parseInt(p_data);       // 문자열 더하기 예방
}

function ifDateToYear(feeSdate){
	let year = (feeSdate).substring(0,4);
	let month = parseInt((feeSdate).substring(5,7))-1;
	if(month == 0){
		year = year-1;
	} else if(month == 13){
		year = year+1;
	}
	return year;
}
function ifDateToMonth(feeSdate){
	let month = parseInt((feeSdate).substring(5,7))-1;
	if(month == 0){
		month = 12; 
	} else if(month == 13){
		month = 1;
	}
	return month;
}

function drawTable(data){
	var v_freeFruse = ifNullZero(data.feeFruse);
	var v_feeRoyal = ifNullZero(data.feeRoyal);
	var v_feeCost = ifNullZero(data.feeCost);
	var v_feeTplus = ifNullZero(data.feeTplus);
	var v_feeTminus = ifNullZero(data.feeTminus);
	var v_feeOverdue = ifNullZero(data.feeOverdue);
	var v_feeCpn = ifNullZero(data.feeCpn);
	var v_sum = v_freeFruse + v_feeRoyal + v_feeCost + v_feeTplus - v_feeTminus + v_feeOverdue - v_feeCpn;
	
	$('#inputMonth').html( ifDateToYear(data.feeSdate)+'년 '+ifDateToMonth(data.feeSdate)+'월' );
	$('#feeFruse').html('&#8361;'+' '+ v_freeFruse.toLocaleString());
	$('#feeRoyal').html('&#8361;'+' '+ v_feeRoyal.toLocaleString());
	$('#feeCost').html('&#8361;'+' '+  v_feeCost.toLocaleString() );
	$('#feeTplus').html('&#8361;'+' '+ v_feeTplus.toLocaleString() );
	$('#feeTminus').html('&#8361;'+' '+ v_feeTminus.toLocaleString());
	$('#feeOverdue').html('&#8361;'+' '+ v_feeOverdue.toLocaleString());
	$('#feeCpn').html('&#8361;'+' '+ v_feeCpn.toLocaleString());
	$('#sumFee').html('&#8361;'+' '+ v_sum.toLocaleString());
	
	

} 

function drawBtn(data){
	var nowDate = new Date();
	var nowYear = nowDate.getFullYear();
	var nowMonth = nowDate.getMonth() + 1;

	if(data.feepayDate == null){
		if( (( parseInt( (data.feeSdate).substring(0,4) ) >= parseInt(nowYear) ) && ( (parseInt((data.feeSdate).substring(5,7)))-1 >= parseInt(nowMonth) ))
				|| parseInt( (data.feeSdate).substring(0,4) ) > parseInt(nowYear) ){
			$('#payBtn').attr('value','납부기간이 아닙니다');
			$("#payBtn").attr("disabled", true); 
		}else{
			$("#payBtn").attr("disabled", false); 
			$('#payBtn').attr('value','납부하기');
		}
	}else{ 
		$('#payBtn').attr('value',data.feepayDate+'에'+' 납부된 건입니다.');
		$("#payBtn").attr("disabled", true); 
	}
}


function goPrev(){ 
	$('#ch').empty();
	$('#cb').empty();	
	var selectDate =$('#inputMonth').html();
	let prevYear = parseInt(selectDate.substring(0,4));
	let prevMonth = parseInt(selectDate.substring(6,8));
	if((String(prevMonth)).length == 1){
		prevMonth = "0"+String(prevMonth);
	} 
	var feeSdate = prevYear+'/'+(prevMonth)+'/'+'01';
	
	// 이전달 내역은 그 다음달1일로 조회하니까 걍 지금 .html()을 보내면됨
	getPage(feeSdate);
	
}

function goNext(){
	$('#ch').empty();
	$('#cb').empty();	
	// 2022년 12월 상태
	// 넘기면 1월달 내역을 조회해야 하니까 2월 1일을 계산해야됨
	var selectDate =$('#inputMonth').html();
	let prevYear = parseInt(selectDate.substring(0,4));
	let prevMonth = parseInt(selectDate.substring(6,8))+2;
	if (prevMonth == 13){
		// 11월에서 넘기면 12월조회해야하니까 1월검색해야하는데 11+2는 13임 여기서 처리해주자
		prevYear = prevYear+1;
		prevMonth = 1;
	} else if(prevMonth == 14){
		// 12월에서 넘기면 1월을 조회해야 하니까 2월검색, 12+2는 14니까 바꿔주장
		prevYear = prevYear+1;
		prevMonth = 2;
	}
	if((String(prevMonth)).length == 1){
		prevMonth = "0"+String(prevMonth);
	} 
	
	var feeSdate = prevYear+'/'+(prevMonth)+'/'+'01';
	getPage(feeSdate);
}





$('.tc').on('click',function(e){ 
	drawDetailContent((e.target).id);
})
function drawDetailContent(selectId){
	var selectDate =$('#inputMonth').html();
	let sYear = parseInt(selectDate.substring(0,4));
	let sMonth = parseInt(selectDate.substring(6,8));
	
	let eMonth = 0;
	let eYear = 0;
	if(sMonth+1 == 13){
		eMonth = 1;
		eYear = sYea+1;
	}else{
		eMonth = sMonth+1;
		eYear = sYear;
	}
	
	let datas = {
			sdate : sYear+'/'+sMonth+'/01',
			edate : eYear+'/'+eMonth+'/01',
			target : selectId
	};
	
 	$.ajax({
		  type : 'post',
		  url : '${cPath}/fr/pay/fee/listDetail',
		  contentType: 'application/json',
		  data : JSON.stringify(datas),
		  dataType : 'json',
		  beforeSend : function(xhr)
		  {
		     xhr.setRequestHeader(header,token);
		  },
		  success : function(data){
		    drawDetail(data[0].target,data);
		  },
		  error : function(data){
		    alert("세부내용 불러오기에 실패했습니다.");
		  }
	});
}


function drawDetail(selectId,data){
	switch (selectId){
	// 로열티 
	case 'feeRoyal' :
		$('#ch').empty();
		$('#cb').empty();	
		$('#ch').html('로열티 상세');
		$('#cb').append(	                                                                                             
				                                                                                                         
			'<table class="table" style="min-width: 300px;">'                                                            +
		            '<thead>'                                                                                            +
		            '<tr>'                                                                                               +
		                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">날짜</th>'        +
		                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">일일매출</th>'   +
		            '</tr>'                                                                                              +
		        '</thead>'                                                                                               +
		            '<col width="50%" />'                                                                                +
						'<col width="50%" />'                                                                            +
		        '<tbody id="tbo">'                                                                                       +
		       ' </tbody>'                                                                                               +
		   ' </table>'
		);
		for(var i=0; i<data.length; i++){
			$('#tbo').append(
	           ' <tr>'+
	                '<td >'+data[i].vdate+'</td>'+
	                '<td  style="background-color:#ffff; text-align:right;" >'+
	               ' <div class="feeFruse" href="javascript:void(0)">'+data[i].vsum.toLocaleString()+'</div>'+
	                '</td>'+
	            '</tr>'	
			);
		}
		
		let totalFeeRoyal = 0;
		for(var i in data){ 
			totalFeeRoyal += data[i].vsum;
		}
		let finalFeeRoyal = totalFeeRoyal*(0.05);
		
		$('#tbo').append(
           ' <tr>'+
                '<td >전체매출</td>'+
                '<td  style="background-color:#ffff; text-align:right;" >'+
               ' <div id="allFeeFruse" href="javascript:void(0)">'+totalFeeRoyal.toLocaleString()+'</div>'+
                '</td>'+
            '</tr>'	+
                ' <tr>'+
                '<td >로열티(전체매출의 5%)</td>'+
                '<td  style="background-color:#ffff; text-align:right; color:#ffff;" >'+
               ' <div class="feeFruse" href="javascript:void(0)" style="color:rgb(30,144,255);">'+'&#8361;'+finalFeeRoyal.toLocaleString()+'</div>'+
                '</td>'+
            '</tr>'	
		);
		
		break;  
		
	// 제품구입비
	case 'feeCost' :
		$('#ch').empty();
		$('#cb').empty();	
		$('#ch').html('제품구입비 상세');
		$('#cb').append(	                                                                                             
                
				'<table class="table" style="min-width: 300px;">'                                                            +
			            '<thead>'                                                                                            +
			            '<tr>'                                                                                               +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">제품명</th>'        +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">구매수량(/개)</th>'   +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">총 가격</th>'   +
			            '</tr>'                                                                                              +
			        '</thead>'                                                                                               +
			            '<col width="50%" />'                                                                                +
							'<col width="50%" />'                                                                            +
			        '<tbody id="tbo">'                                                                                       +
			       ' </tbody>'                                                                                               +
			   ' </table>'
			);
			for(var i=0; i<data.length; i++){
				$('#tbo').append(
		           ' <tr>'+
		                '<td >'+data[i].vname+'</td>'+
		                '<td>'+data[i].vcnt+'</td>'+
		                '<td>'+data[i].vsum.toLocaleString()+'</td>'+
		            '</tr>'	
				);
			}
			
			let totalFeeCost = 0;
			for(var i in data){ 
				totalFeeCost += data[i].vsum;
			}
			
			$('#tbo').append(
	           ' <tr>'+
	               '<td>전체 구입비</td>'+
	               '<td></td>'+
	               '<td style="color:rgb(30,144,255);">'+'&#8361;'+totalFeeCost.toLocaleString()+'</td>'+
	            '</tr>'	
			);
		
		break;
		
	// 트레이딩 추가결제비
	case 'feeTplus' :
		$('#ch').empty();
		$('#cb').empty();	
		$('#ch').html('트레이딩 추가결제비 상세');
		$('#cb').append(	                                                                                             
                
				'<table class="table" style="min-width: 300px;">'                                                            +
			            '<thead>'                                                                                            +
			            '<tr>'                                                                                               +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">날짜</th>'        +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">제품명</th>'        +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">갯수</th>'   +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">가격</th>'   +
			            '</tr>'                                                                                              +
			        '</thead>'                                                                                               +
			            '<col width="50%" />'                                                                                +
							'<col width="50%" />'                                                                            +
			        '<tbody id="tbo">'                                                                                       +
			       ' </tbody>'                                                                                               +
			   ' </table>'
			);
			for(var i=0; i<data.length; i++){
				$('#tbo').append(
		           ' <tr>'+
		                '<td >'+data[i].vdate+'</td>'+
		                '<td >'+data[i].vname+'</td>'+
		                '<td>'+data[i].vcnt+'</td>'+
		                '<td>'+data[i].vsum.toLocaleString()+'</td>'+
		            '</tr>'	
				);
			}
			
			let totalFeeTplus = 0;
			for(var i in data){ 
				totalFeeTplus += data[i].vsum;
			}
			
			$('#tbo').append(
	           ' <tr>'+
	               '<td>트레이딩 추가결제비</td>'+
	               '<td></td>'+
	               '<td></td>'+
	               '<td style="color:rgb(30,144,255);">'+'&#8361;'+totalFeeTplus.toLocaleString()+'</td>'+
	            '</tr>'	
			);
		break;

	// 트레이딩 삭감비
	case 'feeTminus' :
		$('#ch').empty();
		$('#cb').empty();	
		$('#ch').html('트레이딩 삭감비 상세');
		$('#cb').append(	                                                                                             
                
				'<table class="table" style="min-width: 300px;">'                                                            +
			            '<thead>'                                                                                            +
			            '<tr>'                                                                                               +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">날짜</th>'        +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">제품명</th>'        +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">갯수</th>'   +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">가격</th>'   +
			            '</tr>'                                                                                              +
			        '</thead>'                                                                                               +
			            '<col width="50%" />'                                                                                +
							'<col width="50%" />'                                                                            +
			        '<tbody id="tbo">'                                                                                       +
			       ' </tbody>'                                                                                               +
			   ' </table>'
			);
			for(var i=0; i<data.length; i++){
				$('#tbo').append(
		           ' <tr>'+
		                '<td >'+data[i].vdate+'</td>'+
		                '<td >'+data[i].vname+'</td>'+
		                '<td>'+data[i].vcnt+'</td>'+
		                '<td>'+data[i].vsum.toLocaleString()+'</td>'+
		            '</tr>'	
				);
			}
			
			let totalFeeTminus = 0;
			for(var i in data){ 
				totalFeeTminus += data[i].vsum;
			}
			
			$('#tbo').append(
	           ' <tr>'+
	               '<td>트레이딩 삭감비</td>'+
	               '<td></td>'+
	               '<td></td>'+
	               '<td style="color:#f72b50;">'+'&#8361;'+totalFeeTminus.toLocaleString()+'</td>'+
	            '</tr>'	
			);
		break;
		
	// 쿠폰지원비
	case 'feeCpn' :
		$('#ch').empty();
		$('#cb').empty();	
		$('#ch').html('쿠폰 지원비 상세');
		$('#cb').append(	                                                                                             
                
				'<table class="table" style="min-width: 300px;">'                                                            +
			            '<thead>'                                                                                            +
			            '<tr>'                                                                                               +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">쿠폰종류</th>'   +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">갯수</th>'   +
			                '<th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">지원금</th>'   +
			            '</tr>'                                                                                              +
			        '</thead>'                                                                                               +
			            '<col width="50%" />'                                                                                +
							'<col width="50%" />'                                                                            +
			        '<tbody id="tbo">'                                                                                       +
			       ' </tbody>'                                                                                               +
			   ' </table>'
			);
			for(var i=0; i<data.length; i++){
				$('#tbo').append(
		           ' <tr>'+
		                '<td >'+data[i].vname+'</td>'+
		                '<td>'+data[i].vcnt+'</td>'+
		                '<td>'+data[i].vsum.toLocaleString()+'</td>'+
		            '</tr>'	
				);
			}
			
			let totalFeeCpn = 0;
			for(var i in data){ 
				totalFeeCpn += data[i].vsum;
			}
			
			$('#tbo').append(
	           ' <tr>'+
	               '<td>총 쿠폰 지원금</td>'+
	               '<td></td>'+
	               '<td style="color:#f72b50;">'+'&#8361;'+totalFeeCpn.toLocaleString()+'</td>'+
	            '</tr>'	
			);
		break;
		
	// 데이터가 아무것도 없는경우
	case 'none' :
		$('#ch').empty();
		$('#cb').empty();	
		$('#ch').html('');
		$('#cb').append('<div>정보가 없습니다.</div>');
		break;
	}
	
}

$('#payBtn').on('click',function(){
    swal("납부완료처리 하시겠습니까? \n 확인버튼을 누르면 되돌릴 수 없습니다.", {
  	  buttons: {
  	    cancel: "닫기",
  	    catch: {
  	      text: "납부하기",
  	      value: "catch",
  	    }, 
  	  },
  	})
  	.then((value) => {
  	  switch (value) {
  	 
  	    case "defeat":
  	      swal("취소되었습니다.");
  	      break;
  	 
  	    case "catch":
  	      feeOk();
  	      break;
  	  }
  	});
})

function feeOk(){

	var nowDate = new Date();
	var now = nowDate.getFullYear()+'-'+(nowDate.getMonth()+1)+'-'+nowDate.getDate();
	
	var selectDate =$('#inputMonth').html();
	let sYear = parseInt(selectDate.substring(0,4));
	let sMonth = parseInt(selectDate.substring(6,8));
	
	let eMonth = 0;
	let eYear = 0;
	if(sMonth+1 == 13){
		eMonth = 1;
		eYear = sYear+1;
	}else{
		eMonth = sMonth+1;
		eYear = sYear;
	}
	
	if((String(eMonth)).length == 1){
		eMonth = "0"+String(eMonth);
	} 
	
	var feeSdate = eYear+'/'+(eMonth)+'/'+'01';
	
	let datas = {
			feepayDate : now,
			feeSdate : feeSdate
	};
	
 	$.ajax({
		  type : 'post',
		  url : '${cPath}/fr/pay/fee/pay',
		  contentType: 'application/json',
		  data : JSON.stringify(datas),
		  dataType : 'text',
		  beforeSend : function(xhr)
		  {
		     xhr.setRequestHeader(header,token);
		  },
		  success : function(data){
			  swal({
				  title: "납부완료",
				  text: "납부완료 처리 되었습니다.",
				  icon: "success",
				  button: "닫기",
				});
			$('#payBtn').attr('value',now+'에'+' 납부된 건입니다.');
			$("#payBtn").attr("disabled", true); 
			$("#closeBtn").click();
		  },
		  error : function(data){
		    alert("납부 실패.");
		  }
	});
	
}



</script>


