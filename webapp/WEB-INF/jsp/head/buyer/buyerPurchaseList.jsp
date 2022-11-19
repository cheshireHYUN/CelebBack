<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 17.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
<link href="${cPath}/resources/css/buyerPurchaseList.css" rel="stylesheet">

<script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}'; 
</script>

<!doctype html>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<div class="content-body">
 	<div class="container-fluid">
	
			<!-- 제목 템플릿 -->
			<div class="row page-titles">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>매입내역관리</strong></h4>
			          <span>거래처에서 매입한 제품의 내역을 관리할 수 있습니다.</span>
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">주문거래관리</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">매입내역관리</a></li>
			      </ol>
			  </div>
			</div>
			<!-- 제목 템플릿 끝 -->
			
			<p>

				<!-- 새로운 검색창(추가 모달과 검색) -->
                <div id="searchUI" class="row">
                	<div style="float: left; width: 45%;">
                		<button type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" class="btn btn-primary">추가</button></h2>
                	</div>
                	<div class="row" style="float: right; width: 55%; padding: 0;">
                		<div style="text-align: right; width: 50%;">
		            		<div class="searchKeword" >
		            			<input type="date" name="searchStartDate" value="startDate" class="form-control" >
		            		</div>	
		            		~
		            		<div class="searchKeword" >
		            			<input type="date" name="searchEndDate" value="endDate" class="form-control" >
		            		</div>
	            		</div>
	            		<div style="width: 50%; padding: 0;">
		            		<div class="input-group search-area">
		            			<input type="text" name="buyerName" class="form-control input-group search-area" placeholder="거래처명을 입력하세요.">
			            		<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
		            		</div>
		            	</div>
                	</div>
                </div>
			
			<!-- 모달을 통한 추가 -->			
			<!-- Button trigger modal -->
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"><strong>매입내역추가</strong></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal">
                            </button>
                        </div>
                        
                        <div class="modal-body">
                      	  <div class="basic-form">
                                    <form><sec:csrfInput/>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label">거래처명</label>
                                            <div class="col-sm-9">
                                                 <div class="input-group mb-3">
													<label class="input-group-text mb-0">Option</label>
													<select class="form-select wide" aria-label="Default select example" onchange="categoryChange(this)" required>
														  <option selected>거래처를 선택하세요.</option>
														  	<c:set var="option" value="${optionList}" />
														  		<c:forEach items="${option}" var="op">
														  			<option value="${op.buyerId}">${op.buyerName}</option>
														  		</c:forEach> 
													</select>
		                                        </div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label">제품명</label>
                                            <div class="col-sm-9">
                                                <div class="input-group mb-3">
													<label class="input-group-text mb-0">Option</label>
													<select id="prod" class="form-select wide" aria-label="Default select example" onchange="categoryChange2(this)" required>
														  <option selected>제품을 선택하세요.</option>
													</select>
		                                        </div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label">입고단가</label>
                                            <div class="col-sm-9">
                                          		<div class="input-group mb-3">	
													<input type="text" class="form-control" style="height:40px; background-color:#F1F1F1; color:#a3a3a3;" placeholder="거래처와 제품을 선택하세요." id="buyerprodPrice" disabled>
												</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label">입고수량</label>
 											<div class="col-sm-9">
                                          		<div class="input-group mb-3">	
													<input type="number" class="form-control" style="height:40px;" placeholder="숫자를 입력하세요." id="headinQty" onchange="qty()" required />
												</div>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label class="col-sm-3 col-form-label">입고날짜</label>
 											<div class="col-sm-9">
                                          		<div class="input-group mb-3">	
													<input type="date" class="form-control" style="height:40px;" id="headinDate" onchange="dates()" required />
												</div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                
                                <div class="modal-footer" style=" padding-right: 0px; padding-left: 0px; ">
                            		<button type="button" class="btn btn-danger light btn-xs" data-bs-dismiss="modal">닫기</button>
                            		<button type="submit" id="saves" class="btn btn-primary btn-xs">저장</button>
                        		</div>
                                
                            </div>
                    </div>
                </div>
            </div>
		
	</div> <!-- 이거 추가하니까 테이블 꽉채워짐 -->
			
		<div class="container-fluid" style="padding-top: 8px;"> <!-- 높이조절용 style -->
			<!-- 표 시작 -->
			
		   <div class="card">
           <div class="card-body">
			
			<div class="row">
			
					<div class="col-12">
						<div class="table-responsive" >
							<div id="divID">
							<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" >
								<thead id="tHead">
									<tr>
										<th>번호</th>
										<th>거래처명</th>
										<th>제품명</th>
										<th>입고단가</th>
										<th>입고수량(개)</th>
										<th>총입고금액</th>
										<th>입고날짜</th>
									</tr>
								</thead>
								<tbody id="listBody">
									<c:set var="buyerPurchaseList" value="${pagingVO.dataList }" />
									<c:choose>
										<c:when test="${not empty buyerPurchaseList }">
											<c:forEach items="${buyerPurchaseList }" var="buyer">
												<tr>
													<td style="text-align:center;">
													${buyer.rnum }</td>
											
													<td>
													${buyer.buyerName }</td>
													
													<td>
													${buyer.buyerprodName }</td>
													
													<td style="text-align:right;">
													₩${buyer.buyerprodPrice }</td>
													
													<td style="text-align:right;">
													${buyer.headinQty }</td>
													
													<td style="text-align:right;">
													₩${buyer.totalPrice }</td>
													
													<td style="text-align:center;">
													${buyer.headinDate }</td>
													
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="8">해당 검색어에 맞는 거래처 매입내역이 없습니다.</td>
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
<form id="searchForm" action="${cPath }/head/buyerPurchase">
	<input type="hidden" name="buyerName" placeholder="거래처명"/>
	<input type="hidden" name="page" placeholder="page">
	<input type="hidden" name="searchStartDate" placeholder="시작검색날짜">
	<input type="hidden" name="searchEndDate" placeholder="끝검색날짜">
