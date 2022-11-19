<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      서재원      최초작성
* 2022. 8. 5.      서재원      UI 적용 안되는 오류 수정
* 2022. 8. 9.      서재원     상단 공백 생기지 않는 오류 수정
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
		
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<meta name="robots" content="" />
	<meta name="description" content="Davur - Restaurant Bootstrap Admin Dashboard + FrontEnd" />
	<meta property="og:title" content="Davur - Restaurant Bootstrap Admin Dashboard + FrontEnd" />
	<meta property="og:description" content="Davur - Restaurant Bootstrap Admin Dashboard + FrontEnd" />
	<meta property="og:image" content="https://davur.dexignzone.com/dashboard/social-image.png" />
	<meta name="format-detection" content="telephone=no">
    <title>403 - 접근 제한</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <link href="${cPath}/resources/dashboard3/css/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-5">
                    <div class="form-input-content text-center error-page">
                        <h1 class="error-text font-weight-bold">403</h1>
                        <h4><i class="fa fa-thumbs-down text-danger"></i> Forbidden</h4>
                        <p>접근 권한이 없습니다.</p>
						<div>
                            <a class="btn btn-primary" href="javascript:history.back();">뒤로가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<!--**********************************
	Scripts
***********************************-->
<!-- Required vendors -->
<script src="${cPath}/resources/dashboard3/vendor/global/global.min.js"></script>
<script src="${cPath}/resources/dashboard3/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="${cPath}/resources/dashboard3/js/custom.min.js"></script>
<script src="${cPath}/resources/dashboard3/js/deznav-init.js"></script>

</html>