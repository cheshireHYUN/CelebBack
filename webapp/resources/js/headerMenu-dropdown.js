/**
 * 
 * </pre>
 * @author 정아영
 * @since 2022. 8. 20.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2022. 8. 20.      정아영        최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */

	
	
let notiContainer = $(".notifications");
let cifstrong = $(".cart_bt");
let remain = $("#remain");
let aTag = "";
let total = 0;
let totalNoti = 0;

//$(".notifications").prepend("<li><strong><span>1</span><span>2</span><span><strong>3</strong></span></strong></li>")

let notifications = function(index, noti) {
	return $("<li>").append(
				$("<strong>").append(
						$("<span>").html(noti.postDate),
						$("<span>").html(noti.franName),
						$("<span>").append(
							$("<strong>").append(
									$("<a href='"+aTag+"' style='color: black;' class='link'>").html(noti.postTitle)
							)
						)
				)
			);
};

let rm = function(index, remain) {
	return $("<div>").append("<h4>").attr("style", "margin: 15px 0 10px 0; background-color: antiquewhite;").html("<strong style='color: red;'>"+remain.franName+"</strong> 이용 <strong style='color: red;'>"+remain.remainDate+"</strong>일 전 입니다.");
}

$(".cart_bt").on("click", function (event) {
	event.preventDefault();
	let url = this.action;
	let method = this.method;
	let data = $(this).serialize();
//	console.log("header", url)
	$.ajax({
		url : url,
		data : data,
		method : method,
		dataType : "json"
		,
		  beforeSend : function(xhr)
		  {
		     xhr.setRequestHeader(header,token);
		  },
		success : function(resp, status, jqXHR) {
			let remainResv = resp.remain;
//			console.log(remainResv);
			let notiList = resp.noti;
//			console.log(notiList.length);
			let trTags = [];
			let cifTag = [];
			let rmTag = [];
			if(remainResv==null){
				console.log("없는데");
				console.log(window.location.href);
				var location = window.location.href;
				if(notiList && notiList.length>0){
						$(notiList).each(function(index, noti){ 
							if(location.includes(noti.franId+'/')){
								aTag = noti.frannoticeNo;
							}else if(location.includes(noti.franId)){
								aTag = noti.franId+"/"+noti.frannoticeNo;
							}else {
								aTag = "frNotice/"+noti.franId+"/"+noti.frannoticeNo;
							}
							trTags.push(notifications(index, noti));
							totalNoti = noti.totalNoti;
						});                                                                                                      
				}
			}else {
				console.log("있는데");
				console.log(window.location.href);
				var location = window.location.href;
				$(remainResv).each(function(index, remain){
					rmTag.push(rm(index, remain));
					total = 1;
					if(notiList && notiList.length>0){
							$(notiList).each(function(index, noti){ 
								if(location.indexOf(noti.franId+'/')>=0){
									aTag = noti.frannoticeNo;
								}else if(location.indexOf(noti.franId)>=0){
									aTag = noti.franId+"/"+noti.frannoticeNo;
								}else {
									aTag = "frNotice/"+noti.franId+"/"+noti.frannoticeNo;
								}
								trTags.push(notifications(index, noti));
								totalNoti = noti.totalNoti;
							});                                                                                                      
					}
				});
			}
			remain.html(rmTag);
			notiContainer.html(trTags);
			cifstrong.html($("<strong>").html(total+totalNoti));
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
	return false;
}).click();
