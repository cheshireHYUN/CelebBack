<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link href="${cPath}/resources/dashboard3/vendor/nestable2/css/jquery.nestable.min.css" rel="stylesheet">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ page session="false" %>

<head>
<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles" style="margin : 0px;">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text"> 
                            <h4>MENU</h4>
                            <span>판매할 수 있는 메뉴를 드래그하여 판매 할 메뉴에 드랍하세요</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">가맹점정보관리</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">메뉴관리</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
                           
                                                 <div class="col-xl-6" style="margin : 10px 0px 5px 0px;">
                                                       <button class="btn btn-primary">저장</button>
                                                </div> 
                <!-- Nestable -->
                <div class="row">
                    <div class="col-12">

<!--                             <div class="card-header">
                                <h4 class="card-title">판매할 수 있는 메뉴를 드래그하여 판매 할 메뉴에 드랍하세요</h4>
                            </div> -->
                            

                            <div class="card-body" style="background : #FFF; filter: alpha(opacity:''60'');">
                                <div class="row">
                                
                                
                                    <div class="col-md-6" id="beforediv">
                                            <p>판매 할 수 있는 메뉴</p>
                                        <div class="card-content">
                                                <div class="dd" id="nestable">
                                                    <ol class="dd-list">
                                                    
														<c:forEach items="${menuList}" var="FrMenuVO">   
														                                                	
	                                                        <li class="dd-item" data-menuId="${FrMenuVO.menuId}">
	                                                            <div class="dd-handle">${FrMenuVO.menuName}</div>
	                                                        </li>
	                                                   
	                                                    </c:forEach>   
													
													</ol>
                                                </div>
                                            </div>
                                    </div>
                                    
                            
                                    <div class="col-md-6" id="afterdiv">
                                       <p>매장에서 판매할 메뉴</p>
                                        <div class="card-content">
                                                <div class="dd" id="nestable2">
                                                
	                                                    <ol class="dd-list">
															<c:forEach items="${frMenuList}" var="MenuVO">   
		                                                        <li class="dd-item" data-menuid="${MenuVO.menuId}">
		                                                            <div class="dd-handle" >${MenuVO.menuName}</div>
		                                                        </li>
		                                                    </c:forEach>
	                                                    </ol>
                                                    
                                                </div>
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

	<script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	// 버튼 누르면 오른쪽 div의 모든 data-menuId 값을 읽어와서 updateController로 보내주면돼
	$('.btn').on('click',function(){
		var menuIdList1 = document.getElementById('nestable2');
		var menuIdList2 = menuIdList1.getElementsByClassName('dd-item');
		var menuIdList = [];
 		
 		for(var i=0; i<menuIdList2.length; i++){
 			//Array에 모든 menuId를 넣는다
			menuIdList.push(menuIdList2[i].dataset.menuid)
		}
 		for(var i=0; i<menuIdList.length; i++){
			console.log(menuIdList[i])
		}
 		
 		
 		$.ajax({
 			type:'post',
 			url:'/CelebBack/fr/info/menu/menuList',
 			contentType: 'application/json',
 			dataType : 'text',
 			data : JSON.stringify({
 				menuIdList : menuIdList
 			}),
 			beforeSend : function(xhr)
 			{
 			   xhr.setRequestHeader(header,token);
 			},
 			success : function(result){
 				if(result=='success') {
 					swal({
 						  title: "저장 완료",
 						  text: "이제 저장한 메뉴를 서비스할 수 있습니다.",
 						  icon: "success",
 						  button: "닫기",
 						});
 				}
 			}
 		});

	});
	


	
	</script>

	<!-- Apex Chart -->
	<script src="${cPath}/resources/dashboard3/vendor/apexchart/apexchart.js"></script>
    <!-- Nestable -->
    <script src="${cPath}/resources/dashboard3/vendor/nestable2/js/jquery.nestable.min.js"></script>
    <!-- All init script -->
    <script src="${cPath}/resources/dashboard3/js/plugins-init/nestable-init.js"></script>