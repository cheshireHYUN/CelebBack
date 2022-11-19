<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      이혜원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
	<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
	
<style>
#example2_wrapper .dataTables_scrollBody {
    max-height: 32rem !important;
}
tr:hover {
	color: blue;
}
.swal-button {
	background-color: #2f4cdd;
}
table.dataTable thead th, table.dataTable thead td{
	padding: 15px 3px;
}
.dataTables_scrollHead, .dataTables_scrollHeadInner {
	width: 1482px;
}
</style>

<!--**********************************
    Content body start
***********************************-->
<div class="content-body">
	<div class="container-fluid">
	
                <!-- row -->
		 		<div class="row page-titles">
				  <div class="col-sm-6 p-md-0">
				      <div class="welcome-text">
				          <h4><strong>발주하기</strong></h4>
				          <span>주문하고자 하는 제품을 발주합니다.</span>
				      </div>
				  </div>
				  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				      <ol class="breadcrumb">
				          <li class="breadcrumb-item"><a href="javascript:void(0)">발주관리</a></li>
				          <li class="breadcrumb-item active"><a href="javascript:void(0)">발주하기</a></li>
				      </ol>
				  </div>
				</div>
					
				<div class="form-head dashboard-head d-md-flex align-items-start" style="margin-top:25px;">
                    <div style="float:left;">
                    	<div class="input-group input-group-lg" style="float:left; width:52%; margin-top:-10px;">
							<span class="btn btn-success light p-3 align-items-center mb-1" style="height: 56px">총 주문금액</span>
               				<input type="text" class="form-control" id="allPrice" value="₩ 0">
                         </div> 
	              		 <div style="margin-top: -10px; margin-right: 100px; float:right;">
	               			<button id="orderBtn" type="button" class="btn btn-primary btn-sl-sm me-2">
			               		 	<i class="fa fa-shopping-cart"></i>
	               				발주하기
<!-- 			               		 <span class="btn-icon-end"> -->
<!-- 			               		 </span> -->
		               		 </button>
	               		 </div>
               		</div>
					<div id="searchUI" class="input-group search-area" style="margin-left: 37%; margin-top: -10px;">
           				<input type="text" name="searchWord" class="form-control" placeholder="제품명을 입력하세요.">
              			<button id="searchBtn" type="button" class="btn btn-primary light" >검색</button>
					</div>
          		</div>
					
	<div class="container-fluid" style="padding-top: 10px;">	
		<div class="row" style="width: 108%; margin-left: -4%;">
			<div class="col-12">
				<div class="card">
                 	<div class="card-body">
	               		<div style="margin-left:58.5%; width: 110px; margin-top:-30px;">
							<strong style="font-size: 15px; height:30px;" class="external-event btn-danger light" data-class="bg-danger">
								<i class="fa fa-exclamation-circle" style="margin-right:10px;"></i>재고부족
							</strong>
						</div>
                         <div class="table-responsive" style="margin-top: -30px;">
                             <table id="example2" class="display" style="width:1490px;">
                                 <thead>
                                     <tr>
                                         <th style="width: 5%;">선택</th>
                                         <th style="width: 6%;">제품코드</th>
                                         <th style="width: 15%;">제품명</th>
                                         <th style="width: 7%;">구매가</th>
                                         <th style="width: 7%;">주문가능수량</th>
                                         <th style="width: 7%;">적정재고량</th>
                                         <th style="width: 7%;">현 재고수량</th>
                                         <th style="width: 7%;">주문권장수량</th>
                                         <th style="width: 10%;">주문수량</th>
                                         <th style="width: 10%;">주문예상금액</th>
                                     </tr>
                                 </thead>
                                 <tbody id="listBody" class="cb-tAlign-center" />
                             </table>
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
        
<form id="searchForm" method="get" action="${cPath }/fr/frOrder/prodOrder">
	<input type="hidden" name="searchWord"/>
</form>	

<!-- Datatable -->
<script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${cPath }/resources/dashboard3/js/plugins-init/datatables.init.js"></script>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- script -->
<script type ="text/javascript" src="${cPath }/resources/js/fr/frOrder/prodOrderList.js"></script>
<!-- 시큐리티 토큰 -->
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>
