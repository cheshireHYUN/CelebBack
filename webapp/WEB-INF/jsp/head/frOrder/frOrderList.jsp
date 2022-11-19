<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 20.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}'; 
</script>

<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
<link href="${cPath}/resources/css/frOrderList.css" rel="stylesheet">

<!doctype html>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
var color = document.getElementById('nameColor');
</script>

<div class="content-body">
 	<div class="container-fluid">
	
			<!-- 제목 템플릿 -->
			<div class="row page-titles">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>가맹점주문</strong></h4>
			          <span>각 가맹점에서 주문한 제품의 내역을 조회, 상세조회, 검색할 수 있습니다.</span>
			          
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">주문거래관리</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">가맹점주문</a></li>
			      </ol>
			  </div>
			</div>
			<!-- 제목 템플릿 끝 -->
			<p>

<!-- 새로운 검색창(검색) -->
			<div class="form-head dashboard-head d-md-flex align-items-start">
				<!-- 주문건만 모아볼 수 있는 버튼임 -->
				<button id="newOrder" type="button" class="btn btn-primary light px-3" onclick="statusView()"></button>
				<button id="shipButton" type="button" class="btn light btn-success px-3" 
				style="margin-left: 10px; border-color: #cff0d9;" onclick="shipBatch()">
					<i class="fa fa-paper-plane font-18 align-middle me-2"></i>일괄배송처리
				</button>
				<h2 class="dashboard-title me-auto"><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" class="btn btn-primary d-inline-block" style="visibility : hidden">ㅇㅅㅇ</button></h2>
				<div id="searchUI" class="input-group search-area">
					<input type="text" name="franName" class="form-control" placeholder="가맹점명을 입력하세요.">
					<!-- <span class="input-group-text"><a href=""><i class="flaticon-381-search-2"></i></a></span> -->
					<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
				</div>
			</div>
			
	</div> <!-- 추가시 테이블 채움 -->
			
		<div class="container-fluid" style="padding-top: 8px;"> <!-- 높이조절용 style -->
			<!-- 표 시작 -->
			
		   <div class="card">
             <div class="card-body">
			
			     <div class="row">
			
					<div class="col-12">
						<div class="table-responsive" >
							<div id="divID">
							<table id="example5" class="mainTable display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" >
<!-- 							<table id="example5" class="display mb-4 dataTablesCard dataTable" style="min-width: 845px;"> -->
								<thead id="tHead">
									<tr>
										<th>주문번호</th>
										<th>가맹점명</th>
										<th>가맹점주소</th>
										<th>주문일시</th>
										<th>총주문금액</th>
										<th>주문상태</th>
										<th>주문상세</th>
									</tr>
								</thead>
								<tbody id="listBody">
									<c:set var="frOrderList" value="${pagingVO.dataList }" />
									<c:choose>
										<c:when test="${not empty frOrderList }">
											<c:forEach items="${frOrderList }" var="frOrder" varStatus="detail">
											
