// 발주제품조회
var listBody = $('#listBody');
var searchUI = $("#searchUI");
var str="";

var makeSingleTr = function(index, prodOrder){
	
	// 주문권장수량 글씨색
	var result;
	var resultColor;
	if(prodOrder.atOrderQty > prodOrder.frStockQty){
		result = (prodOrder.atOrderQty - prodOrder.frStockQty) + " ▲";
		resultColor = "color:green;"
	}else{
		result = 0;
	}
	
	// 현재고 글씨색
	var stockResult;
	var stockColor;
	if(prodOrder.atOrderQty >= prodOrder.frStockQty){
		stockResult = prodOrder.frStockQty;
		stockColor = "color:red;";
	}else{
		stockResult = prodOrder.frStockQty;
		stockColor = "color:black;";
	}
	
 return $('<tr>').append(	
			 $("<td>").append(
				 $("<input>").attr({
					 "type" : "checkbox"
					 ,"id" : "checkList"
					 ,"class" : "form-check-input checkList" 
					 ,"name" : "checkList"
					 ,"onclick" : "checkClick($(this))"
				 })
			)
			,$("<td>").html(prodOrder.buyerProdId)
						.attr({
				 			"class" : "buyerProdId"
							})	
			,$("<td>").html(prodOrder.buyerProdName)
						.attr({
				 			"class" : "buyerProdName cb-tAlign-left"
//				 			,"style" : "width:200px;"
							})	
			,$("<td>").html('₩ '+prodOrder.buyerProdPrice)
						.attr({
							"id" : "prodPrice"
							,"class" : "cb-tAlign-right"
//			 				,"style" : "width:150px;"
							})	
			,$("<td>").html(prodOrder.hstockQty)
						.attr({
				 			"id" : "hStockQty"
				 			,"style" : "padding-left: 45px;"
							})	
			,$("<td>").html(prodOrder.atOrderQty)
						.attr({
				 			"class" : "atOrder"
				 			,"style" : "padding-left: 45px;"
							})	
			,$("<td>").html(stockResult)
						.attr({
				 			"class" : "nameColor"
				 			, "style" : "padding-left: 45px;" + stockColor
							})	
			,$("<td>").html(result)
						.attr({
							"style" : "padding-left: 45px;" + resultColor
						})
			,$("<td>").append(
					$("<div>").append(
						$("<input>").attr({
							 "type" : "text"
							 , "id" : "orderQty"
							 , "value" : "0"
							 , "style" : "width:80px; margin-left:20px; float:left;"
							 , "class" : "cb-tAlign-center"
							 , "onkeyup" : "totalKeyUp($(this))"
				 		})
				 	),
				 	$("<div>").append(
						$("<input>").attr({
							 "type" : "button"
							 , "style" : "width:20px; height:30px; margin-top:3px;"
							 ,"class" : "fc-today-button fc-button fc-button-primary"
							 ,"value" : " + "
							 , "onclick" : "plusClick($(this))"
						 })
						,$("<input>").attr({
							 "type" : "button"
							 , "style" : "width:20px; height:30px; margin-left:1px;"
							 , "class" : "fc-today-button fc-button fc-button-primary"
							 , "value" : " - "
							 , "onclick" : "minusClick($(this))"
						 })
					)
					.attr({
						"class" : "cb-tAlign-center"
					})
			).attr({
				"style" : "width:200px;"
			})
			,$("<td>").append(
				$("<input>").attr({
					 "type" : "text"
					 ,"id" : "orderPrice"
					 ,"value" : "₩        0"
					 ,"style" : "width:120px; "
				     , "class" : "price cb-tAlign-left"
				     , "disabled" : true
				 })
			)
		)
		
}

