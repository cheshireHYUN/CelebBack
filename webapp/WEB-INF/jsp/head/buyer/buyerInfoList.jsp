<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 12.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link href="${cPath}/resources/css/tableCustom.css" rel="stylesheet">

<script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}'; 
</script>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.pagingArea {
	justify-content: center;
	margin-bottom: 0px;
}
.pagination {
	margin-top: 0px !important;
}
</style>

<div class="content-body">

	<div class="container-fluid">
		<!-- <div class="form-head d-flex mb-3 align-items-start"> 이거 지우니까 화면꽉찬 바 나옴-->
			<!-- 메인 텍스트 시작-->
<!-- 			<div class="me-auto d-none d-lg-block">
				<h2 class="text-primary font-w600 mb-0">거래처조회</h2>
				<p class="mb-0">현재 거래 중인 거래처의 정보를 조회, 수정, 검색할 수 있습니다.</p>
			</div> -->
			
			
			<!-- 파란카드 템플릿 -->
			<div class="row page-titles">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>거래처조회</strong></h4>
			          <span>현재 거래 중인 거래처의 정보를 조회, 수정, 검색할 수 있습니다.</span>
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">주문거래관리</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">거래처조회</a></li>
			      </ol>
			  </div>
			</div>
			
			<p>
			
			<!-- 메인 텍스트 끝 -->
			
		<!-- 새로운 검색창(추가 모달과 검색) -->
			<div class="form-head dashboard-head d-md-flex align-items-start">

				<h2 class="dashboard-title me-auto"><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" class="btn btn-primary d-inline-block" style="visibility : hidden">추가</button></h2>
				<div id="searchUI" class="input-group search-area">
					<input type="text" name="buyerName" class="form-control" placeholder="거래처명을 입력하세요.">
					<!-- <span class="input-group-text"><a href=""><i class="flaticon-381-search-2"></i></a></span> -->
					<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
				</div>
			</div>
		
		
	</div>		
	<!-- container-fluid end -->
			<!-- 검색창 끝 -->
		
		
		<div class="container-fluid" style="padding-top: 8px;">
		
		
		   <div class="card">
           <div class="card-body">
		
		           <div class="row">
<!--                      <div class="mb-3 col-md-1 searchKeword"> -->
<!-- 											<select class="dropdown bootstrap-select default-select form-control wide"> -->
<!-- 												<option>정렬</option>											 -->
<!-- 												<option>정렬1</option>											 -->
<!-- 												<option>정렬2</option>											 -->
<!-- 											</select> -->
<!--                                  </div> -->
					<div class="col-12">
						<div class="table-responsive" >
							<div id="divID">
								<i class="fa fa-circle text-primary ms-1 fs-15"></i> 변경하고 싶은 셀을 더블클릭하세요. 내용 변경 후 엔터를 누르면 변경이 완료됩니다.
								<p>
							<table id="example5" class="display mb-4 dataTablesCard table table-hover table-responsive-sm dataTable" >
