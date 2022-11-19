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
    <link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">
    <link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">

<style>
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
                      <h4><strong>발주내역</strong></h4>
                      <span>발주내역을 조회합니다.</span>
                  </div>
              </div>
              <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                  <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="javascript:void(0)">발주관리</a></li>
                      <li class="breadcrumb-item active"><a href="javascript:void(0)">발주내역</a></li>
                  </ol>
              </div>
            </div>
   			<div id="searchUI" >
          		<div style="float: right; width: 60%;">
	          		<div style="text-align: right; width: 49%;" >
		                <div class="searchKeword">
		                     <input type="date" name="searchStartDate" value="startDate" class="form-control" >
		                </div>
	                   		~
		                <div class="searchKeword" >
		                     <input type="date" name="searchEndDate" value="endDate" class="form-control" >
		                </div>
	          		</div>
	                <div style="width: 50%; margin-left:50%; margin-top:-55px;">
	                   <div class="input-group search-area">
	                       <select name="searchType" class="dropdown bootstrap-select default-select form-control wide">
	                          <option>전체</option>
	                          <option value="frOrderNo">주문번호</option>
	                          <option value="frOrderPrice">주문금액</option>
	                          <option value="lguName">주문상태</option>
	                       </select>
		                   <input type="text" name="searchWord" class="form-control" style="width:130px;" placeholder="검색어를 입력하세요.">
		                   <button id="searchBtn" type="button" class="btn light btn-primary">검색</button>
	            	    </div>
	          		</div>
          		</div>
       		</div>
            
                            
   	<div class="container-fluid" style="padding-top: 75px;">	
      	<div class="row" style="width: 108%; margin-left: -4%;">
        	 <div class="col-12">
           	 	<div class="card">
                   	<div id="totalRecord" class="searchKeword" style="float:left; margin-left:30px; margin-top:20px;"></div>
                    <div class="card-body">
                         <div class="table-responsive" style="margin-top: -20px;">
                             <table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="width:100%">
                                 <thead>
                                     <tr>
                                         <th>주문번호</th>
                                         <th>주문일자</th>
                                         <th>주문금액</th>
                                         <th>주문상태</th>
                                         <th>주문처리</th>
                                     </tr>
                                 </thead>
                                 <tbody id="listBody" class="cb-tAlign-center">
                                 </tbody>
                             </table>
                           	 	<tfoot>
                                 	<tr>
		                              <td colspan="5" >
		                                 <div class="pagingArea cb-float-center"></div>
		                              </td>
		                           </tr>
	                           </tfoot>
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

	<!-- 발주내역상세 Modal -->
   <div class="modal fade" id="updateModal">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">발주상세내역</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal">
               </button>
            </div>
            <div class="modal-body">
            	<div class="basic-form">
	            	<div class="col-12">
						<div class="table-responsive" >
							<div id="divID">
								<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" >
									<thead id="tHead">
				                        <tr>
				                           <th>주문제품</th>
				                           <th>주문수량</th>
				                           <th>주문금액</th>
				                        </tr>
                    				</thead>
				                    <tbody class="orderDetail cb-tAlign-center">
				                    </tbody>
             					 </table>
								</div>
							</div>
	              		 </div>
               		</div>
            	</div>
           	<div class="modal-footer">
           		<button type="button" class="btn btn-danger light btn-xs" data-bs-dismiss="modal">닫기</button>
       		</div>
        </div>
      </div>
  </div>

    <!-- 주문취소 Modal -->
      <div class="modal fade" id="cancelModal">
          <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title">주문취소</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal">
                      </button>
                  </div>
                  <div class="modal-body cb-tAlign-center">주문취소시 되돌릴 수 없습니다.<br>정말 취소하시겠습니까?</div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary light" data-bs-dismiss="modal">뒤로가기</button>
                      <button type="button" class="btn btn-danger" id="cancelYes">취소하기</button>
                  </div>
              </div>
          </div>
       </div>
       
    <!-- 주문확정 Modal -->
      <div class="modal fade" id="confirmModal">
          <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title">구매확정</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal">
                      </button>
                  </div>
                  <div class="modal-body cb-tAlign-center">구매확정시 환불이 불가합니다.<br>정말 확정하시겠습니까?</div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary light" data-bs-dismiss="modal">취소</button>
                      <button type="button" class="btn btn-danger" id="confirmYes">확정</button>
                  </div>
              </div>
          </div>
       </div>

<form id="searchForm" method="get" action="${cPath }/fr/frOrder/orderList">
   <input type="hidden" name="page" />
   <input type="hidden" name="searchWord"/>
   <input type="hidden" name="searchType"/> 
   <input type="hidden" name="searchStartDate" />
   <input type="hidden" name="searchEndDate" />
</form>   

<!-- Datatable -->
<script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${cPath }/resources/dashboard3/js/plugins-init/datatables.init.js"></script>

<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<!-- script -->
<script type ="text/javascript" src="${cPath }/resources/js/fr/frOrder/orderList.js"></script>
<!-- 시큐리티 토큰 -->
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>
