<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 10.      정아영           최초작성
* 2022. 8. 25.      정아영           수정
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
															첨부파일&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp<a href="${cPath }/head/Notice/${notice.postNo }/attatch/${attatch.attatchNo}">${attatch.attatchOrgname }</a>
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
                                    <div class="row">
	                                    <div style="width: 50%; text-aligh: left;">
	                                    	<input type="button" value="목록" class="btn light btn-success" onclick="location.href='${cPath }/head/Notice'" />
	                                    </div>
	                                    <div style="width: 50%; text-align: right;">
		                                    <input type="button" value="수정" class="btn btn-primary" onclick="location.href='${cPath }/head/Notice/${notice.postNo }/form'" />
											<input type="button" class="btn btn-danger" value="삭제" data-value="${notice.postNo }" data-bs-toggle="modal" data-bs-target="#exampleModal" />
										</div>
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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">공지사항 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <form action="${cPath }/head/Notice/${notice.postNo }" method="post" name="notice">
       <sec:csrfInput/>
	      <div class="modal-body">
	      		글이 삭제됩니다.
				<input type="hidden" name="_method" value="delete">
<%-- 				<input type="hidden" value="${authMember.realMember.adminPw }"> --%>
<!-- 				<input type="password" name="" class="form-control"/> -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn light btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-danger" id="deleteBtn">삭제</button>
	      </div>
		</form>
    </div>
  </div>
</div>

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

	$("#exampleModal").on("hidden.bs.modal", function(){
		$(this).find("form").get(0).reset();
	});
	
</script>