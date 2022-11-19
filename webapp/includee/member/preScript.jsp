<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 4.      황단비      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
  <!-- Favicons-->
    <link rel="shortcut icon" href="${cPath }/resources/restaurant/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${cPath }/resources/restaurant/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${cPath }/resources/restaurant/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${cPath }/resources/restaurant/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${cPath }/resources/restaurant/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${cPath }/resources/restaurant/css/vendors.min.css" rel="stylesheet">
    <link href="${cPath }/resources/restaurant/css/style.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="${cPath }/resources/restaurant/css/wizard.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${cPath }/resources/restaurant/css/custom.css" rel="stylesheet">
	
<script>
/** 
 * jquery에 cpath 상수  
 * javascript 파일에서도 cPath를 쓸 수 있게됨
 */
	$.CPATH = "${cPath}";
</script>