<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자                수정내용
* ----------  ---------  -----------------
* 2022. 8. 6.     서재원      최초작성
* 2022. 8. 24.    서재원      조회작업시작
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
<style>
.pagingArea {
	justify-content: center;
	margin-bottom: 0px;
}
.pagination {
	margin-top: 0px !important;
}
</style>

<!doctype html>

<div class="content-body">
 	<div class="container-fluid">
	
			<!-- 제목 템플릿 -->
			<div class="row page-titles">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>제품재고내역</strong></h4>
			          <span>본사에서 판매중인 제품 및 재고정보를 조회, 상세조회할 수 있습니다.</span>
			          
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">제품물류관리</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">제품재고내역</a></li>
			      </ol>
			  </div>
			</div>
			<!-- 제목 템플릿 끝 -->
			
			<p>

<!-- 새로운 검색창(검색) -->
 			<div class="form-head dashboard-head d-md-flex align-items-start">
			
			
				<button id="newOrder" type="button" class="btn light btn-danger px-3" onclick="statusView()"
				style="border-color: #ffc6d1;"
				><i class='fa fa-exclamation-circle'></i> 부족재고(100개 이하) 조회</button> 
			
				<h2 class="dashboard-title me-auto"><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" class="btn btn-primary d-inline-block" style="visibility : hidden">ㅇㅅㅇ</button></h2>
				<div id="searchUI" class="input-group search-area">
					<input type="text" name="buyerprodName" class="form-control" placeholder="제품명을 입력하세요.">
					<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
				</div>
			</div> 
			
	</div> <!-- 이거 추가하니까 테이블 꽉채워짐 -->
		
<!-- 		<div>
		<p>
		</p>
			<div class="container-fluid">
			</div>
		</div>
			 -->
			
		<div class="container-fluid" style="padding-top: 8px;"> <!-- 높이조절용 style -->
			<!-- 표 시작 -->
			
		   <div class="card">
           <div class="card-body">
			
			
			<div class="row">
			
					<div class="col-12">
						<div class="table-responsive" >
							<div id="divID">
							<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" >
<!-- 							<table id="example5" class="display mb-4 dataTablesCard dataTable" style="min-width: 845px;"> -->
								<thead id="tHead">
									<tr>
										<th>번호</th>
										<th>제품명</th>
										<th>거래처</th>
										<th>출고단가</th>
										<th>현재고(개)</th>
										<th>출고상세</th>
									</tr>
								</thead>
								<tbody id="listBody">
									<c:set var="prodStockList" value="${pagingVO.dataList }" />
									<c:choose>
										<c:when test="${not empty prodStockList }">
											<c:forEach items="${prodStockList }" var="prodStock" varStatus="detail">
											
<script>
// ajax로 보낼 용도로 담아두는 변수임
var buyerprodId = '${prodStock.buyerprodId}';
</script>
									
												<tr class="tr">
													
													<td style="text-align:center;">
													${prodStock.rnum }</td>
											
													<td>
													${prodStock.buyerprodName }</td>
													
													<td>
													${prodStock.buyerName }</td>
													
													<td style="text-align:right;">
													₩${prodStock.headinRelease}</td>
													
													<td class="qty" style="text-align:right;">
													${prodStock.hstockQty }</td>

													<td style="text-align:center;">
													<button type="button" id="detailButton" class="btn light btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#a${prodStock.buyerprodId}"
													onclick="detailView('${prodStock.buyerprodId}',${detail.index});"
													>상세조회</button>
													
													<!-- 모달을 통한 추가 -->			
													<!-- Button trigger modal -->
										            <!-- <button type="button" class="btn btn-primary mb-2" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">Modal centered</button> -->
										            <!-- Modal -->
										            <div class="modal fade" id="a${prodStock.buyerprodId}">
										                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
										                    <div class="modal-content">
										                        <div class="modal-header">
										                            <h5 class="modal-title"><strong>${prodStock.buyerprodName } 출고상세</strong></h5>
										                            <button type="button" class="btn-close" data-bs-dismiss="modal">
										                            </button>
										                        </div>
										                        
										                        <div class="modal-body">
										                      	  <div class="basic-form">
																			
																<!-- 여기부터 모달창 내의 표 내용임! -->			
																<div class="col-12">
																<div class="table-responsive" >
																	<div id="divID">
																	<table id="detailModal" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" >
										<!-- 							<table id="example5" class="display mb-4 dataTablesCard dataTable" style="min-width: 845px;"> -->
																		<thead id="tHead">
																			<tr>
																				<th>번호</th>
																				<th>가맹점명</th>
																				<th>출고수량(개)</th>
																				<th>출고날짜</th>
																			</tr>
																		</thead>
																		<tbody id="listModalBody">
																	
																		</tbody>

																	</table>
																	<!-- 테이블 끝 -->
																	</div>
																	<!-- 테이블 div 끝 -->
																</div>
										                    </div>

										                                </div>
										                                
										                                <div class="modal-footer" style=" padding-right: 0px; padding-left: 0px; ">
										                            		<button type="button" class="btn btn-danger light btn-xs" data-bs-dismiss="modal">닫기</button>
										                        		</div>
										                                
										                            </div>
										                    </div>
										                </div>
										            </div>
										            <!-- 모달 끝 -->
													
													</td>

												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6" style="text-align:center;">해당 조건에 맞는 제품이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
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
	
