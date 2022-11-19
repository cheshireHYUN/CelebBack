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
			          <h4><strong>적정재고관리</strong></h4>
			          <span>적정재고를 사전에 등록하여 관리하고, 수정모드를 눌러 수정합니다.</span>
			      	  </div>
				  </div>
				  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				      <ol class="breadcrumb">
				          <li class="breadcrumb-item"><a href="javascript:void(0)">재고관리</a></li>
				          <li class="breadcrumb-item active"><a href="javascript:void(0)">적정재고관리</a></li>
				      </ol>
				  </div>
			</div>
            
            <div class="form-head dashboard-head d-md-flex align-items-start">
            	<h2 class="dashboard-title me-auto">
            	<button type="button" id="updateButton" class="btn btn-danger light " >
            		<i class="fas fa-pencil-alt"></i>
					수정모드
            	</button>
               	<input type="button" id="saveButton" class="btn btn-primary" disabled="disabled" value="저장" />
            	</h2>
            </div>
            
       <div class="container-fluid" style="padding-top: 5px;">  
          
         <div class="row" style="width: 108%; margin-left: -4%;">
			<div class="col-12">
				<div class="card">
                    <div class="card-body">
                    	<div class="table-responsive" style="margin-top: -20px;">
                            <table id="example2" class="display" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>제품코드</th>
                                        <th>제품명</th>
                                        <th>구매가</th>
                                        <th>적정재고량</th>
                                        <th>주문예상금액</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="atOrder" items="${atOrderList}">
                                	<tr>
                                		<td class="cb-tAlign-center">${atOrder.buyerProdId}</td>
                                		<td>${atOrder.buyerProdName}</td>
                                		<td id="prodPrice" class="cb-tAlign-right">₩${atOrder.buyerProdPrice}</td>
                                		<td >
                                			<div>
	                                			<input id="atOrderQty" type="text" onkeyup="totalKeyUp($(this))" class="cb-tAlign-center atOrderQty" value="${atOrder.atOrderQty}" disabled="disabled" style="width:100px; margin-left:32%; float:left; "/>
                                			</div>
                                			<div class="cb-tAlign-center">   
	                                			<input type="button" class="plusBtn btn btn-square btn-primary" onclick="plusClick($(this))" value="+" style="width:25px; height:30px; margin-top:1%; padding:4px;" disabled="disabled">
												<input type="button" class="minBtn btn btn-square btn-primary" onclick="minusClick($(this))" value="-" style="width:25px; height:30px; margin-top:1%; margin-left:-2px; padding:4px;" disabled="disabled">
                                			</div>
                                		</td>
                                		<td class="cb-tAlign-center">
                                			<input id="orderPrice" type="text" class="cb-tAlign-center" value="₩${atOrder.orderPrice}" disabled="disabled" style="width:140px;"/>
										</td>                                		
                                	</tr>
                               	</c:forEach>
                                </tbody>
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
        
<!-- Datatable -->
<script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${cPath }/resources/dashboard3/js/plugins-init/datatables.init.js"></script>

<!-- script -->
<script type ="text/javascript" src="${cPath }/resources/js/fr/atOrder/atOrderList.js"></script>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 시큐리티 토큰 -->
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>
