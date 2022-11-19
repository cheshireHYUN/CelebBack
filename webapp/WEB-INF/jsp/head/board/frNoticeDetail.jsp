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
                                        <tbody>
                                        	<tr>
							                    <td><h4><strong>[<span>${frNotice.franName }</span>] &nbsp&nbsp${frNotice.postTitle }</strong></h4></td>
							                    <td style="text-align: right;"><strong>${frNotice.postDate }</strong></td>
							                </tr>
							                <tr>
							                	<td colspan="2" style="padding: 2%;">${frNotice.postContent }</td>
							                </tr>
                                        </tbody>
                                    </table>
                                    <div class="row">
	                                    <div style="width: 50%; text-aligh: left;">
	                                    	<input type="button" value="목록" class="btn light btn-success" onclick="location.href='${cPath }/head/frNotice'" />
	                                    </div>
	                                    <div style="width: 50%; text-align: right;">
											<input type="button" class="btn btn-danger" value="삭제" data-value="${frNotice.frannoticeNo }" data-bs-toggle="modal" data-bs-target="#exampleModal" />
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
        <h5 class="modal-title" id="exampleModalLabel">가맹점 공지사항 삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <form action="${cPath }/head/frNotice/${frNotice.frannoticeNo }" method="post" name="frNotice">
       <sec:csrfInput/>
	      <div class="modal-body">
	      		<strong>가맹점 공지사항</strong>입니다.<br>
	      		정말 삭제하시겠습니까? 되돌릴 수 없습니다.
				<input type="hidden" name="_method" value="delete">
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