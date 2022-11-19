<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 25.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <!-- row -->

                <div class="row">
					<div class="col-lg-12">
                        <div class="card">
<!--                             <div class="card-header"> -->
<!--                                 <h4 class="card-title">Exam Toppers</h4> -->
<!--                             </div> -->
                            <div class="card-body">
                                <div class="table-responsive" style="overflow-x: hidden;">
                                    <table class="table table-responsive-md">
<!--                                         <thead> -->
<!--                                             <tr> -->
<!--                                                 <th style="width: 85%; padding-left: 2%;"><h4><strong>제목</strong></h4></th> -->
<!--                                                 <th style="width: 15%; text-align: right; padding-right: 2%;"><h4><strong>등록일</strong></h4></th> -->
<!--                                             </tr> -->
<!--                                         </thead> -->
                                        <tbody>
                                        	<tr>
							                    <td><h4><strong>${notice.postTitle }</strong></h4></td>
							                    <td style="text-align: right;"><strong>${notice.postDate }</strong></td>
							                </tr>
							                <tr>
							                	<td colspan="2" style="padding: 2%;">${notice.postContent }</td>
							                </tr>
							                <tr>
							                	<td colspan="2" style="padding-left: 2%;">
							                		<c:if test="${not empty notice.attatchList }">
														<c:forEach items="${notice.attatchList }" var="attatch" varStatus="vs">
															첨부파일&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp<a href="${cPath }/fr/Notice/${notice.postNo }/attatch/${attatch.attatchNo}">${attatch.attatchOrgname }</a>
															<c:if test="${not vs.last }"><br></c:if>
														</c:forEach>
													</c:if>
													<c:if test="${empty notice.attatchList }">
														첨부파일 없음
													</c:if>
							                	</td>
							                </tr>
                                        </tbody>
                                    </table>
	                                <div style="width: 50%; text-aligh: left;">
	                                	<input type="button" value="목록" class="btn light btn-success" onclick="location.href='${cPath }/fr/Notice'" />
	                                </div>
									</div>	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!--**********************************
            Content body end
        ***********************************-->

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>