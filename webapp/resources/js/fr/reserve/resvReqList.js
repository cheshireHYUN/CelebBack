let CPATH = $.CPATH;

// 예약요청거절 
let rejectId = null;
function clickReject(target){
	rejectId=target.parentNode.id;
}

function rejectClick(target){
	console.log(rejectId)
	$('#rejectResvId').val(rejectId);
	
	let resvNote = $('textarea[name="resvNote"]').val();
	$('input[name="resvNote"]').val(resvNote);
	
	$('#rejectForm').submit();
};

// 예약요청수락
let acceptModal = $(document).on("click",'[data-bs-target="#acceptModal"]',function(){
	let resvId = this.parentNode.id;
	let url = CPATH+"/fr/reserve/acceptResv/"+resvId;

	$.ajax({
	      url : url,
	      method : 'post',
	      data : {
	    	  "resvId" : resvId
	      },
	      dataType : "json" 
	      ,
	      
	      beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
	      
	      success : function(resp, status, jqXHR) { 
	    	  swal({
				  title: "예약승인 완료",
				  icon: "success",
				  button: "확인",
			    }).then((value) => {
						if(value) { 
						 location.href='/CelebBack/fr/reserve/resvReq';
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

// 예약상세조회
let makeSingle = function(index, reqResvDetail){
	return $('<tr>').append(
              $("<td>").html(reqResvDetail.menuName)
              ,$("<td>").html(reqResvDetail.morderQty)
              ,$("<td>").html('₩ '+reqResvDetail.morderPrice)
            )
}

let reqDetailModal = $(document).on("click",'[data-bs-target="#reqDetailModal"]',function(){
	let resvId = this.parentNode.id;
	let url = CPATH+"/fr/reserve/resvReq/"+resvId;
   
   $.ajax({
	      url : url,
	      method : 'post',
	      data : {
	    	  "resvId" : resvId
	      },
	      dataType : "json" 
	      ,
	      
	      beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
	      
	      success : function(resp, status, jqXHR) { 
	         let reqDetailList = resp.reqResvDetail;
	         
	         let trTags =[];
	         if(reqDetailList && reqDetailList.length>0){ 
	               $(reqDetailList).each(function(index, reqResvDetail){ 
	                  trTags.push(makeSingle(index, reqResvDetail));
	               });  
	         } else{        
	            let trTag = $("<tr>").html(
	                  $("<td>").attr("colspan","6")
	                         .html("등록된 제품 없음.")
	               );
	            trTags.push(trTag);                                                       
	         }
	         reqDetailModal.find(".reqDetail").html(trTags);
	      },
	      error : function(jqXHR, status, error) {
	         console.log(jqXHR);
	         console.log(status);
	         console.log(error);
	      }
	   })
   
});  