<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

	<!-- board -->
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
		<colgroup>
			<col style="width:5%">
			<col style="width:10%">  
			<col>        
			<col style="width:10%">
			<col style="width:10%">   
		</colgroup>    
		<thead>
			<tr>    
				<th scope="col" class="m_hid">번호</th>
				<th scope="col">게시글 종류</th> 
				<th scope="col">제목</th>   
				<th scope="col">내용</th>    
				<th scope="col">작성일</th>   
			</tr>    
		</thead>   
		<tbody>         
			<c:choose>         
				<c:when test="${fn:length(resultList) gt 0}">     
					<c:forEach var="result" items="${resultList}" varStatus="status">      
						<tr class="cursor" onclick="fncPageBoard('view','viewList.do', '${result.schEtc02}', '${result.schEtc03 }', 'schEtc02, schEtc03')">
							<td class="m_hid">${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.index)}</td>
							<td>게시판 종류</td>   
							<td>제목</td>   
							<td>내용</td> 
							<td>작성일</td>     
						</tr>
					</c:forEach>    
				</c:when>    
				<c:otherwise>     
					<tr class="no_data">
						<td colspan="5">등록된 글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div> 
	<!-- //board -->     
<!-- paging -->     
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
</div>    

<!-- //paging -->
<script type="text/javaScript">
$(".num").each(function(){
	numFormat($(this), 'num');
});
</script>

