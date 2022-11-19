<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      최서현      최초작성
* 2022. 9. 15.     서재원      sweetAlert 관련 수정
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<head>
<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
<style>
.card-body {
	padding: 20px 30px 30px 30px;
}
</style>
</head>


   <script>
		$.CPATH = "${cPath}";
	</script>	
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" >
        
            <div class="container-fluid">
			<!-- 제목 템플릿 -->
			<div class="row page-titles">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>메뉴 조회</strong></h4>
			          <span>등록한 모든 메뉴를 조회하고 삭제합니다.</span>
			          
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">메뉴관리</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">조회</a></li>
			      </ol>
			  </div>
			</div>
			<!-- 제목 템플릿 끝 -->
                <div class="row" id="body">
                
                      <div class="default-tab">
                       <ul class="nav nav-tabs" role="tablist">
                           <li class="nav-item">
                               <a class="nav-link active" data-bs-toggle="tab" id="seekAppe" onclick="seekAppetizer()"><i class="la la-home me-2"></i> Appetizer </a>
                           </li>
                           <li class="nav-item">
                               <a class="nav-link" data-bs-toggle="tab" onclick="seekMain()"><i class="la la-user me-2"></i> Main</a>
                           </li>
                           <li class="nav-item">
                               <a class="nav-link" data-bs-toggle="tab"  onclick="seekDessert()"><i class="la la-phone me-2"></i> Dessert</a>
                           </li>
                       </ul>
                       <div class="tab-content">
                           <div class="tab-pane fade show active" id="home" role="tabpanel">
                               <div class="pt-4">
                               </div>
                           </div>
                           <div class="tab-pane fade" id="profile">
                               <div class="pt-4">
                               </div>
                           </div>
                           <div class="tab-pane fade" id="contact">
                               <div class="pt-4">
                               </div>
                           </div>
                       </div>
                   </div>
<!-- ---------------------------------------------------------------------------------------------------------------------------->
<!-- ---------------------------------------------------------------------------------------------------------------------------->