<!-- 							<table id="example5" class="display mb-4 dataTablesCard dataTable" style="min-width: 845px;"> -->
								<thead id="tHead">
									<tr>
										<th style="display: none">거래처번호</th>
										<th>번호</th>
										<th>거래처명</th>
										<th>담당자</th>
										<th>전화번호</th>
										<th>이메일주소</th>
										<th>주소</th>
									</tr>
								</thead>
								<tbody id="listBody">
									<c:set var="buyerList" value="${pagingVO.dataList }" />
									<c:choose>
										<c:when test="${not empty buyerList }">
											<c:forEach items="${buyerList }" var="buyer">
												<tr>
													<td style = "display: none">
													${buyer.buyerId }</td>
											
													<td style="text-align:center;">
													${buyer.rnum }</td>

													<td>
													<p id="BUYER_NAME" class="modify" contenteditable="false" data-default="${buyer.buyerName }" style="margin-bottom:0">
													${buyer.buyerName }</td>
													
													<td style="text-align:center;">
													<p id="BUYER_CHARGER" class="modify" contenteditable="false" data-default="${buyer.buyerCharger }" style="margin-bottom:0">
													${buyer.buyerCharger }</td>

													<td style="text-align:center;">
													<p id="BUYER_TEL" class="modify" contenteditable="false" data-default="${buyer.buyerTel }" style="margin-bottom:0">
													${buyer.buyerTel }</td>
													
													
													<td>
													<p id="BUYER_MAIL" class="modify" contenteditable="false" data-default="${buyer.buyerMail }" style="margin-bottom:0">
													${buyer.buyerMail }</td>
													
													<td>
													<p id="BUYER_ADD" class="modify" contenteditable="false" data-default="${buyer.buyerAdd }" style="margin-bottom:0">
													${buyer.buyerAdd }</td>

												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6">해당 검색어에 맞는 거래처가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
									
								</tbody>
							</table>
							<!-- 테이블 끝 -->
							</div>
							<!-- 테이블 div 끝 -->
							
							<!-- 인쇄 div 시작 -->
<!-- 							<div>
								<button type="button" id="printBtn" class="btn btn-primary cb-float-right">인쇄</button>
							</div> -->
							<!-- 인쇄 div 끝 -->
						</div>
                    </div>
				</div>
					<div class="pagination_fg">
						<div class="pagingArea">
							${pagingVO.pagingHTMLBS }
						</div>
					</div>
			</div> <!-- card end -->
			</div> <!-- card end -->
				
			</div>
	</div>



<!-- <script>
console.log($.CPATH);
</script> -->

<!-- content-body 끝 -->



<!-- 서치, 페이징용 hidden form 시작 -->
<form id="searchForm" action="${cPath }/head/buyerInfo">
	<input type="hidden" name="buyerName" placeholder="거래처명"/>
	<input type="hidden" name="page" placeholder="page">
</form>

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
		
		console.log("what is inputs");
		console.log(inputs);
		
		$(inputs).each(function(idx, input){
			let name = $(this).attr("name");
			
			console.log("찍어볼게");
			console.log(name);
			
			let value = $(this).val();
			
			console.log("뭘까..");
			console.log(value);
			
			searchForm.find("[name="+name+"]").val(value);
			
			console.log("귀찮다진짜");
			console.log(searchForm.find("[name="+name+"]").val(value));
		});
		searchForm.submit();
	});

	
</script>

<!-- <script>

document.getElementById(modify).forEach(function(node){
	node.ondblclick=function(){
		var val=this.innerHTML;
		var input=document.createElement("input");
		input.value=val;
		input.onblur=function(){
			var val=this.value;
			this.parentNode.innerHTML=val;
		}
		this.innerHTML="";
		this.appendChild(input);
		input.focus();
	}
});



</script> -->



<!-- 수정 데이터 넘기기용 hidden form 시작 -->
<%-- <form id="modifyData" action="${cPath }/head/buyerInfo">
	<input type="text" name="0id" />
	<input type="text" name="1name" />
	<input type="text" name="2tel" />
	<input type="text" name="3add" />
	<input type="text" name="4charger" />
	<input type="text" name="5mail" />
</form> --%>


<script type="text/javascript">

    // @breif contenteditable 속성을 가진경우

    contents = document.getElementsByClassName("modify");

    
  //  let ids = document.getElementsByClassName("modify")[0].id;
    
