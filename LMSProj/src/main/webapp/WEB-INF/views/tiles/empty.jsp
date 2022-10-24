<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        
        <title>인재대학교</title>
        
        <!-- App favicon -->
        <link rel="shortcut icon" href="/resources/images/logo.png">

		<script src="/resources/js/jquery-3.6.0.js"></script>

        <!-- third party css -->
        <link href="/resources/Hyper/dist/saas/assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="/resources/Hyper/dist/saas/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/resources/Hyper/dist/saas/assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
        <link href="/resources/Hyper/dist/saas/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />
        
    </head>
    <body>
		<div class="container-fluid body">
			<tiles:insertAttribute name="body" />
		</div>
		

    </body>
    
    
	<!-- bundle -->
		<script src="/resources/Hyper/dist/saas/assets/js/vendor.min.js"></script>
		<script src="/resources/Hyper/dist/saas/assets/js/app.min.js"></script>
		
		<!-- third party js -->
<!-- 		<script src="/resources/Hyper/dist/saas/assets/js/vendor/apexcharts.min.js"></script> -->
<!-- 		<script src="/resources/Hyper/dist/saas/assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script> -->
<!-- 		<script src="/resources/Hyper/dist/saas/assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script> -->
		<!-- third party js ends -->
		
		<!-- demo app -->
<!-- 		<script src="/resources/Hyper/dist/saas/assets/js/pages/demo.dashboard.js"></script> -->
		<!-- end demo js-->
</html>