<!-- ---------------------------------------------------------------------------------------------------------------------------->
					
 
<!-- ---------------------------------------------------------------------------------------------------------------------------->

                </div>
            </div>
        </div>
        
        							

         
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

	$(document).ready(function(){
		// 도큐먼트가 로드되면 ajax로 데이터 싹다 읽어와서 .html()로 어펜드 해줘야됨
		getAllList();
		
		$('#seekAppe').click();
		//seekAppetizer();
	});

	function seekAppetizer(){
		$('.appetizer').css('display','block');
		$('.main').css('display','none');
		$('.dessert').css('display','none');
	};
	function seekMain(){
		$('.appetizer').css('display','none');
		$('.main').css('display','block');
		$('.dessert').css('display','none');
	};
	function seekDessert(){
		$('.appetizer').css('display','none');
		$('.main').css('display','none');
		$('.dessert').css('display','block');
	};

	let menuId = "";

	/* 삭제버튼을 눌러 모달창 실행 */
	$(document).on('click',".xbtn",function(e){
		var menuId = e.target.dataset.menuid;
		var menuName = e.target.dataset.menuname;
		swal(menuName+"을(를) 삭제하시겠습니까?", {
			  buttons: {
			    cancel: "닫기",
			    catch: {
			      text: "삭제",
			    },
			  },
			})
			.then((value) => {
			  switch (value) {
			 
			    case "catch":
			    	
					$(".appetizer").remove();
					$(".main").remove();
					$(".dessert").remove();
					
					
					
			 		$.ajax({
						type : 'delete',
						url : '${cPath}/head/menu/'+menuId,
						dataType : 'text',
						
						beforeSend : function(xhr)
						{
						   xhr.setRequestHeader(header,token);
						},
						
						success : function(result) {
							console.log("result: "+result);
							if(result == 'success') {
								$('#closeBtn').click();
								$('.nav-link').removeClass('active');
								$('#seekAppe').addClass('active');
								swal({
									  title: "삭제완료!",
									  text: "메뉴가 삭제되었습니다.",
									  icon: "success",
									  button: "닫기",
									});
								
								getAllList();
							}
						},
						  error : function(data){
							    alert('메뉴 삭제 실패!');
							  }
					});
			    	
			    	
			      swal("삭제완료", menuName+"이(가) 삭제되었습니다", "success");
			      break;
			 
			    default:
			      swal
			      ({
					  title: "취소되었습니다.",
					  icon: "info",
					  button: "닫기",
					});
			  }
			});
	})
	
	/* Save버튼을 눌러 삭제연산 수행 */
	$(document).on('click','#saveBtn',function(e){
		
		$(".appetizer").remove();
		$(".main").remove();
		$(".dessert").remove();
		
		
		
 		$.ajax({
			type : 'delete',
			url : '${cPath}/head/menu/'+menuId,
			dataType : 'text',
			
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			
			success : function(result) {
				console.log("result: "+result);
				if(result == 'success') {
					$('#closeBtn').click();
					$('.nav-link').removeClass('active');
					$('#seekAppe').addClass('active');
					swal({
						  title: "삭제완료!",
						  text: "메뉴가 삭제되었습니다.",
						  icon: "success",
						  button: "닫기",
						});
					
					getAllList();
				}
			},
			  error : function(data){
				    alert('메뉴 삭제 실패!');
				  }
		});
		
		
	});
	

	function getAllList(){
		$.ajax({
			  type : 'get',
			  url : '${cPath}/head/menu/list',
			  dataType : 'json',
			  beforeSend : function(xhr)
			  {
			     xhr.setRequestHeader(header,token);
			  },
			  success : function(data){
			    drawMenu(data);
			  },
			  error : function(data){
			    alert('메뉴 조회 실패!');
			  }
			});
		
		function drawMenu(data){
			console.log('drawMenu');
			
			var AppeStr="";
			var MainStr="";
			var DessStr="";
			

			$.each(data, function(i, MenuVO){
				if(MenuVO.menuType == 'Appetizer'){
					AppeStr += '<div class="col-lg-12 col-xl-6 appetizer" >'+
                    ' <div class="card">'+
                    ' <div class="card-body" style="margin-bottom:0px;">'+
                    '<div class="cbt" style="display:flex; flex-direction: row-reverse;">'+
                    '<button type="button" class="btn-close xbtn" aria-label="Close" data-menuId="'+MenuVO.menuId+'" data-menuName="'+MenuVO.menuName+'"  ></button>'+
                    '</div>'+
                        ' <div class="row m-b-30">'+
                             '<div class="col-md-5 col-xxl-12">'+
                               '  <div class="new-arrival-product mb-4 mb-xxl-4 mb-md-0">'+
                                    ' <div class="new-arrivals-img-contnent">'+
                                     '    <img class="img-fluid" src="${cPath}'+MenuVO.menuThumbImg+'" alt="사진오류">'+
                                    ' </div>'+
                               '  </div>'+ 
                         '    </div>'+
                           '  <div class="col-md-7 col-xxl-12">'+
                              '   <div class="new-arrival-content position-relative">'+
                                '     <h4><a href="ecom-product-detail.html">  </a></h4>'+
                                   '  <h4><a href="ecom-product-detail.html">'+MenuVO.menuName+'</a></h4>'+
                                   '  <div class="comment-review star-rating">'+

											
                                    ' </div>'+
                                    ' <p>Type: <span class="item"> '+MenuVO.menuType+' <i class="fa fa-check-circle text-success"></i></span></p>'+
                                    ' <p>Recipe: <span class="item">'+MenuVO.menuMaterial+' </span> </p>'+
                                   '  <p>Service Date: <span class="item">'+MenuVO.menuDate+' </span></p>'+
                                     '<p class="text-content">'+MenuVO.menuText+'</p>'+
                                ' </div> '+
                                 
                            ' </div> '+
                             
                             
                        ' </div>'+
                         
                         
                   '  </div> '+
                 '</div>'+
				'</div>'
				} else if(MenuVO.menuType == 'Main'){
					MainStr += '<div class="col-lg-12 col-xl-6 main" >'+
                    ' <div class="card">'+
                    ' <div class="card-body" style="margin-bottom:0px;">'+
                    '<div class="cbt" style="display:flex; flex-direction: row-reverse;">'+
                    '<button type="button" class="btn-close xbtn" aria-label="Close" data-menuId="'+MenuVO.menuId+'" data-menuName="'+MenuVO.menuName+'"  ></button>'+
                    '</div>'+
                        ' <div class="row m-b-30">'+
                             '<div class="col-md-5 col-xxl-12">'+
                               '  <div class="new-arrival-product mb-4 mb-xxl-4 mb-md-0">'+
                                    ' <div class="new-arrivals-img-contnent">'+
                                     '    <img class="img-fluid" src="${cPath}'+MenuVO.menuThumbImg+'" alt="사진오류">'+
                                    ' </div>'+
                               '  </div>'+
                         '    </div>'+
                           '  <div class="col-md-7 col-xxl-12">'+
                              '   <div class="new-arrival-content position-relative">'+
                                '     <h4><a href="ecom-product-detail.html">  </a></h4>'+
                                   '  <h4><a href="ecom-product-detail.html">'+MenuVO.menuName+'</a></h4>'+
                                   '  <div class="comment-review star-rating">'+

											
                                    ' </div>'+
                                    ' <p>Type: <span class="item"> '+MenuVO.menuType+' <i class="fa fa-check-circle text-success"></i></span></p>'+
                                    ' <p>Recipe: <span class="item">'+MenuVO.menuMaterial+' </span> </p>'+
                                   '  <p>Service Date: <span class="item">'+MenuVO.menuDate+' </span></p>'+
                                     '<p class="text-content">'+MenuVO.menuText+'</p>'+
                                ' </div> '+
                                 
                            ' </div> '+
                             
                             
                        ' </div>'+
                         
                         
                   '  </div> '+

                 '</div>'+
				'</div>'
				
				} else if(MenuVO.menuType == 'Dessert'){
					DessStr += '<div class="col-lg-12 col-xl-6 dessert" >'+
                    ' <div class="card">'+
                    ' <div class="card-body" style="margin-bottom:0px;">'+
                    '<div class="cbt" style="display:flex; flex-direction: row-reverse;">'+
                    '<button type="button" class="btn-close xbtn" aria-label="Close" data-menuId="'+MenuVO.menuId+'" data-menuName="'+MenuVO.menuName+'"  ></button>'+
                    '</div>'+
                        ' <div class="row m-b-30">'+
                             '<div class="col-md-5 col-xxl-12">'+
                               '  <div class="new-arrival-product mb-4 mb-xxl-4 mb-md-0">'+
                                    ' <div class="new-arrivals-img-contnent">'+
                                     '    <img class="img-fluid" src="${cPath}'+MenuVO.menuThumbImg+'" alt="사진오류">'+
                                    ' </div>'+
                               '  </div>'+
                         '    </div>'+
                           '  <div class="col-md-7 col-xxl-12">'+
                              '   <div class="new-arrival-content position-relative">'+
                                '     <h4><a href="ecom-product-detail.html">  </a></h4>'+
                                   '  <h4><a href="ecom-product-detail.html">'+MenuVO.menuName+'</a></h4>'+
                                   '  <div class="comment-review star-rating">'+

											
                                    ' </div>'+
                                    ' <p>Type: <span class="item"> '+MenuVO.menuType+' <i class="fa fa-check-circle text-success"></i></span></p>'+
                                    ' <p>Recipe: <span class="item">'+MenuVO.menuMaterial+' </span> </p>'+
                                   '  <p>Service Date: <span class="item">'+MenuVO.menuDate+' </span></p>'+
                                     '<p class="text-content">'+MenuVO.menuText+'</p>'+
                                ' </div> '+
                                 
                            ' </div> '+
                             
                             
                        ' </div>'+
                         
                         
                   '  </div> '+
                 '</div>'+
				'</div>'
				}
				
			})
				$("#body").append(MainStr);
				$("#body").append(AppeStr);
				$("#body").append(DessStr);
				
				$('.appetizer').css('display','block');
				$('.main').css('display','none');
				$('.dessert').css('display','none');
		}


	}; 

	var result = '${msg}';
	if(result=='success'){
		swal({
			  title: "메뉴 등록완료",
			  text: "새 메뉴가 등록되었습니다.",
			  icon: "success",
			  button: "닫기",
			});
	};
</script>
