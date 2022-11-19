let CPATH = $.CPATH;
let listBody = $('#listBody');
let searchUI = $("#searchUI");
let pagingArea = $('.pagingArea');
let totalRecord = $('#totalRecord');

// 오늘예약내역 모달 
$("[data-bs-target='#todayModal']").on("click",function(){
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	document.getElementById("todayTitle").innerHTML = dateString;
});

// 예약내역조회 
let makeSingleTr = function(index, frResv){
	
	var todayColor;
	if(frResv.lguName == '예약확정'){
		todayColor = "color:red";
	} 
	
	var resultNote;
	if( !resultNote ){
		resultNote = "-";
	}else{
		resultNote = frResv.resvNote;
	}
	
 return $('<tr>').append(
	        	$("<td>").html(frResv.resvId)
	        		.attr({
                       "id" : frResv.resvId,
                       "name" : "resvId",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#detailModal",
                       "onclick" : "detailClick(this)"
                    })
	        	,$("<td>").html(frResv.resvDate)
	        		.attr({
                       "id" : frResv.resvId,
                       "name" : "resvId",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#detailModal",
                       "onclick" : "detailClick(this)"
                    })
	        	,$("<td>").html(frResv.resvTime)
	        		.attr({
                       "id" : frResv.resvId,
                       "name" : "resvId",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#detailModal",
                       "onclick" : "detailClick(this)"
                    })
	        	,$("<td>").html(frResv.resvPcnt)
	        		.attr({
                       "id" : frResv.resvId,
                       "name" : "resvId",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#detailModal",
                       "onclick" : "detailClick(this)"
                    })
	        	,$("<td>").html(frResv.sitId)
	        		.attr({
                       "id" : frResv.resvId,
                       "name" : "resvId",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#detailModal",
                       "onclick" : "detailClick(this)"
                    })
	        	,$("<td>").html(frResv.lguName)
	        		.attr({
                       "id" : frResv.resvId,
                       "name" : "resvId",
                       "style" : todayColor,
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#detailModal",
                       "onclick" : "detailClick(this)"
                    })
	        	,$("<td>").html(resultNote)
	        		.attr({
                       "id" : frResv.resvId,
                       "name" : "resvId",
                       "data-bs-toggle" : "modal",
                       "data-bs-target" : "#detailModal",
                       "onclick" : "detailClick(this)"
                    })
	        	)
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
		let frResvList = resp.frResv.dataList;
			console.log(resp.frResv);
			
			let trTags =[];
			if(frResvList && frResvList.length>0){ 
					$(frResvList).each(function(index, frResv){ 
						trTags.push(makeSingleTr(index, frResv));
					});  
			} else{        
				let trTag = $("<tr>").html(
						$("<td>").attr("colspan","7")
								 .html("등록된 예약내역이 없습니다.")
					);
				trTags.push(trTag);                                                       
			}
			listBody.html(trTags);
			pagingArea.html(resp.frResv.pagingHTMLBS);   
			totalRecord.html("<strong> 검색결과 " +resp.frResv.totalRecord+" 건 </strong>");
		},

		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return false;
}).submit();

// 검색조회 클릭이벤트 
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

// 페이징 
$('.pagingArea').on('click','a',function(event){
   let page = $(this).data("page"); 
   searchForm.find("[name=page]").val(page);
   searchForm.submit();
});