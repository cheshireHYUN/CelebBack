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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%-- <script src="${cPath }/resources/dashboard3/vendor/ckeditor4/ckeditor.js"></script> --%>
<script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<form:form modelAttribute="notice" action="${cPath }/head/Notice" method="post" enctype="multipart/form-data">
<sec:csrfInput/>
        <!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
            <div class="container-fluid">
				<div class="row page-titles">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4><strong>공지사항</strong></h4>
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">글 작성</h4>
                            </div>
                            <div class="card-body custom-ekeditor">
                            	<div style="margin-bottom: 20px;" class="row">
                            		<div style="width: 20%;">
		                            	<form:select class="form-control" path="hnRange">
											<option value>공개범위</option>
											<c:forEach items="${lguList }" var="lgu">
												<option value="${lgu['lguId'] }">${lgu.lguName }</option>
											</c:forEach>
<%-- 											<form:options items="${lguList }"/> --%>
		                            	</form:select>
		                            	<form:errors path="hnRange" element="span" cssClass="error" />	
                            		</div>
                            		<div style="width: 80%;">
		                            	<form:input path="postTitle" class="form-control" placeholder="제목"/>
		                            	<form:errors path="postTitle" element="span" cssClass="error" />
                            		</div>
                            	</div>
								<div id="ckeditor" style="margin-bottom: 20px;">
									<form:textarea path="postContent" class="form-control" placeholder="내용" />
									<form:errors path="postContent" element="span" cssClass="error" />
<%-- 									<form:input type="file" path="files" class="form-control"  multiple="true"/> --%>
								</div>
								<div>
<!-- 									<div style="width: 10%; text-align: center; ">첨부파일</div> -->
<!-- 									<div style="width: 90%;"> -->
										<form:input type="file" path="files" multiple="true" class="form-control" style="padding-top: 16px;"/>
										<form:errors path="files" element="span" cssClass="error" />
<!-- 									</div> -->
								</div>
								<div style="text-align: right; margin-top: 20px;">
	                                <input type="reset" value="취소" class="btn light btn-secondary" onclick="window.history.back()"/>
									<input type="submit" value="등록" class="btn btn-primary"/>
								</div>
								<security:authentication property="principal" var="authMember"/>
								<form:input path="postWriter" type="hidden" value="${authMember.realMember.adminId }"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
</form:form>        

<script type="text/javascript">
	CKEDITOR.replace('postContent', {
		height: 265,
		filebrowserImageUploadUrl : $.CPATH + "/head/Notice/image?command=ImageUpload&${_csrf.parameterName}=${_csrf.token}"
	})
</script>