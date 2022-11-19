<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 30.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
			<div class="container margin_60_40">
				<div class="box_contacts">
					<div>
						<h2><strong>찜</strong></h2>
			            <br>
				        <div class="row" style="padding: 20px;" id="divBody">
							<c:forEach items="${wishList }" var="wishFran">
								<c:forEach items="${franInfoList }" var="franInfo">
									<c:if test="${wishFran.franId==franInfo.franId }">
										<div class='col-lg-4'>
											<div class='box_contacts'>
												<div>
												<img data-value="${wishFran.franId }" class="wish" alt="" src="${cPath }/resources/restaurant/img/heart-on.png" 
													 style="float: right; margin-top: -18px; border: none; height: 30px;">
			                					</div>
												<div style="margin-left: 35px;"><h5>${franInfo.franName }</h5></div>
												<div>Tel : ${franInfo.franTel }</div>
												<br>
												<div>운영시간 : ${franInfo.franSttime } ~ ${franInfo.franEntime }</div>
												<div>브레이크타임 : ${franInfo.franBsttime } ~ ${franInfo.franBentime }</div>
												<div>주소 : ${franInfo.franAdd1 } ${franInfo.franAdd2 }</div>
<%-- 												<div><img alt="" src="${cPath }/resources/restaurant/img/wish-logo.jpg" style="width: 300px;"></div> --%>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:forEach>
						</div>
		            </div>
		    	</div>
			</div>     
		</div>   

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

$(".wish").on('click', function(e){
	var imgSrc= "";
	var substrSrc = "";
	var replaceSrc = "";

	var franId = "";
	franId = e.target.dataset.value;

	imgSrc = $(this).attr("src");
	substrSrc = imgSrc.substr(42);
	console.log(substrSrc);
	
	var on = "${cPath }/resources/restaurant/img/heart-on.png";
	var off = "${cPath }/resources/restaurant/img/heart-off.png"
	
	if(substrSrc == 'off.png'){
		replaceSrc = imgSrc.replace(imgSrc, on);
		$.ajax({
			  type:'post',
			  url:'${cPath }/mypage/wish',
			  dataType:'html',
			  contentType: 'application/json',
			  data : JSON.stringify({status : 'on', franId : franId}),
			  beforeSend : function(xhr)
			  {
			     xhr.setRequestHeader(header,token);
			  },
			  success:function(result){
				  console.log("성공!");
		      }
		});
	}else if(substrSrc == 'on.png'){
		replaceSrc = imgSrc.replace(imgSrc, off);
		$.ajax({
			  type:'post',
			  url:'${cPath }/mypage/wish',
			  dataType:'html',
			  contentType: 'application/json',
			  data : JSON.stringify({status : 'off', franId : franId}),
			  beforeSend : function(xhr)
			  {
			     xhr.setRequestHeader(header,token);
			  },
			  success:function(result){
				  console.log("성공!");
		      }
		});
	}
	
	return $(this).attr("src", replaceSrc);
	
});
</script>