// 체크박스
function checkClick(el) {
	
	var parProdPrice = replaceAll(el.closest('tr').find('#prodPrice').text(), '₩', '').trim();
	var paProdPrice = replaceAll(parProdPrice, ',', '') * 1;
	var orderQty = el.closest('tr').find('#orderQty').val() * 1;
	var allQty = $("#allQty").val();
	
	// 주문금액을 계산한 후 꼭 변수에 담는다.
	
	// 단순 계산
	var resultOrderPrice = (paProdPrice * orderQty);
	
	// 계산값 출력하기 위해 파싱
	var resultParOrderPrice = '₩   '+(paProdPrice * orderQty).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	el.closest('tr').find('#orderPrice').val(resultParOrderPrice);
	
	// 총주문금액 자리에 구한값을 넣는다.
	var parAllPrice = replaceAll($('#allPrice').val(), '₩', '').trim();
	var paAllPrice = replaceAll(parAllPrice, ',', '') * 1;
	$('#allPrice').val('₩  '+(paAllPrice + resultOrderPrice).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
	$("#allQty").val($("input[name='checkList']:checked").length);
	
	// 체크해제
	if(!el.is(':checked')){
		console.log($('#allPrice').val(paAllPrice - resultOrderPrice))
		$('#allPrice').val('₩  '+(paAllPrice - resultOrderPrice).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
	}
	
}

// 발주
var chkArr = [];
$("#orderBtn").on("click",function(){
	
	var parAllPrice = replaceAll($('#allPrice').val(), '₩', '').trim();
	if(parAllPrice == '0'){
		swal({
			  title: "발주할 제품을 선택해주세요!",
			  icon: "warning",
			  button: "확인",
			});
	}
	else{
		
		var sumParam = {
				"frOrderPrice" : parAllPrice
		}
		chkArr.push(sumParam);
		
		$.each($('input.checkList:checked'), function(i, v){
			
			var el = $(this);
			
			var buyerProdId = el.closest('tr').find('.buyerProdId').text();
			var dtOrderName = el.closest('tr').find('.buyerProdName').text();
			var dtOrderQty = el.closest('tr').find('#orderQty').val()*1;
			var parDtOrderPrice = replaceAll(el.closest('tr').find('#orderPrice').val(), '₩', '').trim();
			var dtOrderPrice = replaceAll(parDtOrderPrice, ',', '');
			var param = {
				"buyerProdId" : buyerProdId,
				"dtOrderName" : dtOrderName,
				"dtOrderQty" : dtOrderQty,
				"dtOrderPrice" : dtOrderPrice,
			};
			chkArr.push(param);
		});
		
		$.ajax({ 
			url : "/CelebBack/fr/frOrder/insertOrder",
			data : JSON.stringify(chkArr),
			type : 'post',
			headers: {'Content-Type': 'application/json'},
			dataType : "text"
			,
			
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			
			success : function(resp, status, jqXHR) { 
				swal({
					  title: "주문접수 완료",
					  icon: "success",
					  button: "확인",
				}).then((value) => {
					if(value) { 
						location.href='/CelebBack/fr/frOrder/insertOrder/success';
					}
				});
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
});	

// 수량입력
function totalKeyUp(el) {
	
	var parProdPrice = replaceAll(el.closest('tr').find('#prodPrice').text(), '₩', '');
	var paProdPrice = replaceAll(parProdPrice, ',', '') * 1;
	var orderQty = el.val();
	
	var resultParOrderPrice = '₩   '+(paProdPrice * orderQty).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	el.closest('tr').find('#orderPrice').val(resultParOrderPrice);
	
	var parOrderQty = parseInt(orderQty)
	var parhStockQty = parseInt(el.closest('tr').find('#hStockQty').text())

	if(parOrderQty > parhStockQty){
		alert("주문가능수량을 초과하였습니다!")
	}
	
}


// +수량버튼
function plusClick(el){
	// 기본값
	var orderQty = el.closest('tr').find('#orderQty').val();
	var prodPrice = el.closest('tr').find('#prodPrice').val();
	var orderPrice = el.closest('tr').find('#orderPrice').val();
	
	// 파싱
	var parOrderQty = orderQty * 1;
	var parProdPrice = replaceAll(el.closest('tr').find('#prodPrice').text(), '₩', '').trim();
	var paProdPrice = replaceAll(parProdPrice, ',', '') * 1;
	
	// 수량값 담음
	el.closest('tr').find("#orderQty").val(parOrderQty + 1);
	var resultQty = el.closest('tr').find("#orderQty").val() * 1;
	
	// 주문금액 담음
	el.closest('tr').find("#orderPrice").val('₩   '+(resultQty * paProdPrice).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));

}     

// -수량버튼
function minusClick(el){
	// 기본값
	var orderQty = el.closest('tr').find('#orderQty').val();
	var prodPrice = el.closest('tr').find('#prodPrice').val();
	var orderPrice = el.closest('tr').find('#orderPrice').val();
	
	// 파싱
	var parOrderQty = orderQty * 1;
	var parProdPrice = replaceAll(el.closest('tr').find('#prodPrice').text(), '₩', '').trim();
	var paProdPrice = replaceAll(parProdPrice, ',', '') * 1;
	
	// 수량값 담음
	el.closest('tr').find("#orderQty").val(parOrderQty - 1);
	var resultQty = el.closest('tr').find("#orderQty").val() * 1;
	
	// 주문금액 담음
	el.closest('tr').find("#orderPrice").val('₩   '+(resultQty * paProdPrice).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));

	if(el.closest('tr').find("#orderQty").val() < 0){
		alert("1개 이상부터 주문할 수 있습니다.")
	}
}  


// 제품검색
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
			let prodOrderList = resp.prodOrder.dataList;
			
			let trTags =[];
			if(prodOrderList && prodOrderList.length>0){ 
					$(prodOrderList).each(function(index, prodOrder){ 
						trTags.push(makeSingleTr(index, prodOrder));
					});  
			} else{        
				let trTag = $("<tr>").html(
						$("<td>").attr("colspan","6")
								 .html("등록된 제품 없음.")
					);
				trTags.push(trTag);                                                       
			}
			listBody.html(trTags);
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

// search 숨기기
$("#example2_filter").hide();
	
// 형변환
function replaceAll(str, searchStr, replaceStr) {
   return str.split(searchStr).join(replaceStr);
}