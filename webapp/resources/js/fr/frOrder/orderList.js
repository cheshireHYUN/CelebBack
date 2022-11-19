let CPATH = $.CPATH;
let listBody = $('#listBody');
let pagingArea = $('.pagingArea');
let searchUI = $("#searchUI");
let totalRecord = $('#totalRecord');

// 주문확정
var confirmId="";
function confirmClick(target){
   confirmId = target.id;
   console.log(confirmId);
}

$(document).on("click",'#confirmYes',function(){
   let frOrderNo = confirmId;
   
   let param = {
      "frOrderNo" : frOrderNo
   };
   console.log(param)
   
   $.ajax({
      url : "/CelebBack/fr/frOrder/confirmOrder",
      method : 'post',
      data : JSON.stringify(param),
      headers: {'Content-Type': 'application/json'},
      dataType : "text" 
      ,
      
      beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
      
      success : function(resp, status, jqXHR) { 
    	  swal({
			  title: "구매확정 완료",
			  icon: "success",
			  button: "확인",
			}).then((value) => {
				if(value) { 
					 location.href='/CelebBack/fr/frOrder/deleteOrder/success';
				}
			});
      },
      error : function(jqXHR, status, error) {
         console.log(jqXHR);
         console.log(status);
         console.log(error);
      }
   })
   
});

// 주문취소
var cancelId="";
function cancelClick(target){
   cancelId = target.id;
   console.log(cancelId);
}

$(document).on("click",'#cancelYes',function(){
   let frOrderNo = cancelId;
   
   let param = {
      "frOrderNo" : frOrderNo
   };
   console.log(param)
   
   $.ajax({
      url : "/CelebBack/fr/frOrder/deleteOrder",
      method : 'post',
      data : JSON.stringify(param),
      headers: {'Content-Type': 'application/json'},
      dataType : "text" 
      ,
      
      beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
      
      success : function(resp, status, jqXHR) { 
    	  swal({
			  title: "주문취소 완료",
			  icon: "success",
			  button: "확인",
			}).then((value) => {
				if(value) { 
					 location.href='/CelebBack/fr/frOrder/deleteOrder/success';
				}
			});
      },
      error : function(jqXHR, status, error) {
         console.log(jqXHR);
         console.log(status);
         console.log(error);
      }
   })
   
});

// 발주내역 상세조회
var updateId="";   
function updateClick(target){
   console.log(target.id);
   updateId = target.id;
}   

let makeSingle = function(index, orderDetail){
 return $('<tr>').append(
              $("<td>").html(orderDetail.dtOrderName)
              		.attr({
              			"class" : "cb-tAlign-left"
              		})
              ,$("<td>").html(orderDetail.dtOrderQty)
              ,$("<td>").html("₩ "+orderDetail.dtOrderPrice)
              		.attr({
              			"class" : "cb-tAlign-right"
              		})
              )
}

let updateModal = $(document).on("click",'[data-bs-target="#updateModal"]',function(){
   let frOrderNo = this.id;
   let url = CPATH+"/fr/frOrder/orderList/"+frOrderNo;
   
   $.ajax({
      url : url,
      method : 'post',
      data : {
         "frOrderNo" : frOrderNo
      },
      
      dataType : "json" 
      ,
      
      beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
      
      success : function(resp, status, jqXHR) { 
         let orderDetailList = resp.orderDetail;
         console.log(resp.orderDetail);
         
         let trTags =[];
         if(orderDetailList && orderDetailList.length>0){ 
               $(orderDetailList).each(function(index, orderDetail){ 
                  trTags.push(makeSingle(index, orderDetail));
               });  
         } else{        
            let trTag = $("<tr>").html(
                  $("<td>").attr("colspan","6")
                         .html("등록된 제품 없음.")
               );
            trTags.push(trTag);                                                       
         }
         updateModal.find(".orderDetail").html(trTags);

      },
      error : function(jqXHR, status, error) {
         console.log(jqXHR);
         console.log(status);
         console.log(error);
      }
   })
});

// 페이징 처리 
$('.pagingArea').on('click','a',function(event){
   let page = $(this).data("page"); 
   searchForm.find("[name=page]").val(page);
   searchForm.submit();
});
   
