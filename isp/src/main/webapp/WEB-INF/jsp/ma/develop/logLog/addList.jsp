<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<%-- tbl --%>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i> <span> 전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"><a href="javascript:void(0)" class="btn_excel" id="btn_excel" ><span>엑셀다운로드</span></a></div>
</div>
 
<c:if test="${searchVO.schEtc03 ne '4' }">
	<div class="tbl_wrap">  
		<table class="tbl_col_type01 no_hover" id="fixTable">
			<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
			<colgroup>
				<col style="width:5%;">
			<c:if test="${searchVO.schEtc03 ne '3' }"> 
				<col style="width:10%;">
				<col style="width:10%;">       
	            <col style="width:10%;">
            </c:if> 
	            <col style="width:${searchVO.schEtc03 eq '3' ? '30%;':'15%;'}">
	            <col>
	            <c:if test="${searchVO.schEtc03 eq '2' }">
	            	<col style="width:8%;">
	            </c:if>
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
				<c:if test="${searchVO.schEtc03 ne '3' }">
					<th scope="col">구분</th>
					<th scope="col">ID</th>  
	                <th scope="col">성명</th>
                </c:if>
	                <th scope="col">${searchVO.schEtc03 eq '1' or searchVO.schEtc03 eq '3' ? '접속시간':'최근로그인'}</th>
					<th scope="col">클라이언트IP</th>
				<c:if test="${searchVO.schEtc03 eq '2' }">
					<th scope="col">접속횟수</th>
				</c:if>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(resultList) gt 0}">
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td>${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}</td>
							<c:if test="${searchVO.schEtc03 ne '3' }">
								<td>${result.logDivn eq 'ft' ? '사용자' : '관리자' }</td>
								<td>${result.logId }</td> 
								<td>${result.logId }</td> 
							</c:if>
								<td>${result.logDt }</td>
								<td>${result.logClientIp }</td>
								<c:if test="${searchVO.schEtc03 eq '2' }">
									<td><fmt:formatNumber value="${result.logCnt }" pattern="#,###"/></td>
								</c:if>
							</tr>
						</c:forEach>
					</c:when>  
					<c:otherwise>
						<tr>
							<td colspan="${searchVO.schEtc03 eq '2' ? '7': searchVO.schEtc03 eq '3' ? '3':'6'}" class="no_data">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</c:if>

<c:if test="${searchVO.schEtc03 eq '4' }">
	<div class="tbl_wrap">
		<table class="tbl_col_type01 no_hover" id="fixTable">
			<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
			<colgroup>
				<col style="width:5%;">
				<col style="width:15%;">
				<col style="width:10%;">
	            <col style="width:10%;">
	            <col style="width:15%;">
	            <col>
	            <col style="width:8%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">부서</th>
					<th scope="col">ID</th>
	                <th scope="col">성명</th>
	                <th scope="col">최근로그인</th>
					<th scope="col">최근 접속 IP</th>
					<th scope="col">로그인 실패횟수</th>
				</tr> 
			</thead>  
			<tbody>
				<c:choose> 
					<c:when test="${fn:length(resultList) gt 0}">
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td>${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}</td>
								<td>${result.logDivn }</td>
								<td>${result.logId }</td>
								<td>${result.logId }</td>  
								<td>${result.logDt }</td>
								<td>${result.logClientIp }</td>
								<td><fmt:formatNumber value="${result.logCnt }" pattern="#,###"/></td>
							</tr>
						</c:forEach>
					</c:when> 
					<c:otherwise>
						<tr>
							<td colspan="7" class="no_data">데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>  
			</tbody>
		</table>
	</div>
</c:if>
<%-- //tbl --%>   

<%-- paging --%>
<div class="paging_wrap">
   <div class="paging">
        <div class="paging"><ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" /></div>
    </div>
</div>
<%-- //paging --%> 

<script type="text/javascript"> 
   
$("#btn_excel").click(function(){
	<c:choose>
		<c:when test="${fn:length(resultList) gt 0}">
			fncPageBoard('list','excelDown.do');
		</c:when>
		<c:otherwise>
			alert("데이터가 없습니다.");
		</c:otherwise>
	</c:choose> 
});
              
</script>
