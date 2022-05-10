<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
     
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
           
<div class="content_box">  
	<ul class="thum_list">              
		<c:if test="${fn:length(resultList) gt 0 }">        
			<c:forEach var="portVO" items="${resultList}">   
				<li>      
					<a href="javascript:void(0)" onclick="fncPageBoard('view','view.do','${portVO.poSeq}','poSeq')"> 
						<c:choose>
							<c:when test="${not empty portVO.poAtchFileId }">
								<img src="/atch/getImage.do?atchFileId=${portVO.poAtchFileId }&fileSn=0"  style="width:318px;" alt="" onerror="/isp/src/main/webapp/publish/ft/images/toa-heftiba-FV3GConVSss-unsplash.jpg"  >
							</c:when>
							<c:otherwise>
								<img src="https://w7.pngwing.com/pngs/855/341/png-transparent-pokemon-pikachu-pikachu-pokemon-x-and-y-pokemon-go-pokemon-ruby-and-sapphire-ash-ketchum-pokemon-dog-like-mammal-cartoon-snout-thumbnail.png"  style="width:318px; height:212px;"   >
							</c:otherwise>
						</c:choose>     
						<h5 class="thum_tit">${portVO.poTitle }</h5>
						<p>${portVO.poRgstDt }</p>   
					</a>    
				</li>    
			</c:forEach>   
		</c:if>           
	</ul>            
</div>  
				       
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
		<a href="javascript:void(0)" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>
	</div>
</div>
<%-- //paging end--%>