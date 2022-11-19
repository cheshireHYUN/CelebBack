<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      최서현      최초작성
* 2022. 8. 8.      서재원     footer 삭제
* 2022. 8. 31.     정아영     div onclick 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- SPECIFIC CSS -->
<link href="${cPath }/resources/restaurant/css/shop.css"
	rel="stylesheet">
<!-- YOUR CUSTOM CSS -->
<link href="${cPath }/resources/restaurant/css/custom.css"
	rel="stylesheet">

</head>

<body>
	<main>
	<div class="hero_single inner_pages background-image"
		data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
		<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-9 col-lg-10 col-md-8">
						<h1>셀럽백 매장</h1>
						<p>
							<span class="element"></span>
						</p>
					</div>
				</div>
				<!-- /row -->
			</div>
		</div>
		<div class="frame white"></div>
	</div>
	<!-- /hero_single --> <!-- 		<div class="filters_full clearfix"> --> <!-- 		    <div class="container"> -->
	<%-- 		    	<div class="count_results">${cntShopList} Results</div> --%>
	<!-- 		    	<a href="#0" class="open_filters btn_filters"><i class="icon_adjust-vert"></i></a> -->
	<!-- 		        <div class="sort_select"> --> <!-- 		            <select name="sort" id="sort"> -->
	<!-- 		                <option value="popularity" selected="selected">Sort by Popularity</option> -->
	<!-- 		                <option value="rating">Sort by Average rating</option> -->
	<!-- 		                <option value="date">Sort by newness</option> -->
	<!-- 		                <option value="price">Sort by Price: low to high</option> -->
	<!-- 		                <option value="price-desc">Sort by Price: high to low</option> -->
	<!-- 		            </select> --> <!-- 		        </div> --> <!-- 		    </div> -->
	<!-- 		</div> --> <!-- /filters_full -->

	<div class="container margin_60_40">

		<div class="row">
			<aside class="col-lg-3" id="sidebar_fixed">
				<div class="filter_col">
					<div class="inner_bt">
						<a href="#" class="open_filters"><i class="icon_close"></i></a>
					</div>

					<!-- /filter_type -->
					<div class="filter_type version_2">
						<h4>
							<a href="#filter_2" data-bs-toggle="collapse" class="opened">별점</a>
						</h4>
						<div class="collapse show" id="filter_2">
							<ul>
								<li><label class="container_check">최고에요! 5<small></small>
										<input type="checkbox"> <span class="checkmark"></span>
								</label></li>
								<li><label class="container_check">좋아요! 4+<small></small>
										<input type="checkbox"> <span class="checkmark"></span>
								</label></li>
								<li><label class="container_check">아쉽지만 또 올게요! 3+<small></small>
										<input type="checkbox"> <span class="checkmark"></span>
								</label></li>
							</ul>
						</div>
					</div>

					<!-- /filter_type -->
					<div class="buttons">
						<a href="#0" class="btn_1">검색하기</a> <a href="#0"
							class="btn_1 gray">되돌리기</a>
					</div>
				</div>
			</aside>
			<!-- /col -->




			<div id="realBody" class="col-lg-9"></div>
			<!-- /row_item -->
			<div id="btngroup" class="pagination_fg add_bottom_15"
				data-cue="slideInUp"></div>




			<c:forEach items="${wishList }" var="wishFran">

			</c:forEach>



			<!-- /col -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container --> </main>
	<!-- /main -->


	<div id="toTop"></div>
	<!-- Back to top button -->

	<!-- COMMON SCRIPTS -->
	<script src="${cPath }/resources/restaurant/js/common_scripts.min.js"></script>
	<script src="${cPath }/resources/restaurant/js/common_func.js"></script>
	<script src="${cPath }/resources/restaurant/phpmailer/validate.js"></script>

	<!-- SPECIFIC SCRIPTS -->
	<script src="${cPath }/resources/restaurant/js/specific_shop.js"></script>
	<script src="${cPath }/resources/restaurant/js/sticky_sidebar.min.js"></script>


	<script>
	
	var header = '${_csrf.headerName}';
	var token = '${_csrf.token}';
	
	var totalPage = 0;
	$(document).ready(function() {
		
		// 총 페이지갯수 불러오는 AJAX by서현
		$.ajax({
			type : 'get',
			url : '${cPath}/shop/listbar',
			dataType : 'text',
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				drawBar(result); 
				totalPage = result;
				$('#num1').click(); // 맨 처음 접속시 1페이지를 클릭한 화면을 보이게함
			}
		});
	
	});
	
	// 페이지bar를 그리는 메소드, 총 페이지갯수를 파라미터로 갖는다 by서현
	function drawBar(totalPage) {
		bar(0, totalPage);
	}
	
	// 총페이지와 마지막페이지를 파라미터로 갖고 첫화면의 페이지바를 그려주는 메소드 by서현
	function bar(lastPageNum, totalPage) {
		var pageBtn = '';
	
		// total페이지가 5이상이하인지로 나눠서 첫페이지 처리
		
		// total페이지가 5보다 작아서 페이지바가 다음으로 이동할 수 없을때,
		if (totalPage <= 5) {
			for (var i = (lastPageNum + 1); i <= totalPage; i++) {
				pageBtn += "<a id='num"+i+"' class='num' >" + i + "</a>"
			}
			$('#btngroup').append(
					"<a id='leftGo'>&laquo;</a>" + pageBtn
							+ "<a id='rightGo'>&raquo;</a>");
	
		} else {
			// total페이지가 5보다 커서 페이지바가 다음으로 이동할 수 있을때,
			
			// totalPage - 직전페이지가 5 초과일때, ex)total이 100이고 5페이지에서 다음페이지로 이동했을때 
			if (totalPage - lastPageNum > 5) {
				for (var i = (lastPageNum + 1); i <= lastPageNum + 5; i++) {
					pageBtn += "<a id='num"+i+"' class='num' >" + i
							+ "</a>"
				}
			} else {
				// totalPage - 직전페이지가 5 이하일때, ex)total이 10이고 5페이지에서 다음페이지로 이동했을때 
				for (var i = (Number(lastPageNum) + 1); i <= Number(totalPage); i++) {
					pageBtn += "<a id='num"+i+"' class='num' >" + i
							+ "</a>"
				}
			}
	
			$('#btngroup').empty();
			$('#btngroup').append(
					"<a id='leftGo'>&laquo;</a>" + pageBtn
							+ "<a id='rightGo'>&raquo;</a>");
		}
	
	}
	

	
	// 왼쪽버튼 눌렀을때 실행되는 메소드 by서현
	$(document).on('click', "#leftGo", function() {
		var k = ($('.num').text()[0]);
		if (k == '1') {
			alert("첫번째 페이지입니다.");
		} else {
			// 이전페이지 존재할때 -> 넘겨준다
			bar(k - 6, totalPage);
			$('#num' + (k - 1)).click();
		}
	
	})
	
	// 오른쪽버튼 눌렀을때 실행되는 메소드  by서현
	$(document).on('click', "#rightGo", function() {
		// 마지막 페이지일경우
		var lastIndex = 0;
		$('.num').each(function() {
			lastIndex = $(this).text();
		});
		if (lastIndex == totalPage) {
			alert("마지막 페이지입니다.");
		} else {
			bar(lastIndex, totalPage);
			$('#num' + ((Number(lastIndex)) + 1)).click();
		}
	})
	
	// 각 페이지번호를 눌렀을때 실행되는 메소드 by서현
	$(document).on('click', '.num', function(e) {
		// bar 전환
		$('.num').removeClass('active');
		$(e.target).addClass('active');
	
		var startNum = 4 * (Number(e.target.text) - 1);
		var endNum = 4 * Number(e.target.text);
	
		// 화면 그리기
		$.ajax({
			type : 'post',
			url : '${cPath}/shop/list',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			data : JSON.stringify({
				startNum : startNum,
				endNum : endNum
			}),
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				drawFran(result);
			}
		});
	})
	
	$(document).on('click', ".wish", function(e) {
		var imgSrc = "";
		var substrSrc = "";
		var replaceSrc = "";
	
		var franId = "";
		franId = e.target.dataset.value;
	
		imgSrc = $(this).attr("src");
		substrSrc = imgSrc.substr(42);
		console.log(substrSrc);
	
		var on = "${cPath }/resources/restaurant/img/heart-on.png";
		var off = "${cPath }/resources/restaurant/img/heart-off.png"
	
		if (substrSrc == 'off.png') {
			replaceSrc = imgSrc.replace(imgSrc, on);
			$.ajax({
				type : 'post',
				url : '${cPath }/mypage/wish',
				dataType : 'html',
				contentType : 'application/json',
				data : JSON.stringify({
					status : 'on',
					franId : franId
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					console.log("성공!");
				}
			});
		} else if (substrSrc == 'on.png') {
			replaceSrc = imgSrc.replace(imgSrc, off);
			$.ajax({
				type : 'post',
				url : '${cPath }/mypage/wish',
				dataType : 'html',
				contentType : 'application/json',
				data : JSON.stringify({
					status : 'off',
					franId : franId
				}),
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(result) {
					console.log("성공!");
				}
			});
		}
	
		return $(this).attr("src", replaceSrc);
	
	});
	
	$(window)
			.on(
					'load',
					function() {
	
						let url = this.action;
						let method = this.method;
						let data = $(this).serialize();
	
						$
								.ajax({
									url : "${cPath }/shop/list",
									data : data,
									method : method,
									dataType : "json",
									success : function(resp, status, jqXHR) {
										let wishFran = resp.wishList;
										console.log(wishFran);
	
										if (wishFran && wishFran.length > 0) {
											$(wishFran)
													.each(
															function(index,
																	wish) {
																let wishFranId = wish.franId;
																let orgImgSrc = $(
																		".wish")
																		.attr(
																				"src");
																// 							let orgFranId = $(".wish").attr("id");
																console
																		.log(wishFranId);
	
																let test = $(
																		document)
																		.find(
																				"[id="
																						+ wishFranId
																						+ "]")
																		.attr(
																				"src");
																console
																		.log(test);
																return $(
																		document)
																		.find(
																				"[id="
																						+ wishFranId
																						+ "]")
																		.attr(
																				"src",
																				"${cPath }/resources/restaurant/img/heart-on.png");
															});
										}
	
									},
									error : function(jqXHR, status, error) {
										console.log(jqXHR);
										console.log(status);
										console.log(error);
									}
								});
	
						return false;
					}).load();
	
	function drawFran(result) {
		$('#realBody').empty();
		for (idx in result) {
			var franName = result[idx].franName;
			var hrefLink = "${cPath}/review/" + result[idx].franId
	
			$('#realBody')
					.append(
							'<div class="row row_item">'
									+ '<div class="col-sm-4" style="position: relative;">'
									+ '<figure>'
									+ '<span class="ribbon off" style="background-color: transparent;" id="wish'+idx+'">'
									+ '<img data-value="'+result[idx].franId+'" class="wish" id="'+result[idx].franId+'" alt="" src="${cPath }/resources/restaurant/img/heart-off.png" height="30px;">'
									+ '</span>'
									+ ' <a href="shop-single.html">'
									+ '<img class="img-fluid lazy" src="${cPath }/resources/restaurant/img/menu_items/emptyGotLogo.png" alt="x">'
									+ ' </a>'
									+ ' </figure>'
									+ ' </div>'
									+
	
									' <div class="col-sm-8"> '
									+ `<div class="rating" onclick="location.href='${cPath}/review/`+result[idx].franId+`'" style="cursor: pointer;">`
									+ result[idx].star
									+ '</div>'
									+
	
									' <div><a href="${cPath}/shop/detail/'+result[idx].franId+'"><h3>'
									+ result[idx].franName
									+ '</h3></a></div>'
									+
	
									'<p>'
									+ result[idx].franAdd1
									+ ' '
									+ result[idx].franAdd2
									+ '</br>'
									+ '  영업시간 : '
									+ result[idx].franSttime
									+ ' ~ '
									+ result[idx].franEntime
									+ '</br>'
									+ '  브레이크타임 : '
									+ result[idx].franBsttime
									+ ' ~ '
									+ result[idx].franBentime
									+ '</p>'
									+
	
									' <div class="price_box">'
									+ '<span class="new_price">영업중</span>'
									+ '</div>'
									+ ' <ul>'
									+ '  <li><a href="${cPath }/reserve/info/'+result[idx].franId+'" class="btn_1">Reserve</a></li>'
									+ '   <li><a href="${cPath }/frNotice/'+result[idx].franId+'" class="btn_1">Notice</a></li>'
									+ '</ul>'
									+ '</div>'
									+ '</div> '
									+ '</br></br>')
		}
	
	}
	</script>


</body>
</html>
