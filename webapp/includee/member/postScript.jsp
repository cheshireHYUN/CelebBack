<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 4.      황단비      최초작성
* 2022. 8. 8.      서재원     footer 코드 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
	<footer>
	    <div class="frame black"></div>
	    <div class="container">
	        <div class="row">
	            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
	                <div class="footer_wp">
	                    <i class="icon_pin_alt"></i>
	                    <h3>주소</h3>
	                    <p>대전광역시 중구 계룡로 846, 3-4층<br>대표이사 : 서재원</p>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
	                <div class="footer_wp">
	                    <i class="icon_tag_alt"></i>
	                    <h3>창업문의</h3>
	                    <p>상담번호 : 1577-1004<br>이메일 : luvBack@naver.com<br></p>
	                </div>
	            </div>
	            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
	                <div class="footer_wp">
	                    <i class="icon_clock_alt"></i>
	                    <h3>영업시간</h3>
	                    <ul>
	                        <li>매일 : 11:00 - 22:00</li>
	                        <li>브레이크타임 : 15:00 - 17:00</li>
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
	                <p class="copy">© CelebBack SteakHouse - All rights reserved</p>
	            </div>
	            <div class="col-sm-7">
	                <div class="follow_us">
	                    <ul>
	                        <li><a href="#0"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="${cPath }/resources/restaurant/img/twitter_icon.svg" alt="" class="lazy"></a></li>
	                        <li><a href="#0"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="${cPath }/resources/restaurant/img/facebook_icon.svg" alt="" class="lazy"></a></li>
	                        <li><a href="#0"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="${cPath }/resources/restaurant/img/instagram_icon.svg" alt="" class="lazy"></a></li>
	                        <li><a href="#0"><img src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" data-src="${cPath }/resources/restaurant/img/youtube_icon.svg" alt="" class="lazy"></a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <p class="text-center"></p>
	    </div>
	</footer>
	<!--/footer-->  
  
  
  
<!-- COMMON SCRIPTS -->
    <script src="${cPath }/resources/restaurant/js/common_scripts.min.js"></script>
    <script src="${cPath }/resources/restaurant/js/slider.js"></script>
    <script src="${cPath }/resources/restaurant/js/common_func.js"></script>
    <script src="${cPath }/resources/restaurant/phpmailer/validate.js"></script>

    <!-- SPECIFIC SCRIPTS (wizard form) -->
    <script src="${cPath }/resources/restaurant/js/wizard/wizard_scripts.min.js"></script>
    <script src="${cPath }/resources/restaurant/js/wizard/wizard_func.js"></script>
    
    <script src="${cPath }/resources/restaurant/js/typed.min.js"></script>
	<script>
	   var typed = new Typed('.element', {
	     strings: ["Our food with your happiness", "Enjoy our meal!", "Thank you for your smile"],
	     startDelay: 10,
	     loop: true,
	     backDelay: 2000,
	     typeSpeed: 50
	   });
	</script>