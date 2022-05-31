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
			<col style="width:10%">
			<col style="width:10%"> 
			<col>
		</colgroup> 
		<thead>     
			<tr>          
				<th scope="col"><input type="checkbox" id="all_check"></th>
				<th scope="col">이름</th>
				<th scope="col">아이디</th>
				<th scope="col">이메일</th>    
			</tr> 
		</thead>
		<tbody>     
			<c:choose>   
				<c:when test="${fn:length(resultList) gt 0}">     
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor"> 
							<td>    
								<input type="checkbox" name="arr" id="check_${status.index }" value="${result.emSeq }">
							</td> 
							<td>${result.emName }</td>  
							<td>${result.emId }</td>
							<td>${empty result.emMail ? '-' : result.emMail }</td>
						</tr>  
					</c:forEach>  
				</c:when>
				<c:otherwise> 
					<tr><td colspan="4" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>   
</div>   
<%-- //tbl end --%>     
<%-- paging start --%>
<div class="paging_wrap">   
	<div class="paging">   
		<ui:pagination paginationInfo="${paginationInfo}" type="pop" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
		<a href="javascript:void(0);" class="btn btn_mdl btn_save">선택</a>
	</div>
</div>
<%-- //paging end--%>