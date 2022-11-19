<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!doctype html>
<html lang="ko">
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

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <title><tiles:getAsString name="title" /></title>
	
	<tiles:insertAttribute name="preScript"/>
    
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .profile{
      	height: 50px;
      	width: 50px;
      }
    </style>

    
    <c:if test="${not empty message }">
    	<script type="text/javascript">
    		alert("${message }");
    	</script>
    	<c:remove var="message" scope="session"/>
    </c:if>
    
  </head>
  <body>
 <div id="main-wrapper">   
	<tiles:insertAttribute name="headerMenu" />

<!-- <div class="container-fluid"> -->
<!--   <div class="row"> -->
	
	<tiles:insertAttribute name="leftMenu" />

<!--     <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4"> -->
    
    	<tiles:insertAttribute name="body"/>
    	
<!--     </main> -->
<!--   </div> -->
<!-- </div> -->
</div>


    <tiles:insertAttribute name="postScript"/>

      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" ></script>
<%-- 	<script src="${cPath}/resources/dashboard3/vendor/sweetalert2/dist/sweetalert2.min.js"></script> --%>
<%--     <script src="${cPath}/resources/dashboard3/js/plugins-init/sweetalert.init.js"></script> --%>
	
  </body>
</html>
    
    