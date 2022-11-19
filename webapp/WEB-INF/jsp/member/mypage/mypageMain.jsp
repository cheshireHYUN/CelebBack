<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 17.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

		<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>마이페이지</h1>
							<p><span class="element"></span></p>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="frame white"></div>
		</div>
		<!-- /hero_single -->
		

		<div class="bg_gray">
			<div class="container margin_60_40" style="padding-bottom: 0;">
				<div class="box_contacts">
					<div>
			            <h2 style="margin: 10px 0 20px 0;"><strong>${mem.memName }</strong>님 환영합니다!</h2>
			            	나의 등급은 <strong style="color: red;">${mem.memGrade }</strong>입니다.
		            </div>
		        </div>
			</div>
			

			
			
		    <div class="container margin_60_40" style="padding-top: 0;">
		        <div class="row justify-content-center">
		            <div class="col-lg-4">
		                <div class="box_contacts" onclick="location.href='${cPath }/mypage/account'" style="cursor: pointer">
		                	<i class="icon_id"></i>
		                    <h2>개인정보 수정</h2>
		                    <small>- <a>My Account</a> -</small>
		                </div>
		            </div>
		            <div class="col-lg-4">
		                <div class="box_contacts" onclick="location.href='${cPath }/mypage/wish'" style="cursor: pointer">
		                	<i class="icon_heart_alt"></i>
		                    <h2>찜</h2>
		                    <small>- <a>Wish List</a> -</small>
		                </div>
		            </div>
		            <div class="col-lg-4">
		                <div class="box_contacts" onclick="location.href='${cPath }/mypage/reserve'" style="cursor: pointer">
		                	<i class="icon_calendar"></i>
		                    <h2>예약 내역 조회 및 취소</h2>
		                    <small>- <a>Reserve List</a> -</small>
		                </div>
		            </div>
		            <div class="col-lg-4">
		                <div class="box_contacts" onclick="location.href='${cPath }/mypage/stamp'" style="cursor: pointer">
		                	<i class="icon_check_alt2"></i>
		                    <h2>스탬프</h2>
		                    <small>- <a>Stamp List</a> -</small>
		                </div>
		            </div>
		            <div class="col-lg-4">
		                <div class="box_contacts" onclick="location.href='${cPath }/mypage/mycoupon'" style="cursor: pointer">
		                	<i class="icon_gift_alt"></i>
		                    <h2>마이쿠폰</h2>
		                    <small>- <a>My Coupon List</a> -</small>
		                </div>
		            </div>
		            <div class="col-lg-4">
		                <div class="box_contacts" onclick="location.href='${cPath }/mypage/review'" style="cursor: pointer">
		                	<i class="icon_like"></i>
		                    <h2>내가 쓴 리뷰</h2>
		                    <small>- <a>My Review</a> -</small>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>