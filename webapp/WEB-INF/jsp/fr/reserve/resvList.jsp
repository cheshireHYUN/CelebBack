<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      이혜원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">

<!--**********************************
    Content body start
***********************************-->
<div class="content-body">
	<div class="container-fluid">
	
                <!-- row -->
		 		<div class="row page-titles">
				  <div class="col-sm-6 p-md-0">
				      <div class="welcome-text">
				          <h4><strong>예약내역</strong></h4>
				          <span>예약내역을 조회합니다.</span>
				      </div>
				  </div>
				  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				      <ol class="breadcrumb">
				          <li class="breadcrumb-item"><a href="javascript:void(0)">예약관리</a></li>
				          <li class="breadcrumb-item active"><a href="javascript:void(0)">예약내역</a></li>
				      </ol>
				  </div>
				</div>
				
				<div>
					<div>
						<button type="button" id="todayButton" class=" btn btn-primary light px-3" style="float:left;" data-bs-toggle ="modal" data-bs-target="#todayModal">
						<i class="fa fa-paper-plane font-18 align-middle me-2"></i>오늘의 예약건
						</button>
					</div>
					<div id="searchUI">
						<div style="float: right; width: 60%;">
							<div style="text-align: right; width: 49%;" >
				                <div class="searchKeword">
				                     <input type="date" name="searchStartDate" value="startDate" class="form-control" >
				                </div>
			                   		~
				                <div class="searchKeword">
				                     <input type="date" name="searchEndDate" value="endDate" class="form-control" >
				                </div>
				            </div>
			                <div style="width: 50%; margin-left:50%; margin-top:-55px;">
			                   <div class="input-group search-area">
			                       <select name="searchType" class="dropdown bootstrap-select default-select form-control wide">
		                       			<option>전체</option>
		                       			<option value="resvId">예약번호</option>
		                       			<option value="resvTime">예약시간</option>
		                       			<option value="resvPcnt">예약인원</option>
		                       			<option value="sitId">좌석번호</option>
		                       			<option value="lguName">예약상태</option>
		                       		</select>
				                   <input type="text" name="searchWord" class="form-control" style="width:130px;" placeholder="검색어를 입력하세요.">
				                   <button id="searchBtn" type="button" class="btn light btn-primary">검색</button>
			            	    </div>
		          			</div>
	       				</div>
					</div>
				</div>
					
	<div class="container-fluid">	
   		<div class="row" style="width: 108%; margin-left: -4%; padding-top:15px;">		
			<div class="col-12">
				<div class="card">
					<div id="totalRecord" class="searchKeword" style="float:left; margin-left:30px; margin-top:20px;"></div>
                 	<div class="card-body">
                         <div class="table-responsive">
                             <table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" style="width:100%">
                                 <thead>
                                     <tr>
                                         <th>예약번호</th>
                                         <th>예약일자</th>
                                         <th>예약시간</th>
                                         <th>예약인원</th>
                                         <th>좌석번호</th>
                                         <th>예약상태</th>
                                         <th>취소사유</th>
                                     </tr>
                                 </thead>
                                 <tbody id="listBody" class="cb-tAlign-center"/>
                             </table>
                             	<tfoot>
									<tr>
										<td colspan="7" >
											<div class="pagingArea cb-float-center">
 			   								</div>
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
        
	<!-- 오늘예약내역 Modal -->
	<div class="modal fade" id="todayModal">
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 id="todayTitle" class="modal-title"></h5>
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
				                           <th>예약번호</th>
				                           <th>예약시간</th>
				                           <th>예약인원</th>
				                           <th>예약좌석</th>
				                        </tr>
                    				</thead>
				                    <tbody class="cb-tAlign-center">
				                    <c:forEach items="${todayList }" var="today">
				                    	<tr>
				                    		<td>${today.resvId}</td>
				                    		<td>${today.resvTime}</td>
				                    		<td>${today.resvPcnt}</td>
				                    		<td>${today.sitId}</td>
				                    	</tr>
				                    </c:forEach>
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

<form id="searchForm" method="get" action="${cPath }/fr/reserve/resvList" >
	<input type="hidden"  name="page" />
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
	<input type="hidden" name="searchStartDate" />
    <input type="hidden" name="searchEndDate" />
</form>	

<!-- Datatable -->
<script src="${cPath }/resources/dashboard3/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${cPath }/resources/dashboard3/js/plugins-init/datatables.init.js"></script>

<!-- script -->
<script type ="text/javascript" src="${cPath }/resources/js/fr/reserve/resvList.js"></script>