// 발주내역   
let makeSingleTr = function(index, frOrder){
	var confirmCl;
	if(frOrder.lguName == '배송완료'){
		confirmCl = false;
	} else {
		confirmCl = true;
	}
	
	var canResult;
	if(frOrder.lguName == '배송준비중'){
		canResult = false;
	} else {
		canResult = true;
	}
	
	var fontColor;
	if(frOrder.lguName == '배송준비중'){
		fontColor = "color:purple";
	} else if(frOrder.lguName == '배송중'){
		fontColor = "color:orange";
	} else if(frOrder.lguName == '배송완료'){
		fontColor = "color:green";
	} else if(frOrder.lguName == '구매확정'){
		fontColor = "color:blue";
	} else if(frOrder.lguName == '주문취소'){
		fontColor = "color:red";
	}
	
 return $('<tr>').append(
              $("<td>").html(frOrder.frOrderNo)
                    .attr({
                       "id" : frOrder.frOrderNo,
                       "class" : "f_mouse",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#updateModal",
                       "onclick" : "updateClick(this)",
                       "onmouseover" : "f_mouseover()"
                    })
              ,$("<td>").html(frOrder.frOrderDate)
                    .attr({
                       "id" : frOrder.frOrderNo,
                       "class" : "f_mouse",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#updateModal",
                       "onclick" : "updateClick(this)",
                       "onmouseover" : "f_mouseover()"
                    })
              ,$("<td>").html("₩ "+frOrder.frOrderPrice)
                    .attr({
                       "id" : frOrder.frOrderNo,
                       "class" : "cb-tAlign-right f_mouse",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#updateModal",
                       "onclick" : "updateClick(this)",
                       "onmouseover" : "f_mouseover()"
                    })
              ,$("<td>").html(frOrder.lguName)
                    .attr({
                       "id" : frOrder.frOrderNo,
                       "class" : "f_mouse",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#updateModal",
                       "onclick" : "updateClick(this)",
                       "onmouseover" : "f_mouseover()",
                       "style" : fontColor
                    })
              ,$("<td>").append(
	               $("<input>").attr({
	                   "id" : frOrder.frOrderNo,
	                   "type" : "button",
	                   "value" : "구매확정",
	                   "class" : "btn btn-primary light btn-xs",
	                   "data-bs-toggle" : "modal",
	                   "data-bs-target" : "#confirmModal",
	                   "onclick" : "confirmClick(this)",
	                   "disabled" : confirmCl,
	                   "style" : "margin-right:10px;"
	                   }),
	               $("<input>").attr({
	                   "id" : frOrder.frOrderNo,
	                   "type" : "button",
	                   "value" : "주문취소",
	                   "class" : "btn btn-danger light btn-xs ",
	                   "data-bs-toggle" : "modal",
	                   "data-bs-target" : "#cancelModal",
	                   "onclick" : "cancelClick(this)",
	                   "disabled" : canResult
	                   })
	           ).attr({
	                   "colspan" : "2"
				})
            )
            
}

// 마우스오버 이벤트
function f_mouseover(){
    $(".f_mouse").css('cursor','grab'); 
}

// 검색조회    
let searchForm = $("#searchForm").on("submit",function(event){
   event.preventDefault();

   let url = this.action;
   let method = this.method;
   let data = $(this).serialize();
   
   $.ajax({ 
      url : url,
      data : data,
      method : method,
      dataType : "json" 
      ,
      success : function(resp, status, jqXHR) { 
         let frOrderList = resp.frOrder.dataList;
         console.log(resp.frOrder);
         
         let trTags =[];
         if(frOrderList && frOrderList.length>0){ 
               $(frOrderList).each(function(index, frOrder){ 
                  trTags.push(makeSingleTr(index, frOrder));
               });  
         } else{        
            let trTag = $("<tr>").html(
                  $("<td>").attr("colspan","6")
                         .html("등록된 발주내역이 없습니다.")
               );
            trTags.push(trTag);                                                       
         }
         listBody.html(trTags);
         pagingArea.html(resp.frOrder.pagingHTMLBS);  
         totalRecord.html("<strong> 검색결과 " +resp.frOrder.totalRecord+" 건 </strong>");
      },
      error : function(jqXHR, status, error) {
         console.log(jqXHR);
         console.log(status);
         console.log(error);
      }
   });
   return false;
}).submit();

$("#searchBtn").on("click",function(){
   searchForm.get(0).reset(); 
   let inputs = searchUI.find(":input[name]"); 
   $(inputs).each(function(idx, input){ 
      let name = $(this).attr('name'); 
      let value = $(this).val();
      searchForm.find("[name="+name+"]").val(value);
   });
   searchForm.submit();
});