</form>
<!-- 서치, 페이징용 스크립트 -->
<script>
	$("[name=buyerName]").val("${pagingVO.detailCondition.buyerName}");
	
	$(".pagingArea").on("click", "a", function(event){
		let page = $(this).data("page");
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	let searchUI = $("#searchUI");
	let searchForm = $("#searchForm");
	
	$("#searchBtn").on("click", function(event){
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input){
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.find("[name="+name+"]").val(value);

		});
		searchForm.submit();
	});
</script>

<!-- 모달 추가 거래처, 제품 선택용. 일단은 하드코딩 -->
<script>
function categoryChange(e) {
	
	const buyerId = e.value; 
	console.log("거래처아이디");
	console.log(buyerId);
	console.log("거래처아이디끝");
	
	let data = {"buyerId":buyerId};
	
    $.ajax({
    	url: "buyerPurchase",
    	data : data,
    	type : "GET",
    	dataType : "json",
    	success : function(resp, status, jqXHR) {

    		console.log("데이터 전송 성공");
    		console.log(resp.optionList2);
    		console.log(resp.optionList2[0].buyerprodId + "입니다");
    		
	   		  var prodMap = new Map();
	   		  
	   		  if (resp.optionList2.length > 0) {
	   			  for(i=0 ; i<resp.optionList2.length ; i++) {
	   				console.log(resp.optionList2[i].buyerprodId + ", " + resp.optionList2[i].buyerprodName);
	   				prodMap.set(resp.optionList2[i].buyerprodId, resp.optionList2[i].buyerprodName);
	   			  }
	   		  }
    		  
    		  console.log("배열임");
    		  console.log(prodMap);
    		  
    		  var target = document.getElementById("prod");
    			
    			if(e.value == buyerId) var d = prodMap;
    			
    			target.options.length = 0; <%-- 0으로 리셋 --%>
    			
    			var opt = document.createElement("option");
    			opt.innerHTML = "제품을 선택하세요.";
    			target.appendChild(opt);
    			<%-- 제일 처음에 제품 id 들어가는 곳 --%>
    			
    		    d.forEach( (value, key, map) => {
    		        var opt = document.createElement("option");
    		        opt.value=`\${key}`;

    		        console.log("테스트");
    		        console.log(opt.value);
    		        opt.innerHTML = `\${value}`;
    		        
    		        target.appendChild(opt);
    		    })
    		  
    	},
    	error : function(){
    		alert("알 수 없는 에러가 발생했습니다.")
    		console.log(buyerId);
    	}
    });
	
} 