<!-- DB로 리팩토링하면서 필요 없어진 코드.
<script>
// 배송준비중인것만 카운트
var frOrderNo = '${frOrder.frOrderNo }';
var lguName = '${frOrder.lguName }';
if (lguName == "배송준비중") {
	count++;
}
</script> -->
												<tr class="item tr">
													
													<td style="text-align:center;">
													${frOrder.frOrderNo }</td>
											
													<td style="text-align:center;">
													${frOrder.franName }</td>
													
													<td>
													${frOrder.franAdd1 } ${frOrder.franAdd2 }</td>
													
													<td style="text-align:center;">
													${frOrder.frOrderDate }</td>
													
													<td style="text-align:right;">
													₩${frOrder.frOrderPrice }</td>
													
													<td class="nameColor" style="text-align:center;">
													${frOrder.lguName }</td>

													<td style="text-align:center;">
													<button type="button" id="detailButton" class="detailButtonClass btn light btn-primary btn-xs"
													
													onclick="detailView('${frOrder.frOrderNo}',${detail.index});"
													>상세조회</button></td>

												</tr>
												 <tr class="hide">
												 	<td colspan="2">
												 	</td>
												 
									                <td id="detailContents" colspan="2" style="padding: 20px 20px 10px 20px !important;"><!-- 드롭다운 데이터 들어가는 곳 -->
 														<div class='media ai-icon d-flex'>
															<span class='me-3 text-primary'>
																<svg width='25' height='25' viewBox='0 0 32 31' fill='none' xmlns='http://www.w3.org/2000/svg'>
																<path d='M4 30.5H22.75C23.7442 30.4989 24.6974 30.1035 25.4004 29.4004C26.1035 28.6974 26.4989 27.7442 26.5 26.75V16.75C26.5 16.4185 26.3683 16.1005 26.1339 15.8661C25.8995 15.6317 25.5815 15.5 25.25 15.5C24.9185 15.5 24.6005 15.6317 24.3661 15.8661C24.1317 16.1005 24 16.4185 24 16.75V26.75C23.9997 27.0814 23.8679 27.3992 23.6336 27.6336C23.3992 27.8679 23.0814 27.9997 22.75 28H4C3.66857 27.9997 3.3508 27.8679 3.11645 27.6336C2.88209 27.3992 2.7503 27.0814 2.75 26.75V9.25C2.7503 8.91857 2.88209 8.6008 3.11645 8.36645C3.3508 8.13209 3.66857 8.0003 4 8H15.25C15.5815 8 15.8995 7.8683 16.1339 7.63388C16.3683 7.39946 16.5 7.08152 16.5 6.75C16.5 6.41848 16.3683 6.10054 16.1339 5.86612C15.8995 5.6317 15.5815 5.5 15.25 5.5H4C3.00577 5.50109 2.05258 5.89653 1.34956 6.59956C0.646531 7.30258 0.251092 8.25577 0.25 9.25V26.75C0.251092 27.7442 0.646531 28.6974 1.34956 29.4004C2.05258 30.1035 3.00577 30.4989 4 30.5Z' fill='#2F4CDD'/><path d='M25.25 0.5C24.0139 0.5 22.8055 0.866556 21.7777 1.55331C20.7499 2.24007 19.9488 3.21619 19.4758 4.35823C19.0027 5.50027 18.8789 6.75693 19.1201 7.96931C19.3613 9.1817 19.9565 10.2953 20.8306 11.1694C21.7047 12.0435 22.8183 12.6388 24.0307 12.8799C25.2431 13.1211 26.4997 12.9973 27.6418 12.5242C28.7838 12.0512 29.7599 11.2501 30.4467 10.2223C31.1334 9.19451 31.5 7.98613 31.5 6.75C31.498 5.093 30.8389 3.50442 29.6673 2.33274C28.4956 1.16106 26.907 0.501952 25.25 0.5ZM25.25 10.5C24.5083 10.5 23.7833 10.2801 23.1666 9.86801C22.5499 9.45596 22.0693 8.87029 21.7855 8.18506C21.5016 7.49984 21.4274 6.74584 21.5721 6.01841C21.7167 5.29098 22.0739 4.6228 22.5983 4.09835C23.1228 3.5739 23.791 3.21675 24.5184 3.07206C25.2458 2.92736 25.9998 3.00162 26.6851 3.28545C27.3703 3.56928 27.9559 4.04993 28.368 4.66661C28.7801 5.2833 29 6.00832 29 6.75C28.9989 7.74423 28.6035 8.69742 27.9004 9.40044C27.1974 10.1035 26.2442 10.4989 25.25 10.5Z' fill='#2F4CDD'/><path d='M6.5 13H12.75C13.0815 13 13.3995 12.8683 13.6339 12.6339C13.8683 12.3995 14 12.0815 14 11.75C14 11.4185 13.8683 11.1005 13.6339 10.8661C13.3995 10.6317 13.0815 10.5 12.75 10.5H6.5C6.16848 10.5 5.85054 10.6317 5.61612 10.8661C5.3817 11.1005 5.25 11.4185 5.25 11.75C5.25 12.0815 5.3817 12.3995 5.61612 12.6339C5.85054 12.8683 6.16848 13 6.5 13Z' fill='#2F4CDD'/><path d='M5.25 16.75C5.25 17.0815 5.3817 17.3995 5.61612 17.6339C5.85054 17.8683 6.16848 18 6.5 18H17.75C18.0815 18 18.3995 17.8683 18.6339 17.6339C18.8683 17.3995 19 17.0815 19 16.75C19 16.4185 18.8683 16.1005 18.6339 15.8661C18.3995 15.6317 18.0815 15.5 17.75 15.5H6.5C6.16848 15.5 5.85054 15.6317 5.61612 15.8661C5.3817 16.1005 5.25 16.4185 5.25 16.75Z' fill='#2F4CDD'/>
																</svg>
															</span>
															<div class='media-body'>
																<h3>${frOrder.frOrderNo}
																</h3>
															</div>
														</div> 
														
															<table style="width: 100%; height: 100%;">
																<thead id='tHead'>
																	<tr style="background-color:#ececec !important;">
																		<th>제품명</th>
																		<th>주문개수</th>
																		<th>제품단가</th>
																		<th>제품별주문금액</th>
																	</tr>
																</thead>
																<tbody id='listInnerBody'>
																<!-- 동적으로 추가될 부분 -->
																</tbody>
															</table>
														<br>
									                </td>
									                <td colspan="3">
												 	</td>
									             </tr>  
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="7">해당 검색어에 맞는 가맹점 이름이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
<!-- 								<tfoot>
									<tr>
										<td colspan="7">
										</td>
									</tr>
								</tfoot> -->
							</table>
							<!-- 테이블 끝 -->
							</div>
							<!-- 테이블 div 끝 -->
						</div>
                    </div>
			</div> <!-- row end -->
										<div class="pagination_fg">
											<div class="pagingArea">
												${pagingVO.pagingHTMLBS }
											</div>
										</div>
			
			  </div> <!-- card end -->
			</div> <!-- card end -->
			
		</div> <!-- another container-fluid end -->
	</div> <!-- content-body cb-ml0 end -->
	

