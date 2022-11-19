// 수량입력
function totalKeyUp(el) {
	// el : 갯수를 입력한 input 요소 자체
	var prodPrice = replaceAll(el.closest('tr').find('#prodPrice').text(), '₩', '');
	var parProdPrice = replaceAll(prodPrice, ',', '').trim() * 1;
	var orderQty = el.val();
	
	var reOrderPrice = (parProdPrice * orderQty).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	var strOrderPrice = '₩     '+reOrderPrice;
	el.closest('tr').find('#orderPrice').val(strOrderPrice);
}

//+수량버튼
function plusClick(el){
	var atOrderQty = el.closest('tr').find('#atOrderQty').val();
	var prodPrice = replaceAll(el.closest('tr').find('#prodPrice').text(), '₩', '');
	var parProdPrice = replaceAll(prodPrice, ',', '').trim() * 1;
	var orderPrice = el.closest('tr').find('#orderPrice').val();
	var parAtOrderQty = parseInt(atOrderQty)
	
	el.closest('tr').find("#atOrderQty").val(parseInt(atOrderQty) + 1);
	var reOrderPrice = ($("#atOrderQty").val() * parProdPrice).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	var strOrderPrice = '₩     '+reOrderPrice;
	$("#orderPrice").val(strOrderPrice);
}  

//-수량버튼
function minusClick(el){
	var atOrderQty = el.closest('tr').find('#atOrderQty').val();
	var prodPrice = replaceAll(el.closest('tr').find('#prodPrice').text(), '₩', '');
	var parProdPrice = replaceAll(prodPrice, ',', '').trim() * 1;
	var orderPrice = el.closest('tr').find('#orderPrice').val();
	var parAtOrderQty = parseInt(atOrderQty)
	
	el.closest('tr').find("#atOrderQty").val(parseInt(atOrderQty) - 1);
	var reOrderPrice = ($("#atOrderQty").val() * parProdPrice).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	var strOrderPrice = '₩     '+reOrderPrice;
	$("#orderPrice").val(strOrderPrice);
}  

// 자동발주조회	
let url = this.action;
let method = this.method;
let data = $(this).serialize();

// 자동발주 수정
$('#updateButton').on('click', function() {
    $('.atOrderQty').attr('disabled', false);
    $('#saveButton').attr('disabled', false);
    $('.plusBtn').attr('disabled', false);
    $('.minBtn').attr('disabled', false);
});

$('#saveButton').on('click', function() {
	  
	var atOrderQty = $('.atOrderQty').val();
	
	var trTag =[];
	$(".atOrderQty").each(function(index, at){ 
		trTag.push($(at).val());
	}); 

	var param = {
				"trTag" : trTag
				};
	
    $.ajax({ 
		url : "/CelebBack/fr/atOrder/updateAtOrder",
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
			$(".atOrderQty").attr('disabled', true);
			swal({
				  title: "적정재고 수정완료",
				  icon: "success",
				  button: "확인",
			}).then((value) => {
				if(value) { 
					location.href='/CelebBack/fr/atOrder';
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
	
// search 숨기기
$("#example2_filter").hide();	

// 형변환
function replaceAll(str, searchStr, replaceStr) {
   return str.split(searchStr).join(replaceStr);
}