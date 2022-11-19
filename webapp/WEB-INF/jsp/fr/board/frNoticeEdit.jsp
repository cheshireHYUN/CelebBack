<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 24.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%-- <script src="${cPath }/resources/dashboard3/vendor/ckeditor/ckeditor.js"></script> --%>
<script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<form:form modelAttribute="frNotice" action="${cPath }/fr/frNotice/${frNotice.frannoticeNo }" method="post" enctype="multipart/form-data">
<sec:csrfInput/>
<input type="hidden" name="_method" value="put" />
        <!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
            <div class="container-fluid">
				<div class="row page-titles">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4><strong>공지사항 게시판 관리</strong></h4>
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">글 수정</h4>
                            </div>
                            
                            <!-- 본문 -->
                            <div class="card-body custom-ekeditor">
                            	<div style="margin-bottom: 20px;" class="row">
                            		<div>
		                            	<form:input path="postTitle" class="form-control" placeholder="제목"/>
		                            	<form:errors path="postTitle" element="span" cssClass="error" />
                            		</div>
                            	</div>
								<div id="ckeditor" style="margin-bottom: 20px;">
									<form:textarea path="postContent" class="form-control" placeholder="내용" />
									<form:errors path="postContent" element="span" cssClass="error" />
								</div>
								<div style="text-align: right;">
	                                <input type="reset" value="취소" class="btn light btn-secondary" onclick="location.href='${cPath }/fr/frNotice'"/>
									<input type="submit" value="수정" class="btn btn-primary"/>
								</div>
								<security:authentication property="principal" var="authMember"/>
								<form:input path="ownerId" type="hidden" value="${authMember.realMember.ownerId }"/>
                            </div>
                            <!-- 본문 end -->
                            
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
		height: 340,
		filebrowserImageUploadUrl : $.CPATH + "/fr/frNotice/image?command=ImageUpload&${_csrf.parameterName}=${_csrf.token}"
	});
</script>