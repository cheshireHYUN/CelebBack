<%--
* [[ê°ì ì´ë ¥(Modification Information)]]
* ìì ì¼       ìì ì      ìì ë´ì©
* ----------  ---------  -----------------
* 2022. 8. 4.      í©ë¨ë¹      ìµì´ìì±
* 2022. 8. 8.      ìì¬ì     footer ì­ì 
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<!-- 	<div id="preloader"> -->
<!-- 		<div data-loader="circle-side"></div> -->
<!-- 	</div>/Page Preload -->
   <script>
		$.CPATH = "${cPath}";
	</script>			
	<main>
		<div id="carousel-home">
			<div class="owl-carousel owl-theme">
				<div class="owl-slide cover lazy" data-bg="url(${cPath }/resources/restaurant/img/slides/celebback_slides_1.jpg)">
					<div class="opacity-mask d-flex align-items-center" data-opacity-mask="rgba(0, 0, 0, 0.5)">
						<div class="container">
							<div class="row justify-content-center justify-content-md-end">
								<div class="col-lg-6 static">
									<div class="slide-text text-end white">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/owl-slide-->
				<div class="owl-slide cover lazy" data-bg="url(${cPath }/resources/restaurant/img/slides/celebback_slides_2.jpg)">
					<div class="opacity-mask d-flex align-items-center" data-opacity-mask="rgba(0, 0, 0, 0.5)">
						<div class="container">
							<div class="row justify-content-center justify-content-md-start">
								<div class="col-lg-6 static">
									<div class="slide-text white">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/owl-slide-->				
				<div class="owl-slide cover lazy" data-bg="url(${cPath }/resources/restaurant/img/slides/celebback_slides_3.jpg)">
					<div class="opacity-mask d-flex align-items-center" data-opacity-mask="rgba(0, 0, 0, 0.6)">
						<div class="container">
							<div class="row justify-content-center justify-content-md-start">
								<div class="col-lg-12 static">
									<div class="slide-text text-center white">
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/owl-slide-->
				</div>
			</div>
			<div id="icon_drag_mobile"></div>
		</div>
		<!--/carousel-->

		<ul id="banners_grid" class="clearfix">
			<li>
				<a href="" class="img_container">
					<img src="img/banners_cat_placeholder.jpg" data-src="${cPath }/resources/restaurant/img/banner001.jpg" alt="" class="lazy">
					<div class="short_info opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">
						<h3>메뉴</h3>
						<h6 style="color:white;">Menu</h6>
					</div>
				</a>
			</li>
			<li>
				<a href="" class="img_container">
					<img src="img/banners_cat_placeholder.jpg" data-src="${cPath }/resources/restaurant/img/banner002.jpg" alt="" class="lazy">
					<div class="short_info opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">
						<h3>매장예약</h3>
						<h6 style="color:white;">Reservation</h6>
					</div>
				</a>
			</li>
			<li>
				<a href="" class="img_container">
					<img src="img/banners_cat_placeholder.jpg" data-src="${cPath }/resources/restaurant/img/banner003.jpg" alt="" class="lazy">
					<div class="short_info opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">
						<h3>셀럽백 혜택</h3>
						<h6 style="color:white;">MEMBERSHIP</h6>
					</div>
				</a>
			</li>
		</ul>
		<!--/banners_grid -->
	</main>
	<!-- /main -->
	<br>
</html>
