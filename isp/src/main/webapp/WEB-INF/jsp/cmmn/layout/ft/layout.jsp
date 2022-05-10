<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<!doctype html>
<html lang="ko">
<head> 
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>김건축사무소</title>
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="/publish/ft/css/style.css">
	<script type="text/javascript" src="/publish/ft/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/publish/ft/js/common.js"></script>
	<script type="text/javascript" src="/publish/ma/js/board.js"></script>
	<script type="text/javascript" src="/publish/ft/js/jquery.bxslider.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {   
			$('.slider').bxSlider({
				controls:false,
				auto: true,
				autoControls: true, 
				autoControlsCombine:true,
				pager:true,
				pause: 4000
			});
		});
	</script>
 </head> 



<body>
	<div id="skipnavi">
		<a href="#container">▶본문 바로가기</a>
		<a href="#gnb_area">▶주메뉴 바로가기</a>
	</div>
	<div id="wrapper">
        <!-- header --> 
		<tiles:insertAttribute name="header"/>
        <!--// header -->     
        
            <!-- container -->
      <div id="container"> 
      	<div id="content">
	        <!-- header -->     
	        <c:choose>
	        	<c:when test="${url.split('/')[2] ne 'member' }">
					<tiles:insertAttribute name="aside"/>   
	        	</c:when>
	        	<c:otherwise>
	        	</c:otherwise>
	        </c:choose>
	        <!--// header -->     
			<!-- contents -->			
			<tiles:insertAttribute name="body"/>
		</div>
		<!--// contents e -->      
        </div><!-- //container -->
	<tiles:insertAttribute name="footer"/>  
	</div>
    <!-- //wrap -->
 </body>
</html>
			
		 