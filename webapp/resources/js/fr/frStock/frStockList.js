// 재고 수정
$('#updateButton').on('click', function() {
    $('.stockQty').attr('disabled', false);
    $('#saveButton').attr('disabled', false);
    $('.plusBtn').attr('disabled', false);
    $('.minBtn').attr('disabled', false);
});

// 재고조회
let listBody = $('#listBody');
let searchUI = $("#searchUI");

let makeSingleTr = function(index, frStock){
	
	var stockColor;
	if(frStock.atOrderQty >= frStock.frStockQty){
		stockColor = "color:red;";
	}else{
		stockColor = "color:black;";
	}
	
 return $('<tr>').append(
	        	$("<td>").html(frStock.buyerProdId)
	        	,$("<td>").html(frStock.buyerProdName)
	        		.attr({
		        		"class" : "cb-tAlign-left"
		        		, "style" : "width:260px;"
		        	})
	        	,$("<td>").html("₩ "+frStock.buyerProdPrice)
		        	.attr({
		        		"class" : "cb-tAlign-right"
		        		, "style" : "width:150px;"
		        	})
		        ,$("<td>").html(frStock.atOrderQty)
		        ,$("<td>").append(
	        			$("<div>").append(
							$("<input>").attr({
								 "type" : "text"
								 , "id" : "stockQty"
								 , "value" : frStock.frStockQty
								 , "class" : "stockQty cb-tAlign-center"
								 , "style" : stockColor + "width:100px; margin-left:-10px; float:left;"
								 , "disabled" : "disabled"
								 , "onkeyup" : "stockKeyUp($(this))"
					 		})
					 	,
	        			$("<div>").append(
								$("<input>").attr({
									 "type" : "button"
									 , "style" : "padding:2px; margin-top:3px;"
									 , "class" : "plusBtn btn btn-square btn-primary"
									 , "value" : " + "
									 , "disabled" : "disabled"
									 , "onclick" : "plusClick($(this))"
								 })
								,$("<input>").attr({
									 "type" : "button"
									 , "style" : "padding:2px; margin-top:3px; margin-left:2px;"
									 , "class" : "minBtn btn btn-square btn-primary"
									 , "value" : " - "
									 , "disabled" : "disabled"
									 , "onclick" : "minusClick($(this))"
								 })
						)
					)
				).attr({
					"style" : "width:200px;"
				})
				,$("<td>").html(frStock.monFranInQty)
				,$("<td>").html(frStock.allFranInQty)
				,$("<td>").html(frStock.monFranOutQty)
	        	,$("<td>").html(frStock.allFranOutQty)
	        	
        	)
}

// 수량입력
function stockKeyUp(el) {
	var stockQty = el.val();
	
}

$('#saveButton').on('click', function() {
	  
	var trTag =[];
	$(".stockQty").each(function(index, stock){ 
		trTag.push($(stock).val());
	}); 

	var param = {
				"trTag" : trTag
				};
	
	let url = this.action;
    $.ajax({ 
		url : "/CelebBack/fr/frStock/updateFrStock",
		data : JSON.stringify(param),
		type : 'post',
		headers: {'Content-Type': 'application/json'},
		dataType : "text" 
		,
		
		beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
		
		success : function(resp, status, jqXHR) { 
			let qtyUpdate = resp.atOrder;
			$(".stockQty").attr('disabled', true);
			swal({
				  title: "재고 수정완료",
				  icon: "success",
				  button: "확인",
			}).then((value) => {
				if(value) { 
					location.href='/CelebBack/fr/frStock';
				}
			});
			
		
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
    
});


//+수량버튼
function plusClick(el){
	var stockQty = el.closest('tr').find('#stockQty').val();
	el.closest('tr').find("#stockQty").val(parseInt(stockQty) + 1);
	
}  
	
//-수량버튼
function minusClick(el){
	var stockQty = el.closest('tr').find('#stockQty').val();
	el.closest('tr').find("#stockQty").val(parseInt(stockQty) - 1);
}  

// 검색버튼
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
			let frStockList = resp.frStock.dataList;
			
			let trTags =[];
			if(frStockList && frStockList.length>0){ 
					$(frStockList).each(function(index, frStock){ 
						trTags.push(makeSingleTr(index, frStock));
					});  
			} else{        
				let trTag = $("<tr>").html(
						$("<td>").attr("colspan","9")
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