<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

   
	<!-- header  -->
		<div class="gnb_bg"></div>
		<header id="header">
			<div class="header_box">
				<h1 class="logo"><a href="/ft/main/main.do"><img src="/publish/ft/images/common/logo.png" alt="김건축사무소"/></a></h1>
				<div class="util_box">  
					<ul class=" clear"> 
						<c:choose>    
							<c:when test="${empty memberVO }">
								<li><a href="/ft/main/main.do">HOME</a></li>
								<li><a href="/ft/member/login/loginFrm.do">로그인</a></li>
								<li><a href="/ft/member/join/agreeFrm.do">회원가입</a></li>
								<li><a href="/login.do"><i class="fa fa-star"></i>즐겨찾기</a></li>
							</c:when>  
							<c:otherwise>           
								<li><a href="/ft/member/myHome/checkPwFrm.do">${memberVO.meId } 님 마이홈</a></li>
								<li><a href="/ft/member/login/logout.do">로그아웃</a></li>
								<li><a href="/login.do"><i class="fa fa-star"></i>즐겨찾기</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>         
			</div>      
			<!-- GNB -->      
			<h2 class="hidden">주메뉴</h2>     
			<div id="gnb_area">   
				<nav id="gnb">           
					<ul class="depth2 clear">            
						<c:if test="${fn:length(allMenu) gt 0 }">            
							<c:forEach var="main" items="${allMenu }">        
									<c:if test="${(empty memberVO.meSeq and main.menuCd ne 'member') or (not empty memberVO.meSeq)}">
										<li class="depth1_1">
											<a href="${main.url }">${main.menuNm }</a>
											<ul class="depthBox">
												<c:forEach var="sub" items="${main.menuList }">
													<li><a href="${sub.url }">${sub.menuNm }</a></li>
												</c:forEach>
											</ul>
										</li>  
									</c:if> 
							</c:forEach>
						</c:if> 
					</ul>
				</nav>  
			</div>
			<!-- //GNB --> 
		</header>
		<!-- // header   --> 
