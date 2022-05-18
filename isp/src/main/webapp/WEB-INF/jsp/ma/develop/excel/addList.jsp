<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:5%">  
			<col style="width:5%">
			<col style="width:5%"> 
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:5%">    
		</colgroup>      
		<thead>  
			<tr>  
				<th scope="col">번호</th>
				<th scope="col" class="subject">접수 번호</th>
				<th scope="col">허가 번호</th> 
				<th scope="col">안테나 전력 합(W)</th> 
				<th scope="col">이동 통신사 지역</th> 
				<th scope="col">시스템 손실</th>    
				<th scope="col">첨부파일</th> 
				<th scope="col">작성일</th>
				<th scope="col">작성자</th>
			</tr> 
		</thead>      
		<tbody>   
			<c:choose>    
				<c:when test="${fn:length(resultList) gt 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" onclick="fncPageBoard('view','view.do','${result.xlSeq}','xlSeq')">
							<td>
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td>    
							<td>${result.xlRcpNum }</td>
							<td>${result.xlLcnsNum }</td>
							<td>${result.xlWatSum }</td>
							<td>${result.xlMobileCrrrArea }</td>
							<td>${result.xlSystemLoss }</td>
							<td>${not empty result.xlAtchFileId ? '📬' : '📫' }</td>
							<td>${result.xlDatePrprt }</td>
							<td>${result.xlWriter }</td>
						</tr>   
					</c:forEach> 
				</c:when>   
				<c:otherwise>
					<tr><td colspan="9" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>  
		</tbody>   
	</table>
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