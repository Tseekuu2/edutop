	<%@page contentType="text/html" pageEncoding="UTF-8" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<!DOCTYPE html>
		<html>
		<head>
		<title><sitemesh:write property='title'/>Keris exam</title>
		
		<meta charset="UTF-8">
		<meta name="Subject" content="">
		<meta name="Title" content="">
		<meta name="Description" content="">
		<meta name="Keywords" content="">
		<meta name="author" content=""/>
		<meta property="og:url" content="" />
		<meta property="og:type" content="article" />
		<meta property="og:title" content="" />
		<meta property="og:description" content="" />
		<meta property="og:image" content="" />
		<meta property="fb:app_id" content=""/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport"
		content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes" />
		
		<link rel="shortcut icon" type="image/x-icon" href="img/icon.ico">
		<link rel="stylesheet" type="text/css" href="${ASSETS}/css/common.css">
		<link rel="stylesheet" type="text/css" href="${ASSETS}/css/contents.css">
		<link rel="stylesheet" type="text/css" href="${ASSETS}/css/viewer.css">
		<link rel="stylesheet" type="text/css" href="${ASSETS}/css/customer.css">
		<link rel="stylesheet" type="text/css" href="${ASSETS}/css/home/style.css">
		<link rel="stylesheet" type="text/css" href="${ASSETS}/css/uikit/uikit.min.css" />
		<link rel="stylesheet" type="text/css" href="${ASSETS}/script/owlCarousel/owl.carousel.css" />
		
		<%--		<link rel="stylesheet" type="text/css" href="${ASSETS}/script/mathlive/dist/mathlive.core.css">--%>
		<%--		<link rel="stylesheet" type="text/css" href="${ASSETS}/script/mathlive/dist/mathlive.css">--%>
		
		<script type="text/javascript" src="https://cdn.polyfill.io/v2/polyfill.min.js"></script>
		<script type="text/javascript" src="${ASSETS}/script/uikit/uikit.min.js"></script>
		<script type="text/javascript" src="${ASSETS}/script/vue/vue.js"></script>
		<script type="text/javascript" src="${ASSETS}/script/vue/axios.js"></script>
		<script type="text/javascript" src="${ASSETS}/script/jquery.js"></script>
		<script type="text/javascript" src="${ASSETS}/script/blockUI.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ASSETS}/script/owlCarousel/owl.carousel.js"></script>
		<script type="text/javascript" src="${ASSETS}/script/owlCarousel/owl.carousel2.thumbs.min.js"></script>
		<script type="text/javascript" src="${ASSETS}/script/ui.js"></script>
		
		<script src="https://unpkg.com/vue-router"></script>
		
		<link rel="stylesheet" type="text/css" href="${ASSETS}/script/mathlive/dist/mathlive.core.css">
		<link rel="stylesheet" type="text/css" href="${ASSETS}/script/mathlive/dist/mathlive.css">
		
		<sitemesh:write property='head'/>
		<script>
		
		function loadBody() {
		var sess = '${sessionScope.loginId}';
		
		if (sess == "") {
		window.location.href = '${HOME}';
		}
		}
		</script>
		</head>
		
		<body onload="loadBody()">
		<sitemesh:write property='body'/>
		</body>
		</html>
