<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:forEach var="menu" items="${allMenu }">
	<c:if test="${util:getMenuCd(url).depth1 eq menu.menuCd }">
	<c:set var="depth1" value="${menu.menuNm }"/>
	<c:set var="depth1Cd" value="${menu.menuCd }"/>
	<c:set var="menuList" value="${menu.menuList }"/>
	</c:if>
</c:forEach>
   
<script type="text/javaScript">
</script>   
<div id="left_cont">  
	<h3 class="lnb_tit">${depth1 }</h3>
			<ul class="lnb">    
				<c:forEach var="menuSub" items="${menuList }">
					<c:if test="${util:getMenuCd(url).depth2 eq menuSub.menuCd }">
					<c:set var="depth2" value="${menuSub.menuNm }"/>
					<c:set var="depth2Cd" value="${menuSub.menuCd }"/>
					<c:set var="depth2Url" value="${menuSub.url }"/>
					</c:if>
					<li class="${not empty menuSub.menuList ? 'has_sub' : '' } ${util:getMenuCd(url).depth2 eq menuSub.menuCd ? 'active' : ''}">
						<a href="${not empty menuSub.menuList ? '#' : menuSub.menuCd eq 'cs' ? 'https://analytics.google.com/analytics/web/?hl=ko&pli=1#/report-home/a157536003w221711255p210735021' : menuSub.url }" ${menuSub.menuCd eq 'cs' ? 'target="_blank"' : '' } >${menuSub.menuNm }</a>
						<c:if test="${not empty menuSub.menuList }">
							<ul ${util:getMenuCd(url).depth2 eq util:getMenuCd(menuSub.url).depth2 ? 'style="display:block;"' : ''}>
								 <c:forEach var="menuSub2" items="${menuSub.menuList }">
									 <li><a href="${menuSub2.url }" ${util:getMenuCd(url).depth3 eq menuSub2.menuCd ? 'class="on"' : '' }>${menuSub2.menuNm } </a> </li>
									 <c:if test="${util:getMenuCd(url).depth3 eq menuSub2.menuCd }">
										<c:set var="depth3" value="${menuSub2.menuNm }"/>
									 </c:if>
								 </c:forEach>
							</ul>
						</c:if>  
					</li>
				</c:forEach>
			</ul>    
		</div>   
     
<div class="quick_menu">
		<ul>  
			<li class="quick01">
				<a href="/ft/intro/greet/list.do"><span class="icon_quick"></span><span>인사말</span></a>
			</li>
			<li class="quick02">
				<a href="/ft/guide/advnt/list.do"><span class="icon_quick"></span><span>건축정보</span></a>
			</li>
			<li class="quick03">
				<a href="/ft/cent/free/list.do"><span class="icon_quick"></span><span>자유게시판</span></a>
			</li>
			<li class="quick04">
				<a href="/ft/intro/boundary/list.do"><span class="icon_quick"></span><span>사업영역</span></a>
			</li>
			<li class="btn_top"><strong>Top</strong></li>
		</ul>
	</div>     
   
<div id="right_cont">    
					<h4 class="page_title">${depth2 }</h4>
					<div class="location">
						<a href="/ft/main/main.do"><i class="fa fa-home"></i></a> <span> &gt; ${depth1 } &gt; </span> <strong>${depth2 }</strong>
					</div>

		   