var buyerprodId = "";
var headinRelease = "";

function categoryChange2(e) {
	buyerprodId = e.value;
	console.log("매입제품아이디");
	console.log(buyerprodId);
	console.log("매입제품아이디끝");
	
	<%-- 입고 단가 기본적으로 출력되는 부분 --%> 	
	let priceData = {"buyerprodId":buyerprodId};
	
    $.ajax({
    	url: "buyerPurchase",
    	data : priceData,
    	type : "GET",
    	dataType : "json",
    	success : function(resp, status, jqXHR) {
    		console.log("데이터가져오기 성공");
    		console.log(resp);
    		console.log(resp.price);
    		
     		var priceTarget = document.getElementById("buyerprodPrice");
    		priceTarget.value = "₩ " + resp.price; 
    			
    		headinRelease =
    			Math.floor(Number(document.getElementById('buyerprodPrice').value.substring(2)) * 1.2);
    		console.log("출고단가 : "+headinRelease);
    		
    	},
    	error : function(){
    		alert("가격가져오기 오류임");
    		console.log(resp);
    	}
    });
	
}

var headinQty = "";
function qty(){
	headinQty =
		document.getElementById('headinQty').value;
	console.log("입고수량 : "+headinQty);
}

var headinDate = ""
function dates(){
	headinDate =
		document.getElementById('headinDate').value;
	console.log("입고날짜 : "+headinDate);
}

console.log("-----최종값출력시작-----");
console.log(buyerprodId);
console.log(headinDate);
console.log(headinQty);
console.log(headinRelease);
console.log("-----값출력끝-----");

const saveButton = document.getElementById('saves');
saveButton.onclick = function(event) {
	
	if (buyerprodId==null || headinDate==null || headinQty== null || headinRelease==null || 
			buyerprodId=="" || headinDate=="" || headinQty=="" || headinRelease=="") {
		alert("모든 항목을 입력해주세요.");
	} else if(headinQty==0 || headinQty == "0") {
		alert("1개 이상의 수량을 입력해주세요.")
	} else {
		
	var allData = {"buyerprodId":buyerprodId,
				   "headinQty":headinQty, "headinDate":headinDate, "headinRelease":headinRelease}
	
	console.log("모든ㄷ ㅔ이터 출력");
	console.log(allData);
	
     $.ajax({
    	url: "buyerPurchase",
    	data : allData,
    	type : "POST",
    	
    	beforeSend : function(xhr)
    	{
    	   xhr.setRequestHeader(header,token);
    	},
    	
    	success : function(resp) {
    		sweetAlert("매입내역이 추가되었습니다.", "매입내역이 정상적으로 추가되었습니다.", "success");
    		$('#exampleModalCenter').modal('hide');
    		console.log("데이터 전송 성공");
    		console.log(resp);
    	},
    	error : function(){
    		swal({
    			  title: "매입내역 추가에 실패하였습니다.",
    			  text: "하루에 같은 제품의 매입내역을 추가할수 없습니다.",
    			  icon: "error",
    			  button: "확인",
    			});
    		console.log(data);
    	}
    }); 
     
	}
	
};

</script>
<!-- 자바스크립트 내에서 달러표시 쓰려면 앞에 역슬래쉬를 꼭 써줘야 작동한다. -->


<!-- sweet alert -->
<script>
function sweetAlert(title, text, icon) {
	swal({
		title: title,
		text: text,
		icon: icon,
		buttons: '확인'
	}).then((value) => {
		if(value) {
			location.replace(location.href);
		}
	});
}
</script>