<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

    
<ul class="clear">
	<c:if test="${fn:length(resultList) gt 0}">
		<c:forEach var="result" items="${resultList }">     
			<c:choose>
				<c:when test="${not empty result.poAtchFileId }"> 
					<li onclick="fncPageBoard('view','view.do','${result.poSeq}','poSeq')">       
						<img src="/atch/getImage.do?atchFileId=${result.poAtchFileId }&fileSn=0" style="width:264px; height:318px;" alt="" onerror="/isp/src/main/webapp/publish/ft/images/main/bg_business.png">
						<a href="/ft/port/${category}/view.do?poSeq=${result.poSeq }"><span class="hover_txt"><strong>${result.poTitle }</strong>${result.poRgstDt }</span><span class="more">상세보기 +</span></a>
					</li>  
				</c:when>
				<c:otherwise> 
					<li>
						<img src="https://w7.pngwing.com/pngs/855/341/png-transparent-pokemon-pikachu-pikachu-pokemon-x-and-y-pokemon-go-pokemon-ruby-and-sapphire-ash-ketchum-pokemon-dog-like-mammal-cartoon-snout-thumbnail.png" style="width:264px; height:318px;">
						<a href="/ft/port/${category }/view.do?poSeq=${result.poSeq }"><span class="hover_txt"><strong>${result.poTitle }</strong>${result.poRgstDt }</span><span class="more">상세보기 +</span></a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:if>           
</ul>   

   