/*     console.log("할수잇나");
    console.log(contents); */
    
    document.addEventListener("DOMContentLoaded", function() {
        // @breif rowColumn 클래스의 갯수 만큼 반복문을 실행한다.
        Array.from(contents).forEach(function(content) {
        	
/*         	console.log(content.id);
    console.log("되게해주세용"); */
        	
            // @breif 마우스로 해당영역을 더블클릭 한경우
            content.addEventListener("dblclick", function(event) {
                // @breif 전체 테이블 컬럼( td > p )에서 현재 사용중인 값의 존재여부를 확인한다.
                Array.from(contents).forEach(function(defaultVal) {
                    // @details 저장하지 않은 내용이라고 판단하여 data 태그의 기본값으로 되돌린다.
                    defaultVal.textContent = defaultVal.dataset.default;
                    // @breif 수정 불가 상태로 되돌린다.
                    defaultVal.contentEditable = false;
                    defaultVal.style.border = "0px";
                });

                if(content.isContentEditable == false) {
                    // @details 편집 가능 상태로 변경
                    content.contentEditable = true;
                    // @details 텍스트 문구 변경
                    // content.textContent = "";

                    // @details CSS 효과 추가
                    content.style.border = "1px solid #ffd5de";
                    content.style.background = "#ffd5de";
                    // @details 포커스 지정
                    content.focus();
                }
                
            });
    
            // @breif 키보드 입력이 방생한 경우 실행
            content.addEventListener("keypress", function(event) {
            	
         
                // @breif Enter키 입력시 실행
                if(event.key === "Enter") {
                    // @details 입력된 값이 빈값( null )인지 체크한다.
                    
                    var thisRow = $(this).closest('tr');
                    var buyerId = thisRow.find('td:eq(0)').text(); // 공백 생겨서
                    var buyerIdTrim = buyerId.trim(); // trim으로 지워줬음.
                    console.log(buyerIdTrim); // 거래처 ID값을 가져왔음
                    
                    // ★★★★★★★★
                    console.log("id값 출력하기!!");
                    console.log(content.id); 
                    let ids = content.id; // 수정하는 해당 폼의 id값을 가져오는 것도 성공함..
                    // 이제 id값이 같으면 위의 form에 name 똑같은곳에 데이터 넣어줘야함.....
                    // 
                  
                    console.log("값을 찍어봅시다");
                    console.log(content.textContent);
                    let mv = content.textContent;
                    // 내가 수정한 데이터 값!

                    if(
                            content.textContent == ""
                         || content.textContent == null
                         || content.textContent == undefined
                         || (content.textContent != null
                         && typeof content.textContent == "object"
                         && !Object.keys(content.textContent).length == ""))
                           {
                        // @details 내용이 존재하지 않다면 data 태그의 기본값으로 되돌린다.
                        content.textContent = content.dataset.default;
                    } else {
                        // @details 내용의 수정이 완료되었다면 data 태그의 기본값도 바꿔준다.
                        content.dataset.default = content.textContent;
                    }
                    // @breif 수정 불가 상태로 되돌린다.
                    content.contentEditable = false;
                    content.style.border = "0px";
                    
                    var allData = {"buyerId":buyerIdTrim, "modifyValue":mv, "column":ids };
                    console.log("흠");
                    console.log(allData);
                    
                    // ajax를 통한 데이터 전송
	                    $.ajax({
	                    	url: "buyerInfo",
	                    	data : allData,
	                    	type : "POST",
	                    	
	                    	beforeSend : function(xhr)
	                    	{
	                    	   xhr.setRequestHeader(header,token);
	                    	},
	                    	
	                    	success : function(resp) {
	                    		//alert("수정 완료"); 띄우지 맙시다..
	                    		console.log("데이터 전송 성공");
	                    		console.log(resp);
	                    		
	                    		swal({
	                  			  title: "성공적으로 수정되었습니다.",
	                  			  text: "",
	                  			  icon: "success",
	                  			  button: "확인",
	                  			});
	                    		
	                    	},
	                    	error : function(){
	                    		alert("알 수 없는 에러가 발생했습니다.")
	                    		console.log(data);
	                    	}
	                    });
                    
                    
	                    content.style.border = "1px solid #ffffff";
	                    content.style.background = "#ffffff";
                    
	                    //window.location.reload();
                    
                } // enter 이벤트 끝
                
                
            });
        });
    });

</script>
 