<!-- 새 주문건 숫자로 표시해주기 -->
<script>
console.log("배송준비의건");

var newOrderId = document.getElementById('newOrder');
const iclass =  "<i class='fa fa-exclamation-circle'></i>";
const strongS = "<strong>"
const strongE = "</strong>"

var count = '${ST09Count}';

if (count == 0) {
newOrderId.innerHTML = iclass + " 새로운 주문건이 없습니다.";
newOrderId.setAttribute('disabled', 'disabled');
newOrderId.setAttribute('class', 'btn btn-dark light px-3');
} else {
newOrderId.innerHTML = iclass + " 새로운 주문건이 " + strongS + count + strongE + "건 있습니다.";	
}
</script>

<!-- 서치, 페이징용 hidden form 시작 -->
<form id="searchForm" action="${cPath }/head/frOrder">
	<input type="hidden" name="franName" placeholder="가맹점명"/>
	<input type="hidden" name="page" placeholder="page">
	<input type="hidden" name="frOrderState" placeholder="배송준비중">
</form>

<!-- 서치, 페이징용 스크립트 -->
<script>
	$("[name=franName]").val("${pagingVO.detailCondition.franName}");
	$("[name=frOrderState]").val("${pagingVO.detailCondition.frOrderState}");
	
	$(".pagingArea").on("click", "a", function(event){
		let page = $(this).data("page");
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	let searchUI = $("#searchUI");
	let searchForm = $("#searchForm");
	
	$("#searchBtn").on("click", function(event){
		
		$("[name=frOrderState]").val(""); // 값 리셋. 온전히 가맹점 검색만
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input){
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.find("[name="+name+"]").val(value);

		});
		searchForm.submit();
	});	
</script>

<!-- 새로 들어온 주문건(배송준비중)만 모아보는 스크립트 -->
<script>
function statusView() {
	$("[name=franName]").val(""); // 값 리셋. 온전히 주문건 검색만
	$("[name=frOrderState]").val("ST09");
	let inputs = searchUI.find(":input[name]");
	$(inputs).each(function(idx, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);

	});
	searchForm.submit();
}
</script>


<!-- 일괄배송 스크립트 -->
<!-- 에러뜨는거 나중에 수정 -->
<script>
document.getElementsByClassName('swal-button--cancel').innerHTML = '취소';

  function shipBatch() {
    swal({
    	  title: "일괄배송처리 하시겠습니까?",
    	  text: "배송처리를 한 뒤에는 취소할 수 없습니다.",
    	  icon: "warning",
    	  buttons: {
    		  cancel: "취소",
    		  confirm: "배송"
    	  }
    	})
    	.then((goShipping) => {
    	  if (goShipping) {
				   $.ajax({
				    	url: "/CelebBack/head/frOrder",
				    	type : "POST",
				    	beforeSend : function(xhr)
				    	{
				    	   xhr.setRequestHeader(header,token);
				    	},
				    	success : function(resp, status) {
	    		    	    sweetAlert("일괄배송처리가 완료되었습니다.", "", "success");
				    	},
				    	error : function(request,status,error){
				    		swal("일괄배송처리에 실패하였습니다.");
				    	}
				    });
		   }else{
			   console.log("취소");
		   }
  	}); //함수끝
  }
