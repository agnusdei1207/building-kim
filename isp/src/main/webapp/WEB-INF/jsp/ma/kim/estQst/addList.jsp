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
			<col>
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">상태</th>
				<th scope="col">비밀</th>
				<th scope="col" class="subject">제목</th>
				<th scope="col">첨부파일</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>   
		<tbody>
			<c:choose> 
				<c:when test="${fn:length(resultList) gt 0}">   
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" onclick="fncPageBoard('view','view.do','${result.eqSeq}','eqSeq')">
							<td>
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td>   
							<td>
								<c:choose>
									<c:when test="${result.eqState eq 'A'}">
										신청
									</c:when>
									<c:when test="${result.eqState eq 'R'}">
										반려
									</c:when>
									<c:when test="${result.eqState eq 'T'}">
										재신청
									</c:when>
									<c:when test="${result.eqState eq 'P'}">
										승인
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>     
								</c:choose> 
							</td>    
							<td>   
								<c:choose>
									<c:when test="${not empty reuslt.eqPw }">
										비밀 
									</c:when>
									<c:otherwise>         
										공개
									</c:otherwise>    
								</c:choose>  
							</td>
							<td class="subject text_over l" >${result.eqTitle }</td>
							<td>${not empty result.eqAtchFileId ? '📬' : '📫' }</td>
							<td>${result.eqId }</td>
							<td>${result.eqDt }</td>
						</tr> 
					</c:forEach>  
				</c:when>
				<c:otherwise>
					<tr><td colspan="7" class="no_data">데이터가 없습니다.</td></tr>
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