<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    

 <link rel="stylesheet" href="${cPath}/resources/dashboard3/vendor/select2/css/select2.min.css">
    <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
            
            			<!-- 제목 템플릿 -->
			<div class="row page-titles">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>메뉴 등록</strong></h4>
			          <span>고객에게 서비스할 새로운 메뉴를 등록합니다.</span>
			          
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">메뉴관리</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">등록</a></li>
			      </ol>
			  </div>
			</div>
			<!-- 제목 템플릿 끝 -->
            
 
                <!-- row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">MENU Register Form</h4>
                            </div>
                            <div class="card-body"  style="display:flex; justify-content: center; align-items: center;">
                                <div class="form-validation">
                                    <form role="form" method="post" class="needs-validation" enctype="multipart/form-data" >
                                    												
												<sec:csrfInput/>
												
												
                                        <div class="row">
                                        
                                        
                                        	
                                                <div class="col-xl-6">
                                                <div class="mb-3 row">
                                                    <label class="col-lg-4 col-form-label" for="validationCustom04">이미지 첨부 <span
                                                            class="text-danger">*</span>
                                                    </label>
                                                    
		                                        <div class="input-group mb-3" style="width:50%;"> 
		                                        <div class="select_img"><img src="" style="margin:0px 5px;"/></div>
													<span class="input-group-text">Upload</span>
		                                                <input id="menuImg" type="file" name='file' class="form-file-input form-control" style="width:30px" />
		                                                
		                                        </div> 
                                                </div>
                                                </div>
                                                <script>
                                                	$('#menuImg').change(function(){
		                                                // img가 변하면 해당파일, 여러개일경우 맨첫번째거가 같을경우(?)
                                                		if(this.files && this.files[0]){
                                                			// 이미지를 읽은다음
                                                			var reader = new FileReader;
                                                			// 화면에 온로드한다. 지정한 위치의 빈 img src에 방금 data의 크기를 변환한 결과를 넣어
                                                			reader.onload = function(data){
                                                				$('.select_img img').attr("src", data.target.result).width(100);
                                                			}
                                                			reader.readAsDataURL(this.files[0]);
                                                		}
                                                	});
                                                	
                                                </script>
                                        	
                                        	
                                        	
                                            <div class="col-xl-6">
                                                <div class="mb-3 row">
                                                    <label class="col-lg-4 col-form-label" for="validationCustom01">메뉴이름
                                                        <span class="text-danger">*</span>
                                                    </label>
                                                    <div class="col-lg-6">
														<input name="menuName" type="text" class="form-control" id="validationCustom01"  placeholder="(ex)퀸즈랜드 립아이" required>
														<div class="invalid-feedback">
															Please enter a Menu name.
														</div>
                                                    </div>
                                                </div>
                                              </div>
                                              
                                            <div class="col-xl-6">
                                                <div class="mb-3 row">
                                                    <label class="col-lg-4 col-form-label" for="validationCustom05">메뉴유형
                                                        <span class="text-danger">*</span>
                                                    </label>
                                                    <div class="col-lg-6">
                                                        <select  name="menuType" class="default-select wide form-control" id="validationCustom05">
                                                            <option data-display="Select">Please select</option>
                                                            <option value="Appetizer">Appetizer</option>
                                                            <option value="Main">Main</option>
                                                            <option value="Dessert">Dessert</option>
                                                        </select>
														<div class="invalid-feedback">
															Please select a one.
														</div>
                                                    </div>
                                                </div>
                                              </div>  
                                               
                                               <div class="col-xl-6"> 
                                                <div class="mb-3 row">
                                                    <label class="col-lg-4 col-form-label" for="validationCustom04">메뉴설명 <span
                                                            class="text-danger">*</span>
                                                    </label>
                                                    <div class="col-lg-6">
                                                        <textarea  name="menuText" class="form-control" id="validationCustom04"  rows="5" placeholder="(ex)두툼하고 부드러운 육질의 꽃등심 스테이크" required></textarea>
														<div class="invalid-feedback">
															Please enter a Suggestions.
														</div>
                                                    </div>
                                                </div>
                                                </div>
                                                

                                            

                                            <div class="col-xl-6">
                                                <div class="mb-3 row">
                                                    <label class="col-lg-4 col-form-label" for="validationCustom05">메뉴재료
                                                        <span class="text-danger">*</span>
                                                    </label>
                                                    <div class="col-lg-6">
						
						                                <select name="buyerprodId" class="multi-select-placeholder js-states" multiple="multiple">
						                                <c:forEach items="${hstock}" var="HStockVO">
						                                    <option value="${HStockVO.buyerprodId}">${HStockVO.buyerprodName}</option>
						                                </c:forEach>
						                                </select>
														<div class="invalid-feedback">
															Please select a one.
														</div>
                                                    </div>
                                                </div>
                                              </div>  

                                         	   <div class="col-xl-6">
                                                <div class="mb-3 row">
                                                    <label class="col-lg-4 col-form-label" for="validationCustom06">가격
                                                        <span class="text-danger">*</span>
                                                    </label>
                                                    <div class="col-lg-6">
                                                        <input name="menuPrice" type="text" class="form-control" id="validationCustom06" placeholder="(ex)41000" required>
														<div class="invalid-feedback">
															Please enter a Currency.
														</div>
                                                    </div>
                                                </div>
                                                </div>
                                                
                                                <div class="col-xl-6">
                                                <div class="mb-3 row">
                                                    <label class="col-lg-4 col-form-label" for="validationCustom07">출시일
                                                        <span class="text-danger">*</span>
                                                    </label>
                                                    <div class="col-lg-6">
                                                        <input name="menuDate" type="date" class="form-control" id="validationCustom07"  placeholder="(ex)20221020" required>
														<div class="invalid-feedback">
															Please enter a url.
														</div>
                                                    </div>
                                                </div>
                                                </div>

                                                <div class="col-xl-6">
	                                                <div class="mb-3 row"> 
	                                                    <div class="col-lg-8 ms-auto" style="display:flex; justify-content: flex-end; margin:0px 17%;">
	                                                        <button type="submit" class="btn btn-primary">저장</button>
	                                                    </div>
	                                                </div>
                                                </div>
                                                
                                                
                                            </div>
                                    </form>
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
        <script>
			var header = '${_csrf.headerName}';
			var token =  '${_csrf.token}';
		</script>
        
    	<script src="${cPath}/resources/dashboard3/vendor/apexchart/apexchart.js"></script>
        <script src="${cPath}/resources/dashboard3/vendor/select2/js/select2.full.min.js"></script>
        <script src="${cPath}/resources/dashboard3/js/plugins-init/select2-init.js"></script>