</script>

<!-- 글자컬러 변경 -->
<script>
document.getElementsByClassName('nameColor');

var tableN = document.getElementById('example5'); // 테이블아이디 가져오기
var conN = tableN.getElementsByTagName("tr"); // 태그네임 <tr>들
var lengN = conN.length; // <tr>들의 갯수

for(var t=0; t<lengN; t++) {
	var contents = document.getElementsByClassName('nameColor')[t];
	var changeClr =	document.getElementsByClassName('nameColor')[t].innerHTML.trim();

	if (changeClr.includes('배송완료')) {
		contents.style.color="purple";
	} else if (changeClr.includes('배송준비중')) {
		contents.style.color="red";
	} else if (changeClr.includes('배송중')) {
		contents.style.color="green";
	} else if (changeClr.includes('확정')) {
		contents.style.color="blue";
	} else if (changeClr.includes('주문취소')) {
		contents.style.color="orange";
	}
}
</script>

<!-- 상세조회 누르면 작동하는 기능들 -->
<script>
var article = (".mainTable .show");  
function detailView(frOrderNo, p_index) {
		
			let dv = event.currentTarget;
			
	        var myArticle =$(dv).parents().next("tr"); 
	        if($(myArticle).hasClass('hide')) {  
	            $(article).removeClass('show').addClass('hide');  
	            $(myArticle).removeClass('hide').addClass('show');  
	        }  
	        else {  
	            $(myArticle).addClass('hide').removeClass('show');  
	        }  
	
	console.log(frOrderNo + "가 찍힘.");
	let data = {"frOrderNo":frOrderNo};
	
    $.ajax({
    	url: "frOrder",
    	data : data,
    	type : "GET",
    	dataType : "json",
    	success : function(resp, status, jqXHR) {
    
    		let putContents = document.querySelectorAll('#detailContents')[p_index];
    		var listInnerBody = document.querySelectorAll('#listInnerBody')[p_index];
    		listInnerBody.innerHTML = "";
    		
    		if (resp.length > 0) { // 데이터가 존재한다면
    			for (i=0 ; i<resp.length ; i++) {
    				
	    		console.log(resp[i].dtOrderName);
	    		console.log(resp[i].dtOrderQty);
	    		console.log(resp[i].dtOrderPrice);
	    		console.log(resp[i].qtyPrice);
	    		
	    		var newTr = document.createElement('tr');
	    		newTr.setAttribute('style','background-color:#fafafa !important;');
	    		
	    		var won = "₩ ";
	    		
	    		newTr.innerHTML = "<td style='border-bottom:0px !important;'>" + resp[i].dtOrderName + "</td>";
	    		newTr.innerHTML = newTr.innerHTML + "<td style='text-align: center; border-bottom:0px !important;'>" + resp[i].dtOrderQty + "</td>";
	    		newTr.innerHTML = newTr.innerHTML + "<td style='text-align: right; border-bottom:0px !important;'>" + won + 
	    						  resp[i].dtOrderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',') + "</td>";
	    		newTr.innerHTML = newTr.innerHTML + "<td style='text-align: right; border-bottom:0px !important;'>" + won + 
	    						  resp[i].qtyPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',') + "</td>";
	    		listInnerBody.appendChild(newTr);
	    		
    			}
    		} else {
    			
    			var newTr = document.createElement('tr');
    			newTr.innerHTML = "<td colspan='4' style='background-color:#fafafa !important; color:red; border-bottom:0px !important;'><center>데이터가 없습니다.</center></td>";
    			listInnerBody.appendChild(newTr);
    			console.log("데이터 없음");
    		}
    		
    		
    	},
    	error : function(){
    		alert("알 수 없는 에러가 발생했습니다.")
    		console.log(data);
    	}
    });

}
</script>

<!-- sweetAlert창 바로 사라지는 문제 해결하는 스크립트 -->
<script>
function sweetAlert(title, text, icon) {
	swal({
		title: title,
		text: text,
		icon: icon,
		buttons: '확인'
	}).then((value) => {
		if(value) {
			window.location.href = 'frOrder';
		}
	});
}
</script>