<!-- 서치, 페이징용 hidden form 시작 -->
<form id="searchForm" action="${cPath }/head/prodStock">
	<input type="hidden" name="buyerprodName" placeholder="가맹점명"/>
	<input type="hidden" name="page" placeholder="page">
	<input type="hidden" name="hstockQty" placeholder="부족재고">
</form>

<!-- 서치, 페이징용 스크립트 -->
<script>
	$("[name=buyerprodName]").val("${pagingVO.detailCondition.buyerprodName}");
	$("[name=hstockQty]").val("${pagingVO.detailCondition.hstockQty}");
	
	$(".pagingArea").on("click", "a", function(event){
		let page = $(this).data("page");
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	let searchUI = $("#searchUI");
	let searchForm = $("#searchForm");
	
	$("#searchBtn").on("click", function(event){
		
		$("[name=hstockQty]").val(""); // 값 리셋. 온전히 상품 검색만
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input){
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.find("[name="+name+"]").val(value);

		});
		searchForm.submit();
	});	
</script>

<!-- 100개 이하 부족재고만 조회하는 버튼에 이벤트 -->
<script>
function statusView() {
	$("[name=buyerprodName]").val(""); // 값 리셋. 온전히 부족재고 검색만
	$("[name=hstockQty]").val("100");
	let inputs = searchUI.find(":input[name]");
	$(inputs).each(function(idx, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);

	});
	searchForm.submit();
}
</script>

<script>
var trTagStart ="<tr class='tr'>"
var trTagEnd ="</tr>"
var tdTagStart ="<td>"
var tdTagEnd ="</td>"

//클릭할때마다 태그가 tbody안에 생성되도록 한다.

function detailView(buyerprodId,p_index) {

	// 순번 제어하고, id도 요즘은 같은 거 씀, 권장되진 않음
	// appendChild 는 작은거부터 큰거 순으로  , append
	// 문자열하고, createElement를 적당히 섞어쓰면 가독성도 좋고 성능도 좋음 
	console.log(buyerprodId + "가 찍힘.");
	
	let data = {"buyerprodId":buyerprodId};
	
    $.ajax({
    	url: "prodStock",
    	data : data,
    	type : "GET",
    	dataType : "json",
    	success : function(resp, status, jqXHR) {
			var listBody = document.querySelectorAll('#listModalBody')[p_index];
    		
    		var newTd = document.createElement('td');
    		var newTd2 = document.createElement('td');
    		var newTd3 = document.createElement('td');
    		var newTd4 = document.createElement('td'); // rnum용

			listBody.innerHTML= ""; // 데이터 초기화
    	
    		if (resp.length > 0) { // 데이터가 존재한다면
    			for (i=0 ; i<resp.length ; i++) {
					console.log("데이터길이: " +resp.length);
					var newTr = document.createElement('tr');
					newTr.innerHTML = "<td>" + resp[i].rnum + "</td>";
					newTr.innerHTML = newTr.innerHTML + "<td>" + resp[i].franName + "</td>";
					newTr.innerHTML = newTr.innerHTML + "<td>" + resp[i].headoutQty + "</td>";
					newTr.innerHTML = newTr.innerHTML + "<td>" + resp[i].headoutDate + "</td>";
		    		listBody.appendChild(newTr);
    			}
    		} else {
    			var newTr = document.createElement('tr');
    			newTr.innerHTML = "<td colspan='4' style='color:red;'><center>출고 데이터가 없습니다.</center></td>";
	    		listBody.appendChild(newTr);
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


<!-- 글자컬러 변경 -->
<script>
document.getElementsByClassName('qty');

var tableN = document.getElementById('example5'); // 테이블아이디 가져오기
var conN = tableN.getElementsByTagName("tr"); // 태그네임 <tr>들
var lengN = conN.length; // <tr>들의 갯수

for(var t=0; t<lengN; t++) {
	var contents = document.getElementsByClassName('qty')[t];
	var changeClr =	document.getElementsByClassName('qty')[t].innerHTML;

	if (changeClr <= 100) {
		contents.style.color="red";
	} 
}
</script>