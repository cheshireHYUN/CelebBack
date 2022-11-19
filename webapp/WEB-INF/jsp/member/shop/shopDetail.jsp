<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="false" %>   
	<main>
	    <div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
	        <div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
	            <div class="container">
	                <div class="row justify-content-center">
	                    <div class="col-xl-9 col-lg-10 col-md-8">
	                        <h1>Menu</h1>
	                        <p>Cooking delicious and tasty food since 2005</p>
	                    </div>
	                </div>
	                <!-- /row -->
	            </div>
	        </div>
	        <div class="frame white"></div>
	    </div>
	    <!-- /hero_single -->

	    <div class="pattern_2">
	        <div class="container margin_60_40" data-cue="slideInUp">
	          <div class="tabs_menu add_bottom_25">
				    <ul class="nav nav-tabs" role="tablist">
				        <li class="nav-item">
				            <a id="tab-A" href="#pane-A" class="nav-link active" data-bs-toggle="tab" role="tab">Appetizer</a>
				        </li>
				        <li class="nav-item">
				            <a id="tab-B" href="#pane-B" class="nav-link" data-bs-toggle="tab" role="tab">Main Dishes</a>
				        </li>
				         <li class="nav-item">
				            <a id="tab-C" href="#pane-C" class="nav-link" data-bs-toggle="tab" role="tab">Desserts</a>
				        </li>
				    </ul>
				    <div class="tab-content add_bottom_25" role="tablist">
				    
				        <div id="pane-A" class="card tab-pane fade show active" role="tabpanel" aria-labelledby="tab-A">
				            <div class="card-header" role="tab" id="heading-A">
				                <h5>
				                    <a class="collapsed" data-bs-toggle="collapse" href="#collapse-A" aria-expanded="true" aria-controls="collapse-A">
				                        Appetizer
				                    </a>
				                </h5>
				            </div>
				            
				            <div id="collapse-A" class="collapse" role="tabpanel" aria-labelledby="heading-A">
				                <div class="card-body">
				                	<div class="banner lazy" data-bg="url(${cPath}/resources/restaurant/img/daymenu/menu_banners.jpg)">
							            <div class="wrapper d-flex align-items-center justify-content-between opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
							                <div>
							                   <small>셀럽백의 시그니처</small>
							                    <h3>Appetizer</h3>
							                    <p>셀럽백에서만 맛볼수있는 에피타이저로 식욕을 돋우세요!</p>
							                    <a href="reservations.html" class="btn_1">Reserve now</a>
							                </div>
							                <figure class="d-none d-lg-block"><img src="${cPath}/resources/restaurant/img/banner.svg" alt="" width="200" height="200" class="img-fluid"></figure>
							            </div>
							            <!-- /wrapper -->
							        </div>
							        <!-- /banner -->
							        
				                	<div class="row magnific-gallery add_top_30">
				                	
							        <c:forEach items="${appetizerList}" var="MenuVO">
							            <div class="col-lg-6">
							                <div class="menu_item">
							                    <figure>
							                        <a href="img/menu_items/large/1.jpg" title="Soft shell crab" data-effect="mfp-zoom-in">
							                        	<img src="${cPath}${MenuVO.menuThumbImg}" class="lazy" alt="">
							                        </a>
							                    </figure>
							                    <div class="menu_title">
							                         <h3>${MenuVO.menuName}</h3><em>&#8361; <fmt:formatNumber value="${MenuVO.menuPrice}" pattern="#,###" />  </em>
							                    </div>
							                    <p>${MenuVO.menuText}</p>
							                </div>
							            </div>
									</c:forEach>

							        </div>
							        <!-- /row -->
				                </div>
				                <!-- /card-body -->
				            </div>
				        </div>
				        
				        
				        
				        
				        <!-- /tab -->
				        <div id="pane-B" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-B">
				            <div class="card-header" role="tab" id="heading-B">
				                <h5>
				                    <a class="collapsed" data-bs-toggle="collapse" href="#collapse-B" aria-expanded="false" aria-controls="collapse-B">
				                        Main Dishes
				                    </a>
				                </h5>
				            </div>
				            <div id="collapse-B" class="collapse" role="tabpanel" aria-labelledby="heading-B">
				                <div class="card-body">
				                	<div class="banner lazy" data-bg="url(${cPath}/resources/restaurant/img/daymenu/menu_banners2.jpg)">
							            <div class="wrapper d-flex align-items-center justify-content-between opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">
							                <div>
							                    <small>셀럽백의 메인 시그니처</small>
							                    <h3>Main Dishes</h3>
							                    <p>신선한 재료와 엄선한 레시피로, 한번 먹으면 빠져들수밖에 없는 메인요리</p>
							                    <a href="reservations.html" class="btn_1">Reserve now</a>
							                </div>
							                <figure class="d-none d-lg-block"><img src="${cPath}/resources/restaurant/img/banner.svg" alt="" width="200" height="200" class="img-fluid"></figure>
							            </div>
							            <!-- /wrapper -->
							        </div>
							        <!-- /banner -->
				                	<div class="row magnific-gallery add_top_30">
							            
							            
							        <c:forEach items="${mainList}" var="MenuVO">
							            <div class="col-lg-6">
							                <div class="menu_item">
							                    <figure>
							                        <a href="img/menu_items/large/1.jpg" title="Soft shell crab" data-effect="mfp-zoom-in">
							                        	<img src="${cPath}${MenuVO.menuThumbImg}" class="lazy" alt="">
							                        </a>
							                    </figure>
							                    <div class="menu_title">
							                        <h3>${MenuVO.menuName}</h3><em>&#8361; <fmt:formatNumber value="${MenuVO.menuPrice}" pattern="#,###" />  </em>
							                    </div>
							                    <p>${MenuVO.menuText}</p>
							                </div>
							            </div>
									</c:forEach>
							            
							            
							        </div>
							        <!-- /row -->
				                </div>
				            </div>
				        </div>
				        <!-- /tab -->
				        <div id="pane-C" class="card tab-pane fade" role="tabpanel" aria-labelledby="tab-C">
				            <div class="card-header" role="tab" id="heading-C">
				                <h5>
				                    <a class="collapsed" data-bs-toggle="collapse" href="#collapse-C" aria-expanded="false" aria-controls="collapse-C">
				                        Desserts and Drinks
				                    </a>
				                </h5>
				            </div>
				            <div id="collapse-C" class="collapse" role="tabpanel" aria-labelledby="heading-C">
				                <div class="card-body">
				                	<div class="banner lazy" data-bg="url(${cPath}/resources/restaurant/img/daymenu/menu_banners3.jpg)">
							            <div class="wrapper d-flex align-items-center justify-content-between opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.5)">
							                <div>
							                	<small>식사시간을 더욱 즐겁게 만들어줄</small>
							                    <h3>Desserts and Drinks</h3>
							                    <p>아이들부터 어른들까지 함께 즐길수있는 디저트를 제공합니다</p>
							                    <a href="reservations.html" class="btn_1">Reserve now</a>
							                </div>
							                <figure class="d-none d-lg-block"><img src="${cPath}/resources/restaurant/img/banner.svg" alt="" width="200" height="200" class="img-fluid"></figure>
							            </div>
							            <!-- /wrapper -->
							        </div>
							        <!-- /banner -->
				                	<div class="row magnific-gallery add_top_30">

							            
							        <c:forEach items="${dessertList}" var="MenuVO">
							            <div class="col-lg-6">
							                <div class="menu_item">
							                    <figure>
							                        <a href="img/menu_items/large/1.jpg" title="Soft shell crab" data-effect="mfp-zoom-in">
							                        	<img src="${cPath}${MenuVO.menuThumbImg}" class="lazy" alt="">
							                        </a>
							                    </figure>
							                    <div class="menu_title">

							                          <h3>${MenuVO.menuName}</h3><em>&#8361; <fmt:formatNumber value="${MenuVO.menuPrice}" pattern="#,###" />  </em>
							                    </div>
							                    <p>${MenuVO.menuText}</p>
							                </div>
							            </div>
									</c:forEach>
							        
							        
							        </div>
							        <!-- /row -->
				                </div>
				            </div>
				        </div>
				        <!-- /tab -->
				    </div>
				    <!-- /tab-content -->
			  </div>
			  <!-- /tabs_menu-->

	            <p class="text-center"><a href="/CelebBack/reserve/info/${franId}" class="btn_1 outline">RESERVE</a></p>
	        </div>
	        <!-- /container -->
	    </div>
	    <!-- /pattern -->

	</main>
	<!-- /main -->

	<footer>
	    <div class="frame black"></div>
	    <div class="container">
	        <div class="row">
	            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
	                <div class="footer_wp">
	                    <i class="icon_pin_alt"></i>
	                    <h3>Address</h3>
	                    <p>97845 Baker st. 567<br>Los Angeles - US</p>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
	                <div class="footer_wp">
	                    <i class="icon_tag_alt"></i>
	                    <h3>Reservations</h3>
	                    <p><a href="tel:009442323221">+94 423-23-221</a><br><a href="#0">reservations@Foores.com</a></p>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
	                <div class="footer_wp">
	                    <i class="icon_clock_alt"></i>
	                    <h3>Opening Hours</h3>
	                    <ul>
	                        <li>Mon - Sat: 10am - 11pm</li>
	                        <li>Sunday: Closed</li>
	                    </ul>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
	                <h3>Keep in touch</h3>
	                <div id="newsletter">
	                    <div id="message-newsletter"></div>
	                    <form method="post" action="phpmailer/newsletter_template_email.php" name="newsletter_form" id="newsletter_form">
	                        <div class="form-group">
	                            <input type="email" name="email_newsletter" id="email_newsletter" class="form-control" placeholder="Your email">
	                            <button type="submit" id="submit-newsletter"><i class="arrow_carrot-right"></i></button>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	        <!-- /row-->
	        <hr>
	        <div class="row">
	            <div class="col-sm-5">
	                <p class="copy">© Foores Restaurant - All rights reserved</p>
	            </div>
	            <div class="col-sm-7">
	                <div class="follow_us">
	                    <ul>
	                        <li><a href="#0"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="${cPath}/resources/restaurant/img/twitter_icon.svg" alt="" class="lazy"></a></li>
	                        <li><a href="#0"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="${cPath}/resources/restaurant/img/facebook_icon.svg" alt="" class="lazy"></a></li>
	                        <li><a href="#0"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="${cPath}/resources/restaurant/img/instagram_icon.svg" alt="" class="lazy"></a></li>
	                        <li><a href="#0"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="${cPath}/resources/restaurant/img/youtube_icon.svg" alt="" class="lazy"></a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <p class="text-center"></p>
	    </div>
	</footer>
	<!--/footer-->

	<div id="toTop"></div><!-- Back to top button -->
		
	<!-- COMMON SCRIPTS -->
    <script src="js/common_scripts.min.js"></script>
    <script src="js/common_func.js"></script>
    <script src="phpmailer/validate.js"></script>

</body>