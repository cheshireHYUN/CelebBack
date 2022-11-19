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
					          <h4><strong>재고현황</strong></h4>
					          <span>제품별 재고현황을 조회하고, 수정모드를 눌러 수정합니다.</span>
						  </div>
					  </div>
					  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
					      <ol class="breadcrumb">
					          <li class="breadcrumb-item"><a href="javascript:void(0)">재고관리</a></li>
					          <li class="breadcrumb-item active"><a href="javascript:void(0)">재고현황</a></li>
					      </ol>
					  </div>
			 	 </div>
			 	 
				<div class="form-head dashboard-head d-md-flex align-items-start">
					<div style="float:left">
		            	<button type="button" id="updateButton" class="btn btn-danger light" >
							<i class="fas fa-pencil-alt"></i>
							수정모드
		            	</button>
						<input type="button" id="saveButton" class="btn btn-primary" disabled="disabled" value="저장" />
					</div>
					<div id="searchUI" class="input-group search-area" style="margin-left: 59%; float:right;">
           				<input type="text" name="searchWord" class="form-control" placeholder="제품명을 입력하세요.">
               			<button id="searchBtn" type="button" class="btn light btn-primary" >검색</button>
					</div>
				</div>
				
		<div class="container-fluid" style="padding-top: 15px;">
				  
			  <div class="row" style="width: 108%; margin-left: -4%;">
				<div class="col-12">
					<div class="card">
	                     <div class="card-body">
	                     	<div style="margin-left:47%; width: 110px; margin-top:-30px;">
								<strong style="font-size: 15px; height:30px;" class="external-event btn-danger light" data-class="bg-danger">
									<i class="fa fa-exclamation-circle" style="margin-right:10px;"></i> 재고부족
								</strong>
							</div>
	                      	<div class="table-responsive" style="margin-top: -30px;">
	                              <table id="example2" class="display" >
	                                  <thead>
	                                      <tr>
	                                          <th style="width:100px;">제품코드</th>
	                                          <th style="width:100px;">제품명</th>
	                                          <th style="width:100px;">구매가</th>
	                                          <th style="width:100px;">적정재고량</th>
	                                          <th style="width:110px;">현 재고수량</th>
	                                          <th style="width:100px;">이번달 입고량</th>
	                                          <th style="width:100px;">총 입고량</th>
	                                          <th style="width:100px;">이번달 출고량</th>
	                                          <th style="width:100px;">총 출고량</th>
	                                      </tr>
	                                  </thead>
	                                  <tbody id="listBody" class="cb-tAlign-center"/>
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
        
<form id="searchForm" method="get" action="${cPath }/fr/frStock" >
	<input type="hidden"  name="searchWord"/>
</form>	
        
<!-- Datatable -->
<script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${cPath }/resources/dashboard3/js/plugins-init/datatables.init.js"></script>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- script -->
<script type ="text/javascript" src="${cPath }/resources/js/fr/frStock/frStockList.js"></script>
<!-- 시큐리티 토큰 -->
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>
